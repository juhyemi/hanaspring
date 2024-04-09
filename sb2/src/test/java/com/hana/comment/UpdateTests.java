package com.hana.comment;

import com.hana.app.data.dto.BoardDto;
import com.hana.app.service.BoardService;
import lombok.extern.slf4j.Slf4j;
import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;
import org.springframework.dao.DuplicateKeyException;

import java.sql.SQLException;

@SpringBootTest
@Slf4j
class UpdateTests {
    @Autowired
    BoardService boardService;
    @Test
    void contextLoads() throws Exception {
        BoardDto boardDto = BoardDto.builder().boardId(1).boardTitle("바뀐제목").boardContent("바뀐내용").build();
        try {
            boardService.modify(boardDto);
            log.info("------------OK-------------");
        } catch (Exception e) {
            if(e instanceof SQLException){
                log.info("------------System Trouble EX0001-------------");

            }else if(e instanceof DuplicateKeyException){

                log.info("------------ID Duplicated EX0002-------------");
            }else{
                e.printStackTrace();
                log.info("------------Sorry-------------");

            }
        }
    }

}
