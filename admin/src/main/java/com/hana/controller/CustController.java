package com.hana.controller;

import com.hana.app.data.dto.CustDto;
import com.hana.app.data.entity.LoginCust;
import com.hana.app.repository.LoginCustRepository;
import com.hana.app.service.CustService;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import java.util.ArrayList;
import java.util.List;

@Controller
@RequestMapping("/cust")
@RequiredArgsConstructor
@Slf4j
public class CustController {
    private final CustService custService;
    final LoginCustRepository loginCustRepository;
    String dir="cust/";
    @RequestMapping("/get")
    public String get(Model model) throws Exception{
        //Database에서 데이터를 가지고 온다.
        List<CustDto> list = null;
        try {
            list = custService.get();
            model.addAttribute("custs",list);
            model.addAttribute("center",dir+"get");
        } catch (Exception e) {
            throw new Exception("ER00001");
        }
        return "index";
    }

    @RequestMapping("/add")
    public String add(Model model){
        model.addAttribute("center",dir+"add");
        return "index";
    }
    @RequestMapping("/addImpl")
    public String addImpl(CustDto dto) throws Exception{
       log.info(String.valueOf(dto));
        try {
            custService.add(dto);
        } catch (Exception e) {
            throw new Exception("ER0001");
        }
        return "redirect:/cust/get";
    }
    @RequestMapping("/custmodify")
    public String custmodify(Model model, @RequestParam("id") String id){
        log.info(id);
        model.addAttribute("userid",id);
        model.addAttribute("center",dir+"detail");

        return "index";
    }
    @RequestMapping("/modifyImpl")
    public String modifyImpl(CustDto custDto){
       log.info(custDto.getId()+custDto.getName()+ custDto.getPwd());
        try {
            custService.modify(custDto);
        } catch (Exception e) {
            throw new RuntimeException(e);
        }
        return "redirect:/cust/get";
    }
    @RequestMapping("/delete")
    public String delete(@RequestParam("id") String id){
        log.info(id);
        try {
            custService.del(id);
        } catch (Exception e) {
            throw new RuntimeException(e);
        }
        return "redirect:/cust/get";
    }
    @RequestMapping("/idcheck")
    @ResponseBody
    public Object idcheck(@RequestParam("id") String id) throws Exception{
        CustDto custDto=null;
        custDto=custService.get(id);
        String result="0";
        if(custDto==null) result="1";
        return result;
    }

    @RequestMapping("/loginInfo")
    public String loginInfo(Model model){
        Iterable<LoginCust> list = loginCustRepository.findAll();
        List<LoginCust> loginlist = new ArrayList<>();
        list.forEach(lc->{
            if(lc!=null) loginlist.add(lc);
        });
        model.addAttribute("list", loginlist);
        model.addAttribute("cnt", loginlist.size());
        model.addAttribute("center",dir+"loginInfo");

        return "index";
    }

}
