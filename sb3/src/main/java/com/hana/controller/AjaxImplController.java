package com.hana.controller;

import com.hana.app.data.dto.Chart2Dto;
import com.hana.app.data.dto.CustDto;
import com.hana.app.data.dto.SearchDto;
import com.hana.app.data.dto.ShopDto;
import com.hana.app.service.AddrService;
import jakarta.servlet.http.HttpSession;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.json.simple.JSONArray;
import org.json.simple.JSONObject;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;

@RestController
@Slf4j
@RequiredArgsConstructor
public class AjaxImplController {
    final AddrService addrService;
    @RequestMapping("/getservertime")
    public Object getservertime(){
        Date date = new Date();
        return date;
    }
    @RequestMapping("/addr/del")
    public Object del(@RequestParam("num") Integer num, HttpSession httpSession){
        String id = httpSession.getAttribute("id").toString();
        try {
            addrService.del(num);
        } catch (Exception e) {
            throw new RuntimeException(e);
        }
        return id;
    }
    @RequestMapping("/checkid")
    public Object checkid(@RequestParam("id") String id){
        String result="1";
        if(id.equals("qqq")){
            result="0";
        }
        return result;
    }
    @RequestMapping("/getdata")
    public Object getdata(){
        List<CustDto> ls = new ArrayList<>();
        ls.add(new CustDto("id01", "pwd01","james"));
        ls.add(new CustDto("id01", "pwd01","james"));
        ls.add(new CustDto("id01", "pwd01","james"));
        ls.add(new CustDto("id01", "pwd01","james"));
        ls.add(new CustDto("id01", "pwd01","james"));
        return ls;
    }
    @RequestMapping("/geo/getdata")
    public Object geogetdata(@RequestParam("loc") char loc){
        List<ShopDto> ls = new ArrayList<>();
         if(loc=='b'){
            ls.add(new ShopDto(100, "순대국","a.jpg", 35.1336656,129.0917708));
            ls.add(new ShopDto(101, "파스타","b.jpg", 35.1651717,129.1577079));
            ls.add(new ShopDto(102, "햄버거","c.jpg", 35.1998273,129.0931283));
        }else if(loc=='j'){
            ls.add(new ShopDto(100, "순대국","a.jpg", 33.4924789,126.5370195));
            ls.add(new ShopDto(101, "파스타","b.jpg", 33.4720643,126.5501791));
            ls.add(new ShopDto(102, "햄버거","c.jpg", 33.4934399,126.4803352));
        }else if(loc=='s'){
            ls.add(new ShopDto(100, "순대국","a.jpg", 37.5547611,127.0654625));
            ls.add(new ShopDto(101, "파스타","b.jpg", 37.5747611,127.0554625));
            ls.add(new ShopDto(102, "햄버거","c.jpg", 37.5147611,127.0154625));
        }
        return ls;
    }
    @RequestMapping("/getsearch")
    public List<SearchDto> getsearch(){
       String[] ranklist= {"규카츠","초밥","돈까스","마라탕","카레"};
        List<SearchDto> ls = new ArrayList<>();
        int idx=(int)(Math.random()*5);
        for(int i=1; i<=ranklist.length; i++){
            if(idx>ranklist.length-1) idx=0;
            ls.add(new SearchDto(i, ranklist[idx]));
            idx++;
        }
        return ls;
    }
    @RequestMapping("/chart2")
    public Object chart2(){
        JSONArray ja = new JSONArray();
        List<Chart2Dto> ls = new ArrayList<>();
        ls.add(new Chart2Dto("S001", 10,20,30,40,20,15));
        ls.add(new Chart2Dto("S002", 13,30,60,10,10,25));
        ls.add(new Chart2Dto("S003", 11,10,70,80,15,35));
        ls.add(new Chart2Dto("S004", 18,20,20,90,22,45));

        ls.stream().forEach(c->{
            JSONObject jo = new JSONObject();
            // [{name, data:[]}]
            jo.put("name",c.getName());
            jo.put("data", c.getM());
            ja.add(jo);
        });

//        for(Chart2Dto c:ls){
//            JSONObject jo = new JSONObject();
//            // [{name, data:[]}]
//            jo.put("name",c.getName());
//            jo.put("data", c.getM());
//            ja.add(jo);
//        }
        return ja;
    }
    @RequestMapping("/chart4")
    public Object chart4(@RequestParam("gender") String gender){
        JSONArray ja = new JSONArray();
        List<Chart2Dto> ls = new ArrayList<>();
        ls.add(new Chart2Dto("f", 30,10,10,10,20,20));
        ls.add(new Chart2Dto("m", 40,10,10,10,10,20));

        ls.stream().filter(c->c.getName().equals(gender)).forEach(c->{
            c.getM().stream().forEach(n->{
                JSONArray ja2 = new JSONArray();
                //[["",20],[],[],[]]
                ja2.add("OTT");
                ja2.add(n);
                ja.add(ja2);
            });
        });
        //{data:[], title:"f"}
        JSONObject jo = new JSONObject();
        jo.put("title",gender);
        jo.put("data",ja);

        return jo;
    }
}
