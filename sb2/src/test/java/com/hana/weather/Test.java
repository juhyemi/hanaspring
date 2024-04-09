package com.hana.weather;

import com.hana.util.WeatherUtil;
import lombok.extern.slf4j.Slf4j;
import org.json.simple.JSONObject;
import org.json.simple.parser.ParseException;
import org.springframework.boot.test.context.SpringBootTest;

import java.io.IOException;

@SpringBootTest
@Slf4j
class Test {

    @org.junit.jupiter.api.Test
    void contextLoads() throws IOException, ParseException {
        String key = "CrsgVgYfMqRWI2oUuL62DG%2BSen%2B1YqxTsFW8TGaV6hb65%2FsV1uqZvbLarIBJWQWqeT9n%2BOgiW76bIBNWqifasw%3D%3D";
        String loc = "109";
        JSONObject jsonObject= (JSONObject) WeatherUtil.getWeather(loc,key);
        log.info("------------LOG-------------"+jsonObject.toJSONString());
    }

}
