package com.hana.controller;

import com.hana.app.data.dto.CustDto;
import com.hana.app.service.CustService;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import java.util.ArrayList;
import java.util.List;

@Controller
@RequestMapping("/cust")
@RequiredArgsConstructor
public class CustController {
    final CustService custService;
    String dir = "cust/";
    @RequestMapping("/")
    public String main(Model model){
        model.addAttribute("left",dir+"left");
        model.addAttribute("center",dir+"center");
        return "index";
    }
    @RequestMapping("/cust1")
    public String custAdd(Model model){
        model.addAttribute("left",dir+"left");
        model.addAttribute("center",dir+"custAdd");
        return "index";
    }
    @RequestMapping("/cust2")
    public String cust2(Model model){
        List<CustDto> ls = null;
        try {
            ls = custService.get();
            model.addAttribute("custs", ls);
            model.addAttribute("left",dir+"left");
            model.addAttribute("center",dir+"custGet");
        } catch (Exception e) {
            throw new RuntimeException(e);
        }

        return "index";
    }
    @RequestMapping("/cust3")
    public String cust3(Model model){
        model.addAttribute("left",dir+"left");
        model.addAttribute("center",dir+"cust3");
        return "index";
    }
    @RequestMapping("/custAdd")
    public String cust3(Model model, CustDto custDto){
        try {
            custService.add(custDto);
            model.addAttribute("left",dir+"left");
            model.addAttribute("center",dir+"cust3");
        } catch (Exception e) {
            throw new RuntimeException(e);
        }

        return "index";
    }
    @RequestMapping("/get")
    public String get(Model model, @RequestParam("id") String id){
        try {
            CustDto cust= custService.get(id);
            model.addAttribute("custDetail", cust);
            model.addAttribute("left",dir+"left");
            model.addAttribute("center",dir+"get");
        } catch (Exception e) {
            throw new RuntimeException(e);
        }

        return "index";
    }

}
