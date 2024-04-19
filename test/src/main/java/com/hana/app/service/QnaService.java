package com.hana.app.service;

import com.hana.app.data.dto.InqueryDto;
import com.hana.app.data.dto.QnaDto;
import com.hana.app.frame.TestService;
import com.hana.app.repository.QnaRepository;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
@RequiredArgsConstructor
@Slf4j
public class QnaService implements TestService<Integer, QnaDto> {
    final QnaRepository qnaRepository;
    @Override
    public int add(QnaDto qnaDto) throws Exception {
        return qnaRepository.insert(qnaDto);
    }

    @Override
    public int del(Integer s) throws Exception {
        return qnaRepository.delete(s);
    }

    @Override
    public int modify(QnaDto qnaDto) throws Exception {
        return qnaRepository.update(qnaDto);
    }

    @Override
    public QnaDto get(Integer id) throws Exception {
        return qnaRepository.selectOne(id);
    }

    @Override
    public List<QnaDto> get() throws Exception {
        return qnaRepository.select();
    }
}
