package com.hana.ncp;

import com.hana.util.OCRUtil;
import com.hana.util.OCRUtil2;
import lombok.extern.slf4j.Slf4j;
import org.json.simple.JSONObject;
import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.boot.test.context.SpringBootTest;

import java.util.Map;

@Slf4j
@SpringBootTest
class OCRTests2 {
    @Value("${app.dir.uploadimgdir}")
    String dir;
    @Test
    void contextLoads() {
        String imgname = "card1.png";
        JSONObject jsonObject = (JSONObject) OCRUtil2.getResult2(dir,imgname);
  //      Map<String, String> map = OCRUtil2.getData2(jsonObject);
//        map.values().forEach(txt->{log.info(txt);});
          log.info(jsonObject.toJSONString());
    }

}