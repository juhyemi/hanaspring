package com.hana.controller;

import com.hana.app.data.msg.Msg;
import com.hana.util.ChatBotUtil;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.messaging.handler.annotation.MessageMapping;
import org.springframework.messaging.simp.SimpMessageHeaderAccessor;
import org.springframework.messaging.simp.SimpMessageSendingOperations;
import org.springframework.messaging.simp.SimpMessagingTemplate;
import org.springframework.stereotype.Controller;

@Slf4j
@Controller
public class ChatbotController {
    @Autowired
    SimpMessagingTemplate template;
    @Autowired
    SimpMessageSendingOperations simpMessageSendingOperations;
    @Value("${app.key.chatbot_url}")
    public String apiUrl;
    @Value("${app.key.chatbot_key}")
    public String secretKey;


    @MessageMapping("/sendchatbot")
    public void receiveme(Msg msg, SimpMessageHeaderAccessor headerAccessor) throws Exception {
        log.info(msg.toString());
        String id = msg.getSendid();
        template.convertAndSend("/send/me/"+id,msg);
        String result = ChatBotUtil.getMsg(apiUrl, secretKey, msg.getContent1());
        msg.setContent1(result);
        msg.setSendid("ChatBot");
        template.convertAndSend("/send/me/"+id,msg);
    }
}