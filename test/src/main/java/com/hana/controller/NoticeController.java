package com.hana.controller;

import com.hana.app.data.dto.NoticeDto;
import com.hana.app.service.NoticeService;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@RequestMapping("/notice")
@Controller
@Slf4j
@RequiredArgsConstructor
public class NoticeController {
    final NoticeService noticeService;
    String path = "notice/";
    @RequestMapping("/list")
    String noticeList(@RequestParam(value = "searchList", required = false) List<NoticeDto> searchList, Model model) throws Exception{
        if(searchList==null) {
            model.addAttribute("center", path + "list");
            List<NoticeDto> ls = noticeService.get();
            model.addAttribute("noticeList", ls);
        }else{
            model.addAttribute("center",path+"list");
            model.addAttribute("noticeList",searchList);
        }
        return "index";
    }
    @RequestMapping("/detail/{no}")
    String noticeDetail(@PathVariable("no") String no, Model model) throws Exception{
        NoticeDto dto = noticeService.get(no);
        log.info(dto.toString());
        model.addAttribute("center",path+"detail");
        model.addAttribute("noticeDetail",dto);
        return "index";
    }
    //검색 결과 날림
    @RequestMapping("/search")
    @ResponseBody
    List<NoticeDto> search(@RequestParam("category") String category, @RequestParam("word") String word) throws Exception{
       List<NoticeDto> searchList = noticeService.getSearch(category, word);
       log.info("search gogo====================================");
       searchList.forEach(c->{log.info(c.toString());});
        return searchList;
    }
}
