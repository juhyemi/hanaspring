package com.hana.controller;

import com.github.pagehelper.PageInfo;
import com.hana.app.data.dto.CustDto;
import com.hana.app.service.CustService;
import com.hana.util.StringEnc;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

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
            ls.stream().forEach(c->{
                c.setName(StringEnc.decryptor(c.getName()));
            });
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
    public String custAdd(Model model, CustDto custDto){
        try {
            custService.add(custDto);
        } catch (Exception e) {
            model.addAttribute("left",dir+"left");
            model.addAttribute("center", "registerfail");
            //throw new RuntimeException(e);
            return "index";
        }

        return "redirect:/cust/get?id="+custDto.getId();
    }
    @RequestMapping("/get")
    public String get(Model model, @RequestParam("id") String id){
        try {
            CustDto cust= custService.get(id);

            model.addAttribute("custDetail", cust);
            model.addAttribute("left",dir+"left");
            model.addAttribute("center",dir+"get");
        } catch (Exception e) {
            //throw new RuntimeException(e);
        }

        return "index";
    }
    @RequestMapping("/allpage")
    public String allpage(@RequestParam("pageNo") int pageNo, Model model) throws Exception {
        PageInfo<CustDto> p;
        try {
            p = new PageInfo<>(custService.getPage(pageNo),5);
            model.addAttribute("cpage", p);
            model.addAttribute("target","/cust");
            model.addAttribute("left",dir+"left");
            model.addAttribute("center",dir+"allpage");
        } catch (Exception e) {
            //throw new RuntimeException(e);
        }

        return "index";
    }

}
