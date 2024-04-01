package com.hana.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/item")
public class ItemController {
    String dir = "item/";
    @RequestMapping("/")
    public String main(Model model){
        model.addAttribute("left",dir+"left");
        model.addAttribute("center",dir+"center");
        return "index";
    }
    @RequestMapping("/item1")
    public String item1(Model model){
        model.addAttribute("left",dir+"left");
        model.addAttribute("center",dir+"item1");
        return "index";
    }
    @RequestMapping("/item2")
    public String item2(Model model){
        model.addAttribute("left",dir+"left");
        model.addAttribute("center",dir+"item2");
        return "index";
    }
    @RequestMapping("/item3")
    public String item3(Model model){
        model.addAttribute("left",dir+"left");
        model.addAttribute("center",dir+"item3");
        return "index";
    }

}
