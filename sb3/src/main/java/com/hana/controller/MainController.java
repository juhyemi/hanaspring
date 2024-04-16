package com.hana.controller;

import com.hana.app.data.dto.BoardDto;
import com.hana.app.data.dto.CustDto;
import com.hana.app.data.entity.LoginCust;
import com.hana.app.repository.LoginCustRepository;
import com.hana.app.service.BoardService;
import com.hana.app.service.CustService;
import com.hana.util.StringEnc;
import com.hana.util.WeatherUtil;
import com.hana.util.WeatherUtil2;
import jakarta.servlet.http.HttpSession;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.json.simple.parser.ParseException;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import java.io.IOException;
import java.util.List;
import java.util.Random;

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
            LoginCust loginCust = LoginCust.builder().loginId(id).build();
            loginCustRepository.save(loginCust);

            httpSession.setAttribute("id",id);
        } catch (Exception e) {
            //throw new RuntimeException(e);
            model.addAttribute("msg", "ID 또는 PWD가 틀렸습니다.");
            model.addAttribute("center", "login");
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
}
