package com.hana.controller;

import com.hana.app.data.dto.ItemDto;
import com.hana.app.service.ItemService;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import java.util.List;

@Controller
@RequestMapping("/item")
@RequiredArgsConstructor
public class ItemController {
    final ItemService itemService;
    String dir = "item/";
    @RequestMapping("/")
    public String main(Model model){
        model.addAttribute("left",dir+"left");
        model.addAttribute("center",dir+"center");
        return "index";
    }
    @RequestMapping("/get")
    public String get(Model model){
        List<ItemDto> list = null;
        try {
            list = itemService.get();
            model.addAttribute("left",dir+"left");
            model.addAttribute("center",dir+"get");
            model.addAttribute("itemList", list);
        } catch (Exception e) {
            throw new RuntimeException(e);
        }

        return "index";
    }
    @RequestMapping("/add")
    public String add(Model model){
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
    @RequestMapping("/detail")
    public String detail(Model model, @RequestParam("id") int id){
        ItemDto dto = null;
        try {
            dto = itemService.get(id);
            model.addAttribute("left",dir+"left");
            model.addAttribute("center",dir+"detail");
            model.addAttribute("item", dto);
        } catch (Exception e) {
            throw new RuntimeException(e);
        }

        return "index";
    }
    @RequestMapping("/modify")
    public String modify(ItemDto itemDto){
        try {
            itemService.modify(itemDto);
        } catch (Exception e) {
            throw new RuntimeException(e);
        }
        return "redirect:/item/detail?id="+itemDto.getItemId();
    }

}
