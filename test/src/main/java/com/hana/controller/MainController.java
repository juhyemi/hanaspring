package com.hana.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import java.util.List;
import java.util.Random;

@Controller
public class MainController {
    @RequestMapping("/")
    String main(Model model) throws Exception{

        return "index";
    }
}