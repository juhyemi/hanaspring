package com.hana.controller;

import com.hana.app.data.dto.AdminDto;
import com.hana.app.service.AdminService;
import jakarta.servlet.http.HttpSession;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

@Controller
@Slf4j
@RequiredArgsConstructor
public class MainController {
    private final AdminService adminService;
    @Value("${app.url.server-url}")
    String serverUrl;
    @RequestMapping("/")
    public String main(Model model){
        model.addAttribute("charturl", serverUrl);
        return "index";
    }
    @RequestMapping("/websocket")
    public String websocket(Model model){
        model.addAttribute("serverurl", serverUrl);
        model.addAttribute("center", "websocket");
        return "index";
    }
    @RequestMapping("/logout")
    public String logoout(HttpSession session){
        if(session!=null){
            session.invalidate();
        }
        return "index";
    }
    @RequestMapping("/loginimpl")
    public String loginimpl(@RequestParam("id") String id, @RequestParam("pwd") String pwd, HttpSession session){
        AdminDto adminDto = null;
        try {
            adminDto = adminService.get(id);
            if(adminDto == null){
                throw new Exception();
            }
            if(!adminDto.getPwd().equals(pwd)){
                throw new Exception();
            }
            session.setAttribute("admin",adminDto);
        } catch (Exception e) {
            return "index";
        }

        return "index";
    }
}
