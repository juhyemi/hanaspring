package com.hana.controller;

import com.hana.app.data.dto.ItemDto;
import java.util.*;
import com.hana.app.service.ItemService;
import com.hana.util.FileUploadUtil;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import java.util.ArrayList;

@Controller
@RequestMapping("/item")
@RequiredArgsConstructor
@Slf4j
public class ItemController {
    private final ItemService itemService;
    String dir = "item/";

    @Value("${app.dir.Uploadimgdir}")
    String imgdir;
    @RequestMapping("/add")
    public String add(Model model){

        model.addAttribute("center",dir+"add");
        return "index";
    }
    @RequestMapping("/modify")
    public String modify(ItemDto itemDto) throws Exception{

//        if(!itemDto.getImage().getOriginalFilename().equals("")){
//            itemDto.setImgName(itemDto.getImage().getOriginalFilename());
//            FileUploadUtil.saveFile(itemDto.getImage(),imgdir);
//            FileUploadUtil.deleteFile(oldimg,imgdir);
//        }
//        else{
//            itemDto.setImgName(imgName);
//        }
//        if(itemDto.getImage().isEmpty()){
//            itemService.modify(itemDto);
//        }else{
//            String oldimg = itemDto.getItemName();
//            itemDto.setImgName(itemDto.getImage().getOriginalFilename());
//            itemService.modify(itemDto);
//            FileUploadUtil.deleteFile(oldimg,imgdir);
//        }
        itemService.modify(itemDto);
        return "redirect:/item/detail?id="+itemDto.getItemId();
    }
    @RequestMapping("/addimpl")
    public String addimpl(ItemDto itemDto) throws Exception{
        //데이터 입력
        itemDto.setImgName(itemDto.getImage().getOriginalFilename());
        itemService.add(itemDto);

        //이미지 저장(/imgs)
        //MF, dir
        FileUploadUtil.saveFile(itemDto.getImage(), imgdir);

        return "redirect:/item/get?id="+itemDto.getItemId();
    }
    @RequestMapping("/get")
    public String get(Model model) throws Exception{
        try {
            List<ItemDto> list = new ArrayList<>();
            list = itemService.get();
            model.addAttribute("center",dir+"get");
            model.addAttribute("itemList",list);
        } catch (Exception e) {
            throw new Exception("EI0001");
        }
        return "index";
    }
    @RequestMapping("/detail")
    public String detail(Model model, @RequestParam("id") int id) throws Exception{
        ItemDto itemDto = null;
        try {
            itemDto = itemService.get(id);
            model.addAttribute("center",dir+"detail");
            model.addAttribute("item",itemDto);
        } catch (Exception e) {
            throw new Exception("EI0001");
        }
        return "index";
    }
}
