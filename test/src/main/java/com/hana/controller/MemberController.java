package com.hana.controller;

import lombok.extern.slf4j.Slf4j;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/member")
@Slf4j
public class MemberController {
    String path="member/";
    @RequestMapping("/login")
    String login(Model model) throws Exception{
        log.info("checking");
        model.addAttribute("center",path+"login");
        return "index";
    }
    @RequestMapping("/join")
    String join(Model model) throws Exception{
        model.addAttribute("center",path+"join");
        return "index";
    }
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
}
