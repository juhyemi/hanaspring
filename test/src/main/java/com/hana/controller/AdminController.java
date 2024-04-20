package com.hana.controller;

import com.hana.app.data.dto.AdminDto;
import com.hana.app.data.dto.MemberDto;
import com.hana.app.data.dto.NoticeDto;
import com.hana.app.service.AdminService;
import com.hana.app.service.MemberService;
import com.hana.app.service.NoticeService;
import jakarta.servlet.http.HttpSession;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import java.lang.reflect.Member;
import java.util.List;

@Controller
@Slf4j
@RequiredArgsConstructor
public class AdminController {
    final MemberService memberService;
    final AdminService adminService;
    final NoticeService noticeService;
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
        String str = "회원목록 "+String.valueOf(memberList.size())+"건";
        model.addAttribute("mList",memberList);
        model.addAttribute("listcnt",str);
        return path+"adminMain";
    }
    //공지사항 수정 페이지
    @RequestMapping("/admin/adminnoticeview/{no}")
    String noticeview(@PathVariable("no") String no, Model model) throws Exception{
        NoticeDto dto = noticeService.get(no);
        model.addAttribute("center","adminNoticeView");
        model.addAttribute("nDto",dto);
        return path+"adminMain";
    }
    //공지사항 수정기능
    @RequestMapping("/admin/noticemodify")
    @ResponseBody
    int noticeview(@RequestParam("no") int no, @RequestParam("content") String content, Model model) throws Exception{
        NoticeDto dto = NoticeDto.builder().build();
        dto.setNoticeIdx(no);
        dto.setNoticeContent(content);
        int k = noticeService.modify(dto);
        if(k>0) return k;
        return 0;
    }
    //공지사항관리 페이지이동
    @RequestMapping("/admin/adminnotice")
    String adminnotice(Model model) throws Exception{
        List<NoticeDto> noticeList = noticeService.get();
        String str = "목록 "+String.valueOf(noticeList.size())+"건";
        model.addAttribute("center","adminNotice");
        model.addAttribute("nList", noticeList);
        model.addAttribute("cnt",str);
        return path+"adminMain";
    }
    //공지사항 글쓰기 페이지 이동
    @RequestMapping("/admin/writepage")
    String writepage(Model model) throws Exception{
        model.addAttribute("center","adminNoticeWrite");
        return path+"adminMain";
    }
    //카테고리별 검색
    @RequestMapping("/admin/searchword")
    @ResponseBody
    List<MemberDto> search(@RequestParam("category") String category, @RequestParam("word") String word) throws Exception{
        word = word.toLowerCase();
        List<MemberDto> searchList = memberService.getSearch(category, word);
        return searchList;
    }
    //전체에서 검색하기
    @RequestMapping("/admin/searchtotal")
    @ResponseBody
    List<MemberDto> searchtotal(@RequestParam("word") String word) throws Exception{
        word = word.toLowerCase();
        List<MemberDto> searchList = memberService.getSearchtotal(word);
        return searchList;
    }
    //회원관리 순서 정렬 기능
    @RequestMapping("/admin/searchorder")
    @ResponseBody
    List<MemberDto> searchtotal(@RequestParam("standard") String standard, @RequestParam("sortorder") String sortorder) throws Exception{
        List<MemberDto> searchList = memberService.getsearchsort(standard,sortorder);
        return searchList;
    }
    //회원관리 개수별 보기 기능
    @RequestMapping("/admin/searchcnt")
    @ResponseBody
    List<MemberDto> searchcnt(@RequestParam("cnt") String cnt) throws Exception{
        List<MemberDto> searchList = null;
        if(cnt.equals("all")){
            searchList = memberService.get();
        }else{
            searchList = memberService.getsearchcnt(cnt);
        }
        return searchList;
    }
    //공지사항 작성기능
    @RequestMapping("/admin/noticewrite")
    @ResponseBody
    int noticewrite(@RequestParam("title") String title, @RequestParam("content") String content, HttpSession session) throws Exception {
        NoticeDto noticeDto = NoticeDto.builder().build();
        noticeDto.setNoticeContent(content);
        noticeDto.setNoticeTitle(title);
        noticeDto.setNoticeMemberId((String) session.getAttribute("id"));
        log.info(noticeDto.toString());
        noticeService.add(noticeDto);
        return 0;
    }
    //공지사항 전체 검색
    @RequestMapping("/admin/noticetotal")
    @ResponseBody
    List<NoticeDto> noticetotal(@RequestParam("keyword1") String keyword1) throws Exception{
        keyword1 = keyword1.toLowerCase();
        List<NoticeDto> searchList = noticeService.noticetotal(keyword1);
        log.info(searchList.toString());
        return searchList;
    }
    //공지사항 카테고리별 검색
    @RequestMapping("/admin/noticesearchword")
    @ResponseBody
    List<NoticeDto> noticesearchword(@RequestParam("category") String category, @RequestParam("word") String word) throws Exception{
        word = word.toLowerCase();
        List<NoticeDto> searchList = noticeService.getSearch(category, word);
        return searchList;
    }
    //공지사항 순서 정렬 기능
    @RequestMapping("/admin/noticesearchorder")
    @ResponseBody
    List<NoticeDto> noticesearchorder(@RequestParam("standard") String standard, @RequestParam("sortorder") String sortorder) throws Exception{
        List<NoticeDto> searchList = noticeService.getsearchsort(standard,sortorder);
        log.info(searchList.toString());
        return searchList;
    }
    //공지사항 개수별 보기 기능
    @RequestMapping("/admin/noticesearchcnt")
    @ResponseBody
    List<NoticeDto> noticesearchcnt(@RequestParam("cnt") String cnt) throws Exception{
        List<NoticeDto> searchList = null;
        if(cnt.equals("all")){
            searchList = noticeService.get();
        }else{
            searchList = noticeService.getsearchcnt(cnt);
        }
        return searchList;
    }
}
