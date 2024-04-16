package com.hana.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;


@Controller
public class AdminController {
    String path="admin/";
    @RequestMapping("/admin")
    String admin(Model model) throws Exception{
        model.addAttribute("center",path+"adminLogin");
        return"index";
    }
}
