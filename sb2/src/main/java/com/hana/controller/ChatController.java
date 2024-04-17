//package com.hana.controller;
//
//import com.hana.app.data.msg.Msg;
//import lombok.extern.slf4j.Slf4j;
//import org.springframework.beans.factory.annotation.Autowired;
//import org.springframework.messaging.handler.annotation.MessageMapping;
//import org.springframework.messaging.simp.SimpMessageHeaderAccessor;
//import org.springframework.messaging.simp.SimpMessageSendingOperations;
//import org.springframework.messaging.simp.SimpMessagingTemplate;
//import org.springframework.stereotype.Controller;
//
//@Slf4j
//@Controller
//public class ChatController {
//    @Autowired
//    SimpMessagingTemplate template;
//    @Autowired
//    SimpMessageSendingOperations simpMessageSendingOperations;
//
//    @MessageMapping("/sendchat")
//    public void receiveto(Msg msg, SimpMessageHeaderAccessor headerAccessor) {
//        String id = msg.getSendid();
//        String target = msg.getReceiveid();
//        log.info("-------------------------");
//
//        template.convertAndSend("/sendchat/to/"+target,msg);
//        template.convertAndSend("/sendchat/to/"+id,msg);
//    }
//}