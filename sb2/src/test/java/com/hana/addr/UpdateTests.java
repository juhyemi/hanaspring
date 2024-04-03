package com.hana.addr;

import com.hana.app.data.dto.AddrDto;
import com.hana.app.service.AddrService;
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
    AddrService addrService;
    @Test
    void contextLoads() throws Exception {
        AddrDto addrDto = AddrDto.builder().addrName("yourhome").addrDetail("go to the home").addrId(2).build();
        try {
            addrService.modify(addrDto);
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
