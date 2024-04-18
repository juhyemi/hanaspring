package com.hana.controller;

import com.hana.app.data.dto.MemberDto;
import com.hana.app.service.MemberService;
import jakarta.servlet.http.HttpSession;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import java.lang.reflect.Member;
import java.util.List;

@Controller
@RequestMapping("/member")
@Slf4j
@RequiredArgsConstructor
public class MemberController {
    final MemberService memberService;
    String path="member/";
    @RequestMapping("/login")
    String login(Model model) throws Exception{
        log.info("checking");
        model.addAttribute("center",path+"login");
        return "index";
    }
//    @RequestMapping("/join")
//    String join(Model model) throws Exception{
//        model.addAttribute("center",path+"join");
//        return "index";
//    }
    @RequestMapping("/join2")
    String join2(Model model) throws Exception{
        model.addAttribute("center",path+"join2");
        return "index";
    }
    @RequestMapping("/idFind")
    String idFind() throws Exception{
        return path+"idFind";
    }
    @RequestMapping("/passwordFind")
    String passwordFind() throws Exception{
        return path+"passwordFind";
    }
    @RequestMapping("/registercheckid")
    @ResponseBody
    int registercheckid(@RequestParam("id") String id) throws Exception{
        MemberDto dto = memberService.get(id);
        if(dto==null) return 1;
        return 0;
    }
    @RequestMapping("/loginimpl")
    @ResponseBody
    int loginimpl(@RequestParam("id") String id, @RequestParam("pwd") String pwd, HttpSession httpSession) throws Exception{
        MemberDto dto = memberService.get(id);
        if(dto==null) return 1;
        if(!dto.getMemberPw().equals(pwd)) return 2;
        httpSession.setAttribute("id",id);
        httpSession.setAttribute("name",dto.getMemberName());
        return 0;
    }
    @RequestMapping("/logout")
    String logout(HttpSession httpSession){
        if(httpSession != null){
            httpSession.invalidate();
        }
        return "redirect:/";
    }
}
