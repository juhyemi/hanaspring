package com.hana.controller;

import com.hana.app.data.dto.InqueryDto;
import com.hana.app.data.dto.NoticeDto;
import com.hana.app.data.dto.QnaDto;
import com.hana.app.service.InqueryService;
import com.hana.app.service.QnaService;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import java.util.List;

@RequestMapping("/support")
@Controller
@Slf4j
@RequiredArgsConstructor
public class SupportController {
    final InqueryService inqueryService;
    final QnaService qnaService;
    String path="support/";
    //문의사항 작성 링크
    @RequestMapping("/inquiry")
    String inquiry(Model model) throws Exception{
        model.addAttribute("center",path+"inquiry");
        return "index";
    }
    //문의사항 등록
    @RequestMapping("/addInquery")
    String addInquery(InqueryDto dto) throws Exception{
        log.info(dto.toString());
        inqueryService.add(dto);
        return "redirect:/";
    }
    //묻고답하기 링크
    @RequestMapping("/qna")
    String qna(Model model) throws Exception{
        List<QnaDto> qnaList = qnaService.get();
        qnaList.forEach(c->log.info(c.toString()));
        model.addAttribute("center",path+"qna");
        model.addAttribute("qList", qnaList);
        return "index";
    }
    //묻고답하기 클릭시 비밀번호 작성 링크
    @RequestMapping("/enterPassword/{no}")
    String enterPassword(Model model, @PathVariable("no") int no) throws Exception{
        model.addAttribute("selectNo", no);
        return path+"enterPassword";
    }
    //비밀번호 입력시 확인
    @RequestMapping("/qnaDetail/{no}")
    String qnaDetail(@PathVariable("no") int selno, Model model) throws Exception{
        QnaDto dto = qnaService.get(selno);
        model.addAttribute("getQna",dto);
        model.addAttribute("center",path+"qnaDetail");
        return "index";
    }
    //묻고답하기 비밀번호 확인 후 결과값
    @RequestMapping("/checkpwd")
    @ResponseBody
    String enterPassword(@RequestParam("selno") int selno, @RequestParam("pwd") String pwd) throws Exception{
        QnaDto dto = qnaService.get(selno);
        if(pwd.equals(dto.getQnaPw())) return"1";
        return "0";
    }
    //qna검색
    @RequestMapping("/search")
    @ResponseBody
    List<QnaDto> search(@RequestParam("category") String category, @RequestParam("word") String word) throws Exception{
        List<QnaDto> searchList = qnaService.getSearch(category, word);
        log.info("search gogo====================================");
        searchList.forEach(c->{log.info(c.toString());});
        return searchList;
    }
}
