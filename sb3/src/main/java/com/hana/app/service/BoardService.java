package com.hana.app.service;

import com.github.pagehelper.Page;
import com.github.pagehelper.PageHelper;
import com.hana.app.data.dto.BoardDto;
import com.hana.app.frame.HanaService;
import com.hana.app.repository.BoardRepository;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
@RequiredArgsConstructor
public class BoardService implements HanaService<Integer, BoardDto> {

    final BoardRepository boardRepository;

    @Override
    public int add(BoardDto boardDto) throws Exception {
        return boardRepository.insert(boardDto);
    }

    @Override
    public int del(Integer s) throws Exception {
        return boardRepository.delete(s);
    }

    @Override
    public int modify(BoardDto boardDto) throws Exception {
        return boardRepository.update(boardDto);
    }

    @Override
    public BoardDto get(Integer s) throws Exception {
        return boardRepository.selectOne(s);
    }

    @Override
    public List<BoardDto> get() throws Exception {
        return boardRepository.select();
    }
    public int modifycnt(BoardDto boardDto) throws Exception{
        return boardRepository.modifycnt(boardDto);
    }
    public List<BoardDto> getRank() throws Exception {
        return boardRepository.getRank();
    }
    public Page<BoardDto> getAll(int pageNo) throws Exception {
        PageHelper.startPage(pageNo, 3); // 3: 한화면에 출력되는 개수
        return boardRepository.getAll();
    }
//    public List<BoardDto> findByCustId(String id) throws Exception{
//        return boardRepository.findByCustId(id);
//    }

}