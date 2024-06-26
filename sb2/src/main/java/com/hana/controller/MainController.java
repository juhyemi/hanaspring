package com.hana.controller;

import com.hana.app.data.dto.BoardDto;
import com.hana.app.data.dto.CustDto;
import com.hana.app.data.dto.OcrDto;
import com.hana.app.data.entity.LoginCust;
import com.hana.app.repository.LoginCustRepository;
import com.hana.app.service.BoardService;
import com.hana.app.service.CustService;
import com.hana.util.*;
import jakarta.servlet.http.HttpSession;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.json.simple.JSONObject;
import org.json.simple.parser.ParseException;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import java.io.IOException;
import java.util.*;

@Controller
@Slf4j
@RequiredArgsConstructor
public class MainController {
    final CustService custService;
    final BoardService boardService;
    final BCryptPasswordEncoder encoder;
    final LoginCustRepository loginCustRepository;

    @Value("${app.key.wkey}")
    String wkey;
    @Value("${app.key.whkey}")
    String whkey;
    @Value("${app.url.serverurl}")
    String serverurl;
    @Value("${app.url.chatboturl}")
    String chatboturl;
    @Value("${app.dir.uploadimgdir}")
    String uploadImgDir;
    @Value("${app.key.ncp-id}")
    String ncpId;
    @Value("${app.key.ncp-secret}")
    String ncpSecret;
    @RequestMapping("/")
    String main(Model model) throws Exception{
        Random r = new Random();
        int num = r.nextInt(100);
        List<BoardDto> list = null;
        try{
            list = boardService.getRank();
            model.addAttribute("ranks",list);

        }catch(Exception e){
            model.addAttribute("ranks",null);

        }
        log.info(num+"");
        return "index";
    }
    @RequestMapping("/login")
    String login(Model model){
        model.addAttribute("center","login");
        return "index";
    }
    @RequestMapping("/saveimg")
    @ResponseBody
    String saveimg(@RequestParam("file") MultipartFile file)throws IOException{
        String imgname = file.getOriginalFilename();
        FileUploadUtil.saveFile(file,uploadImgDir);
        return imgname;
    }
    @RequestMapping("/logoutimpl")
    String logout(Model model, HttpSession httpSession){
        log.info("start Logout----------------------------------------");
        if(httpSession != null){
            loginCustRepository.deleteById((String) httpSession.getAttribute("id"));
            httpSession.invalidate(); //서버에서는 다시 저장하지 않는다.
        }
        return "index";
    }
    @RequestMapping("/register")
    String register(Model model){
        model.addAttribute("center","register");
        return "index";
    }
    @RequestMapping("/loginimpl")
    String loginimpl(Model model, @RequestParam("id") String id, @RequestParam("pwd") String pwd, HttpSession httpSession){
        CustDto custDto;
        try {
            custDto = custService.get(id);
            if(custDto==null){
                throw new Exception();
            }
            if(!encoder.matches(pwd,custDto.getPwd())){
                throw new Exception();
            }
            Optional<LoginCust> loginCust = loginCustRepository.findById(id);
                    //optional은 null checking, nullpointexception 동작안하려고 나옴
            if(loginCust.isPresent()){
                throw new Exception();
            }
            loginCustRepository.save(LoginCust.builder().loginId(id).build());

            httpSession.setAttribute("id",id);
        } catch (Exception e) {
            //throw new RuntimeException(e);
            model.addAttribute("msg", "로그인 되어 있습니다.");
            model.addAttribute("center", "login");
            return "index";
        }
        return "redirect:/";
    }
    @RequestMapping("/registerimpl")
    String registerimpl(Model model, CustDto custDto, HttpSession httpSession){

        try {
            custDto.setPwd(encoder.encode(custDto.getPwd()));
            custDto.setName(StringEnc.encryptor(custDto.getName()));
            custService.add(custDto);
            httpSession.setAttribute("id",custDto.getId());
            loginCustRepository.save(LoginCust.builder().loginId(custDto.getId()).build());
        } catch (Exception e) {
            //throw new RuntimeException(e);
            model.addAttribute("center", "registerfail");
        }
        return "index";
    }
    @RequestMapping("/userinfo")
    String userinfo(Model model, @RequestParam("id") String id){
        CustDto userInfo = null;
        try {
            userInfo = custService.get(id);
            model.addAttribute("center","loginDetail");
            model.addAttribute("left","infoleft");
            model.addAttribute("userInfo", userInfo);
        } catch (Exception e) {
            //throw new RuntimeException(e);

        }
        return "index";
    }

    @RequestMapping("/registercheckid")
    @ResponseBody
    public Object registercheckid(@RequestParam("id") String id) throws Exception{
        String result="0";
        CustDto custDto = custService.get(id);
        if(custDto==null){
            result="1";
        }
        return result;
    }
    @RequestMapping("/wh")
    @ResponseBody
    public Object wh(Model model) throws IOException, ParseException {
        return WeatherUtil.getWeather("109",wkey);
    }
    @RequestMapping("/weather")
    @ResponseBody
    public Object weather(Model model) throws IOException, ParseException {
        return WeatherUtil2.getWeather2("1835848", whkey);
    }
    @RequestMapping("/chat")
    public String chat(Model model) throws IOException, ParseException {
        model.addAttribute("center","chat");
        model.addAttribute("serverurl",serverurl);
        return "index";
    }
    @RequestMapping("/weatherpage")
    public String weatherpage(Model model){
        model.addAttribute("left","left");
        model.addAttribute("center","weather");
        return "index";
    }

    @RequestMapping("/pic")
    String pic(Model model){
        model.addAttribute("center","pic");
        return "index";
    }
    @RequestMapping("/summary")
    String summary(Model model){
        model.addAttribute("center","summary");
        return "index";
    }
    @RequestMapping("/summaryimpl")
    @ResponseBody
    Object summaryimpl(@RequestParam("content") String content){
        JSONObject result = (JSONObject) NcpUtil.getSummary(ncpId, ncpSecret, content);
        log.info(result.toJSONString());
        return result;
    }
    @RequestMapping("/chat2")
    String chat2(Model model){
        model.addAttribute("serverurl", serverurl);
        model.addAttribute("center","chat2");
        return "index";
    }
    @RequestMapping("/ocr")
    String ocr(Model model){
        model.addAttribute("center","ocr");
        return "index";
    }
    @RequestMapping("/ocrimpl")
    public String ocrimpl(Model model, OcrDto ocrDto){
        String imagename = ocrDto.getImage().getOriginalFilename();
        FileUploadUtil.saveFile(ocrDto.getImage(),uploadImgDir);
        JSONObject jsonObject = (JSONObject) OCRUtil.getResult(uploadImgDir,imagename);
        Map<String, String> map = OCRUtil.getData(jsonObject);

        model.addAttribute("center", "ocr");
        model.addAttribute("result", map);
        model.addAttribute("imgname", imagename);
        return "index";
    }
    @RequestMapping("/chatbot")
    String chatbot(Model model){
        model.addAttribute("chatboturl", chatboturl);
        model.addAttribute("center","chatbot");
        return "index";
    }
}
