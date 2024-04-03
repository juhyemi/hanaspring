package com.hana.controller;

import com.hana.app.data.dto.CustDto;
import jakarta.servlet.http.HttpSession;
import lombok.extern.slf4j.Slf4j;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import java.util.HashMap;

@Controller
@Slf4j
public class MainController {
    @RequestMapping("/")
    String main(){
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
        model.addAttribute("center","login");
        if(id.equals("qqq") && pwd.equals("111")){
            //httpSession.setMaxInactiveInterval(80000); //셋팅 안하면 15분, 은행에서 세션 만료 시간 나오는거 이걸로 설정
            log.info(id);
            httpSession.setAttribute("id",id);
        }else{
            model.addAttribute("center", "loginfail");
        }
        return "index";
    }
    @RequestMapping("/registerimpl")
    String registerimpl(CustDto custDto, HttpSession httpSession){
        log.info(custDto.getId());
        log.info(custDto.getName());
        httpSession.setAttribute("id",custDto.getId());
        return "index";
    }

}
