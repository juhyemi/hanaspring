package com.hana.controller;

import com.hana.app.data.dto.MemberDto;
import com.hana.app.service.MemberService;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import java.util.List;

@Controller
@Slf4j
@RequiredArgsConstructor
public class AdminController {
    final MemberService memberService;
    String path="admin/";
    //관리자 로그인페이지
    @RequestMapping("/admin")
    String admin(Model model) throws Exception{
        model.addAttribute("center",path+"adminLogin");
        return"index";
    }
    //회원관리 페이지 이동
    @RequestMapping("/admin/adminmember")
    String adminmember(Model model) throws Exception{
        List<MemberDto> memberList = memberService.get();
        model.addAttribute("mList",memberList);
        return path+"adminMain";
    }
    //공지사항관리 페이지이동
    @RequestMapping("/admin/adminnotice")
    String adminnotice(Model model) throws Exception{
        log.info("notice check===============");
        model.addAttribute("center","adminNotice");
        return path+"adminMain";
    }
}
