package com.hana.controller;

import com.hana.app.data.dto.AddrDto;
import com.hana.app.data.dto.CustDto;
import com.hana.app.service.AddrService;
import jakarta.servlet.http.HttpSession;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import java.util.List;

@Controller
@RequestMapping("/addr")
@RequiredArgsConstructor
@Slf4j
public class AddrController {
    final AddrService addrService;
    String dir = "addr/";
    @RequestMapping("/addForm")
    public String addForm(Model model){
        model.addAttribute("left",dir+"infoleft");
        model.addAttribute("center",dir+"addForm");
        return "index";
    }
    @RequestMapping("/add")
    public String add(Model model, AddrDto addrDto, HttpSession httpSession){
        String id = httpSession.getAttribute("id").toString();
        addrDto.setCustId(id);
        try {
            addrService.add(addrDto);
        } catch (Exception e) {
            throw new RuntimeException(e);
        }
        return "redirect:/addr/get?id="+id;
    }
    @RequestMapping("/get")
    public String get(@RequestParam("id") String id,AddrDto addrDto, Model model){
        List<AddrDto> addrInfo= null;
        try {
            addrInfo = addrService.getAddr(id);
        } catch (Exception e) {
            throw new RuntimeException(e);
        }
        log.info("-------------check=============");
        log.info(addrInfo.toString());
        model.addAttribute("left",dir+"infoleft");
        model.addAttribute("center",dir+"infocenter");
        model.addAttribute("loginInfo",addrInfo);

        return "index";
    }

}
