package com.hana.cust;

import com.hana.app.service.CustService;
import lombok.extern.slf4j.Slf4j;
import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;
import org.springframework.dao.DuplicateKeyException;

import java.sql.SQLException;

@SpringBootTest
@Slf4j
class DeleteTests {
    @Autowired
    CustService custService;
    @Test
    void contextLoads() throws Exception {
        try {
            custService.del("id786");
            log.info("------------OK-------------");
        } catch (Exception e) {
            if(e instanceof SQLException){
                log.info("------------System Trouble EX0001-------------");

            }else if(e instanceof DuplicateKeyException){
                log.info("------------ID Duplicated EX0002-------------");
            }else{
                log.info("-------------ID Duplicated EX0003-----------");
            }
            e.printStackTrace();
        }
    }

}
