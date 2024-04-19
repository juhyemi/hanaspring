package com.hana;

import com.hana.app.data.dto.InqueryDto;
import com.hana.app.repository.InqueryRepository;
import com.hana.app.service.InqueryService;
import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;

@SpringBootTest
class TestApplicationTests {
    @Autowired
    InqueryService service;
    @Test
    void contextLoads() throws Exception {
        InqueryDto dto = InqueryDto.builder().one2onePhone("01011111111").one2oneName("user1").one2oneAddress("주소").one2oneEmail("이메일").one2oneTitle("제목").one2oneContent("내용").build();
        int result = service.add(dto);
    }

}
