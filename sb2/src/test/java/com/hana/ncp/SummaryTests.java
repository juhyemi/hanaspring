package com.hana.ncp;
import java.io.BufferedReader;
import java.io.DataOutputStream;
import java.io.InputStreamReader;
import java.net.HttpURLConnection;
import java.net.URL;
import java.net.URLEncoder;

import lombok.extern.slf4j.Slf4j;
import org.json.simple.JSONObject;
import org.junit.jupiter.api.Test;
import org.springframework.boot.test.context.SpringBootTest;import com.hana.util.NcpUtil;
import lombok.extern.slf4j.Slf4j;
import org.json.simple.JSONObject;
import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.boot.test.context.SpringBootTest;

@Slf4j
@SpringBootTest
class SummaryTests {
    @Value("${app.key.ncp-id}")
    String ncpId;
    @Value("${app.key.ncp-secret}")
    String ncpSecret;
    @Test
    void contextLoads() {
//        try {
////            String text = URLEncoder.encode("싸늘하다. 가슴에 비수가 날아와 꽂힌다.", "UTF-8");

//
//            String apiURL = "https://naveropenapi.apigw.ntruss.com/text-summary/v1/summarize"; //
//            URL url = new URL(apiURL);
//            HttpURLConnection con = (HttpURLConnection)url.openConnection();
//            con.setRequestMethod("POST");
//            con.setRequestProperty("Content-Type", "application/json");
//            con.setRequestProperty("X-NCP-APIGW-API-KEY-ID", ncpId);
//            con.setRequestProperty("X-NCP-APIGW-API-KEY", ncpSecret);
//            // post request
//            //  String postParams = "content=" + text;
//            con.setDoOutput(true);
//            JSONObject jsonObject = new JSONObject();
//            JSONObject documentObject = new JSONObject();
//            documentObject.put("content",text);
//            JSONObject optionObject = new JSONObject();
//            optionObject.put("language","ko");
//            optionObject.put("model","news");
//            optionObject.put("summaryCount",2);
//
//            jsonObject.put("document",documentObject);
//            jsonObject.put("option",optionObject);
//
//            DataOutputStream wr = new DataOutputStream(con.getOutputStream());
//            wr.write(jsonObject.toString().getBytes("UTF-8"));
//            wr.flush();
//            wr.close();
//            int responseCode = con.getResponseCode();
//            BufferedReader br;
//            if(responseCode==200) { // 정상 호출
//                br = new BufferedReader(new InputStreamReader(con.getInputStream()));
//            } else {  // 오류 발생
//                br = new BufferedReader(new InputStreamReader(con.getErrorStream()));
//            }
//            String inputLine;
//            StringBuffer response = new StringBuffer();
//            while ((inputLine = br.readLine()) != null) {
//                response.append(inputLine);
//            }
//            br.close();
//            System.out.println(response);
//        } catch (Exception e) {
//            System.out.println(e);
//        }
        String text = "정부는 이달 말까지 예정된 유류세 인하 조치를 2개월 추가 연장한다. 이런 결정은 지난 13일(현지시간) 이란의 이스라엘 본토 공습으로 국내외 유가 불확실성이 커진 탓이다. 국제유가가 오르면 2~3주 시차를 두고 국내 기름값도 오름세를 보인다.\n" +
                "\n" +
                "이번 개정을 통해 ℓ당 △휘발유 205원 △경유 212원 △액화석유가스(LPG)부탄 73원 등의 가격 인하 효과가 6월 말까지 이어진다.\n" +
                "\n" +
                "최근 국내 기름값은 오름 추세다. 휘발유 가격은 지난 1월 ℓ당 1569원에서 지난 14일 1687원까지 올랐다. 경유 가격은 같은 기간 1480원에서 1558원으로 상승했다.\n" +
                "\n" +
                "최근 물가 지표를 보면 석유류 가격이 오름세로 전환, 변수로 떠올랐다. 통계청에 따르면 지난달 소비자물가는 전년동월 대비 3.1% 상승했다. 두 달째 3%대 상승세다. 특히 지난달 석유류 가격은 1년 전보다 1.2% 올랐다. 1년 2개월 만에 상승 전환했다.\n" +
                "\n" +
                "최근 국제유가는 배럴당 90달러 수준을 넘나들면서 변동성을 키웠다. 당분간 오름세가 예상된다. 국제금융센터는 전날 발표한 보고서에서 \"15일 개장과 동시에 국제유가 급등이 불가피해 보이고 당분간 강세가 이어질 전망\"이라며 \"중장기적으로는 원유공급 차질의 실제화 여부에 좌우될 것\"이라고 밝혔다.\n" +
                "\n" +
                "여기에 고환율까지 덮치면서 원유 등 수입물가를 자극하고 있다. 미국 물가가 예상보다 높게 나타나 연방준비제도(Fed)의 금리 인하 기대가 줄면서 달러가 강세를 보인 영향이다. 이날 원/달러 환율은 1380원 선을 넘어 1400원마저 위협하고 있다.\n" +
                "\n" +
                "국제유가가 오르는 구조에서 기존과 동일한 유류세 인하 폭으론 기름값 부담을 낮추긴 어렵다. 그런데도 정부가 쉽사리 인하 폭을 늘려잡긴 어려운 현실이다. 유류세 인하 조치가 장기간 운용되면서 수 조원대 세수 결손이 우려되기 때문이다.";
        JSONObject obj = (JSONObject) NcpUtil.getSummary(ncpId,ncpSecret,text);
        log.info(obj.toJSONString());
    }

}