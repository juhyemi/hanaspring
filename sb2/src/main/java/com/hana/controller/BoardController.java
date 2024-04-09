package com.hana.controller;

import com.hana.app.data.dto.BoardDto;
import com.hana.app.service.BoardService;
import jakarta.servlet.http.HttpSession;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import java.util.List;

@Controller
@RequestMapping("/board")
@Slf4j
@RequiredArgsConstructor
public class BoardController {
    String dir = "board/";
    final BoardService boardService;
    @RequestMapping("/get")
    public String get(Model model){
        List<BoardDto> list = null;
        model.addAttribute("center", dir+"get");
        try {
            list = boardService.get();
            model.addAttribute("center", dir+"get");
            model.addAttribute("boardList", list);
        } catch (Exception e) {
            throw new RuntimeException(e);
        }

        return "index";
    }
    @RequestMapping("/detail")
    public String detail(Model model, @RequestParam("id") int id, HttpSession session){
        BoardDto dto = null;
        try {
            dto = boardService.get(id);
            dto.getCommentList().stream().forEach((c->log.info(c.toString())));

            if(session!=null&&!dto.getCustId().equals(session.getAttribute("id"))){
                boardService.modifycnt(dto);
            }
            model.addAttribute("center", dir+"detail");
            model.addAttribute("board", dto);
        } catch (Exception e) {
            throw new RuntimeException(e);
        }

        return "index";
    }
    @RequestMapping("/add")
    public String add(Model model){
        model.addAttribute("center", dir+"add");
        return "index";
    }
    @RequestMapping("/write")
    public String write(Model model, BoardDto boardDto, HttpSession session){
        String writer = (String) session.getAttribute("id");
        boardDto.setCustId(writer);
        try {
            boardService.add(boardDto);
        } catch (Exception e) {
            throw new RuntimeException(e);
        }
        return "redirect:/board/get";
    }
    @RequestMapping("/modify")
    public String modify(BoardDto boardDto){
        try {
            boardService.modify(boardDto);
        } catch (Exception e) {
            throw new RuntimeException(e);
        }
        return "redirect:/board/detail?id="+boardDto.getBoardId();
    }
    @RequestMapping("/delete")
    public String delete(@RequestParam("id") int id){
        try {
            boardService.del(id);
        } catch (Exception e) {
            throw new RuntimeException(e);
        }
        return "redirect:/board/get";
    }
}
