package com.hana.controller;

import com.hana.app.data.dto.MemberDto;
import com.hana.app.service.MemberService;
import jakarta.servlet.http.HttpSession;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestBody;
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
    //로그인 페이지 이동
    @RequestMapping("/login")
    String login(Model model) throws Exception{
        log.info("checking");
        model.addAttribute("center",path+"login");
        return "index";
    }
    //회원가입 페이지이동
    @RequestMapping("/join2")
    String join2(Model model) throws Exception{
        model.addAttribute("center",path+"join2");
        return "index";
    }
    //아이디 찾기 페이지 이동
    @RequestMapping("/idFind")
    String idFind() throws Exception{
        return path+"idFind";
    }
    //비밀번호 찾기 페이지 이동
    @RequestMapping("/passwordFind")
    String passwordFind() throws Exception{
        return path+"passwordFind";
    }
    //회원가입시 아이디 확인
    @RequestMapping("/registercheckid")
    @ResponseBody
    int registercheckid(@RequestParam("id") String id) throws Exception{
        MemberDto dto = memberService.get(id);
        if(dto==null) return 1;
        return 0;
    }
    //회원가입 기능
    @RequestMapping("/join")
    String join(MemberDto memberDto) throws Exception{
        log.info(memberDto.toString());
        int n = memberService.add(memberDto);
        return  "index";
    }

    //로그인 기능
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
    //로그아웃 기능
    @RequestMapping("/logout")
    String logout(HttpSession httpSession){
        if(httpSession != null){
            httpSession.invalidate();
        }
        return "redirect:/";
    }
    //아이디 찾기 기능
    @RequestMapping("findidimpl")
    @ResponseBody
    public String findidimpl(@RequestParam("name") String name, @RequestParam("email") String email) throws Exception {
        String findid = memberService.getId(name, email);
        String msg = "회원정보가 없습니다.";
        if(findid!=null){
            msg ="회원님의 아이디는 "+findid+" 입니다.";
        }
        return msg;
    }
    //비밀번호 찾기 기능
    @RequestMapping("findpwdimpl")
    @ResponseBody
    public String findidimpl(@RequestParam("id") String id, @RequestParam("name") String name, @RequestParam("email") String email) throws Exception {
        log.info(id+" "+name+" "+email);
        String findpwd = memberService.getPwd(id, name, email);
        log.info(findpwd);
        String msg = "회원정보가 없습니다.";
        if(findpwd!=null){
            msg ="회원님의 암호는 "+findpwd+" 입니다.";
        }
        return msg;
    }
}
