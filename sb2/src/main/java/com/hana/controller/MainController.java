package com.hana.controller;

import com.hana.app.data.dto.BoardDto;
import com.hana.app.data.dto.CustDto;
import com.hana.app.service.BoardService;
import com.hana.app.service.CustService;
import com.hana.util.WeatherUtil;
import com.hana.util.WeatherUtil2;
import jakarta.servlet.http.HttpSession;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.json.simple.parser.ParseException;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import java.io.IOException;
import java.util.HashMap;
import java.util.List;
import java.util.Random;

@Controller
@Slf4j
@RequiredArgsConstructor
public class MainController {
    final CustService custService;
    final BoardService boardService;

    @Value("${app.key.wkey}")
    String wkey;
    @Value("${app.key.whkey}")
    String whkey;
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
    @RequestMapping("/logout")
    String login(Model model, HttpSession httpSession){
        if(httpSession != null){
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
            if(!custDto.getPwd().equals(pwd)){
                throw new Exception();
            }
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
            custService.add(custDto);
            httpSession.setAttribute("id",custDto.getId());
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
    @RequestMapping("/weatherpage")
    public String weatherpage(Model model){
        model.addAttribute("left","left");
        model.addAttribute("center","weather");
        return "index";
    }
}
