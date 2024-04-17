package com.hana.kakao;

import lombok.extern.slf4j.Slf4j;
import org.json.simple.JSONObject;
import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.boot.test.context.SpringBootTest;

import java.io.BufferedReader;
import java.io.InputStream;
import java.io.InputStreamReader;
import java.io.OutputStreamWriter;
import java.net.HttpURLConnection;
import java.net.URL;
import java.nio.charset.Charset;
import java.nio.charset.StandardCharsets;

@SpringBootTest
@Slf4j
class KochatTests {
    @Value("${app.key.kakaokey}")
   String mykey;
    @Test
    void contextLoads() throws Exception {
        try {
            // KoGPT에게 전달할 명령어 구성
            String prompt = "인간처럼 생각하고, 행동하는 '지능'을 통해 인류가 이제까지 풀지 못했던";

            // 파라미터를 전달해 kogptApi() 메서드 호출
            String response = kogptApi(mykey, prompt, 64, 0.7, 0.8);
            log.info(response);

        } catch (Exception e) {
            e.printStackTrace();
        }
    }

        // KoGPT API 호출을 위한 메서드
        static String kogptApi(String mykey, String prompt, int maxTokens, double temperature, double topP) throws Exception {
            // API 호출을 위한 URL 생성
            URL url = new URL("https://api.kakaobrain.com/v1/inference/kogpt/generation");
            HttpURLConnection conn = (HttpURLConnection) url.openConnection();

            // HTTP 헤더 설정
            conn.setRequestMethod("POST");
            conn.setRequestProperty("Authorization", "KakaoAK " + mykey);
            conn.setRequestProperty("Content-Type", "application/json; charset=utf-8");

            // API 호출을 위한 JSON 요청 생성
            JSONObject requestJson = new JSONObject();
            requestJson.put("prompt", prompt);
            requestJson.put("max_tokens", maxTokens);
            requestJson.put("temperature", temperature);
            requestJson.put("top_p", topP);

            // HTTP 요청 전송
            conn.setDoOutput(true);
            conn.getOutputStream().write(requestJson.toString().getBytes(StandardCharsets.UTF_8));

            // 응답 수신
            BufferedReader reader = new BufferedReader(new InputStreamReader(conn.getInputStream()));
            StringBuilder response = new StringBuilder();
            String line;
            while ((line = reader.readLine()) != null) {
                response.append(line);
            }

            // 연결 닫기
            reader.close();
            conn.disconnect();
            return response.toString();
        }
}