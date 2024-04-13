package com.hana.controller;

import com.hana.app.data.msg.Msg;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.messaging.handler.annotation.MessageMapping;
import org.springframework.messaging.simp.SimpMessageHeaderAccessor;
import org.springframework.messaging.simp.SimpMessageSendingOperations;
import org.springframework.messaging.simp.SimpMessagingTemplate;
import org.springframework.stereotype.Controller;
@Slf4j
@Controller
public class MsgController {
    @Autowired
    SimpMessagingTemplate template;
    @Autowired
    SimpMessageSendingOperations simpMessageSendingOperations;

    @MessageMapping("/receiveall") // 모두에게 전송
    public void receiveall(Msg msg, SimpMessageHeaderAccessor headerAccessor) {
        log.info(msg.toString());
        template.convertAndSend("/send",msg);
    }
    @MessageMapping("/receiveme") // 나에게만 전송 ex)Chatbot
    public void receiveme(Msg msg, SimpMessageHeaderAccessor headerAccessor) {
        log.info(msg.toString());
        String id = msg.getSendid();
        template.convertAndSend("/send/"+id,msg);
    }
    @MessageMapping("/receiveto") // 특정 Id에게 전송
    public void receiveto(Msg msg, SimpMessageHeaderAccessor headerAccessor) {
        log.info(msg.toString());

        String id = msg.getSendid();
        String target = msg.getReceiveid();
        log.info("-------------------------");

        template.convertAndSend("/send/to/"+target,msg);
    }
    @MessageMapping("/noticemsg") // 모두에게 전송
    public void noticemsg(Msg msg, SimpMessageHeaderAccessor headerAccessor) {
        log.info("notice checking====================================="+msg.toString());
        simpMessageSendingOperations.convertAndSend("/send3",msg);
    }
}