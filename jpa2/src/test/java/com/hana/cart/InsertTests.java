package com.hana.cart;

import com.hana.app.data.entity.CartEntity;
import com.hana.app.data.entity.CustEntity;
import com.hana.app.data.entity.ItemEntity;
import com.hana.app.service.CartService;
import com.hana.app.service.CateService;
import lombok.extern.slf4j.Slf4j;
import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;

@SpringBootTest
@Slf4j
class InsertTests {
    @Autowired
    CartService service;
    @Test
    void contextLoads() {
        CustEntity cust = CustEntity.builder().id("id01").build();
        ItemEntity item = ItemEntity.builder().id(4).build();

        CartEntity cart = CartEntity.builder().cnt(3).cust(cust).item(item).build();
        service.insert(cart);
        log.info("ok");
    }

}
