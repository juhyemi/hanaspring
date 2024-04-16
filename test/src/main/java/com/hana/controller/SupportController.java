package com.hana.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

@RequestMapping("/support")
@Controller
public class SupportController {
    String path="support/";
    @RequestMapping("/inquiry")
    String inquiry(Model model) throws Exception{
        model.addAttribute("center",path+"inquiry");
        return "index";
    }
    @RequestMapping("/qna")
    String qna(Model model) throws Exception{
        model.addAttribute("center",path+"qna");
        return "index";
    }
    @RequestMapping("/enterPassword")
    String enterPassword(Model model) throws Exception{
        return path+"enterPassword";
    }
    @RequestMapping("/qnaDetail")
    String qnaDetail(Model model) throws Exception{
        model.addAttribute("center",path+"qnaDetail");
        return "index";
    }
}
