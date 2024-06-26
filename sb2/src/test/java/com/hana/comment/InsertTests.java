package com.hana.comment;

import com.hana.app.data.dto.BoardDto;
import com.hana.app.data.dto.CommentDto;
import com.hana.app.service.BoardService;
import com.hana.app.service.CommentService;
import lombok.extern.slf4j.Slf4j;
import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;
import org.springframework.dao.DuplicateKeyException;

import java.sql.SQLException;

@SpringBootTest
@Slf4j
class InsertTests {
    @Autowired
    CommentService commentService;
    @Test
    void contextLoads() throws Exception {
        CommentDto commentDto = CommentDto.builder().custId("id98").commentContent("댓글").boardId(3).build();
        try {
            commentService.add(commentDto);
            log.info("------------OK-------------");
        } catch (Exception e) {
            if(e instanceof SQLException){
                log.info("------------System Trouble EX0001-------------");

            }else if(e instanceof DuplicateKeyException){
                log.info("------------ID Duplicated EX0002-------------");
            }else{
                log.info("------------Fail-------------");
                e.printStackTrace();
            }
        }
    }

}
