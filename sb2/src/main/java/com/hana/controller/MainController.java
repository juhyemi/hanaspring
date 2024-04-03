package com.hana.controller;

import com.hana.app.data.dto.CustDto;
import com.hana.app.service.CustService;
import jakarta.servlet.http.HttpSession;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import java.util.HashMap;
import java.util.List;

@Controller
@Slf4j
@RequiredArgsConstructor
public class MainController {
    final CustService custService;
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
            model.addAttribute("center", "loginfail");
        }
        return "index";
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

}
