package com.hana.app.repository;

import com.github.pagehelper.Page;
import com.hana.app.data.dto.AddrDto;
import com.hana.app.data.dto.BoardDto;
import com.hana.app.frame.HanaRepository;
import org.apache.ibatis.annotations.Mapper;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
@Mapper
public interface BoardRepository extends HanaRepository<Integer, BoardDto> {
    //interface끼리는 extends
    int modifycnt(BoardDto boardDto) throws Exception;
    List<BoardDto> getRank() throws Exception;
    Page<BoardDto> getAll() throws Exception;
}
