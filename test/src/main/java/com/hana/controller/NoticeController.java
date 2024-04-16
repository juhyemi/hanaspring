package com.hana.controller;

import lombok.extern.slf4j.Slf4j;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

@RequestMapping("/notice")
@Controller
@Slf4j
public class NoticeController {
    String path = "notice/";
    @RequestMapping("/list")
    String noticeList(Model model) throws Exception{
        model.addAttribute("center",path+"list");
        return "index";
    }
    @RequestMapping("/detail")
    String noticeDetail(Model model) throws Exception{
        log.info("들어오나?");
        model.addAttribute("center",path+"detail");
        return "index";
    }
}
