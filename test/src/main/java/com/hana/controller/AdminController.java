package com.hana.controller;

import com.hana.app.data.dto.AdminDto;
import com.hana.app.data.dto.MemberDto;
import com.hana.app.data.dto.NoticeDto;
import com.hana.app.service.AdminService;
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
@Slf4j
@RequiredArgsConstructor
public class AdminController {
    final MemberService memberService;
    final AdminService adminService;
    String path="admin/";
    //관리자 로그인페이지
    @RequestMapping("/admin")
    String admin(Model model) throws Exception{
        model.addAttribute("center",path+"adminLogin");
        return"index";
    }
    //관리자 로그인
    @RequestMapping("/admin/loginimpl")
    @ResponseBody
    int loginimpl(@RequestParam("id") String id, @RequestParam("pwd") String pwd, HttpSession httpSession) throws Exception{
        AdminDto dto = adminService.get(id);
        if(dto==null) return 1;
        if(!dto.getMemberPw().equals(pwd)) return 2;
        httpSession.setAttribute("id",id);
        httpSession.setAttribute("name",dto.getMemberName());
        return 0;
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
    //카테고리별 검색
    @RequestMapping("/admin/searchword")
    @ResponseBody
    List<MemberDto> search(@RequestParam("category") String category, @RequestParam("word") String word) throws Exception{
        List<MemberDto> searchList = memberService.getSearch(category, word);
        return searchList;
    }
    //전체에서 검색하기
    @RequestMapping("/admin/searchtotal")
    @ResponseBody
    List<MemberDto> searchtotal(@RequestParam("word") String word) throws Exception{
        List<MemberDto> searchList = memberService.getSearchtotal(word);
        return searchList;
    }
}
