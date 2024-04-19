package com.hana.app.service;

import com.hana.app.data.dto.InqueryDto;
import com.hana.app.data.dto.MemberDto;
import com.hana.app.frame.TestService;
import com.hana.app.repository.InqueryRepository;
import com.hana.app.repository.MemberRepository;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
@RequiredArgsConstructor
@Slf4j
public class InqueryService implements TestService<Integer, InqueryDto> {
    final InqueryRepository inqueryRepository;
    @Override
    public int add(InqueryDto inqueryDto) throws Exception {
        return inqueryRepository.insert(inqueryDto);
    }

    @Override
    public int del(Integer s) throws Exception {
        return inqueryRepository.delete(s);
    }

    @Override
    public int modify(InqueryDto inqueryDto) throws Exception {
        return inqueryRepository.update(inqueryDto);
    }

    @Override
    public InqueryDto get(Integer id) throws Exception {
        return inqueryRepository.selectOne(id);
    }

    @Override
    public List<InqueryDto> get() throws Exception {
        return inqueryRepository.select();
    }
}
