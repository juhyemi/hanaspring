package com.hana.app.service;

import com.hana.app.data.dto.MemberDto;
import com.hana.app.data.dto.NoticeDto;
import com.hana.app.frame.TestService;
import com.hana.app.repository.MemberRepository;
import com.hana.app.repository.NoticeRepository;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
@RequiredArgsConstructor
@Slf4j
public class NoticeService implements TestService<String, NoticeDto> {
    final NoticeRepository noticeRepository;
    @Override
    public int add(NoticeDto noticeDto) throws Exception {
        return noticeRepository.insert(noticeDto);
    }

    @Override
    public int del(String s) throws Exception {
        return noticeRepository.delete(s);
    }

    @Override
    public int modify(NoticeDto noticeDto) throws Exception {
        return noticeRepository.update(noticeDto);
    }

    @Override
    public NoticeDto get(String s) throws Exception {
        return noticeRepository.selectOne(s);
    }

    @Override
    public List<NoticeDto> get() throws Exception {
        return noticeRepository.select();
    }
    public List<NoticeDto> getSearch(String category, String word) throws Exception{
        return noticeRepository.selectResult(category,word);
    }


}
