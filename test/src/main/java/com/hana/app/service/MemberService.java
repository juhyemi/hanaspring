package com.hana.app.service;

import com.hana.app.data.dto.MemberDto;
import com.hana.app.frame.TestService;
import com.hana.app.repository.MemberRepository;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;

import java.util.List;
@Service
@RequiredArgsConstructor
public class MemberService implements TestService<String, MemberDto> {
    final MemberRepository memberRepository;
    @Override
    public int add(MemberDto memberDto) throws Exception {
        return memberRepository.insert(memberDto);
    }

    @Override
    public int del(String s) throws Exception {
        return memberRepository.delete(s);
    }

    @Override
    public int modify(MemberDto memberDto) throws Exception {
        return memberRepository.update(memberDto);
    }

    @Override
    public MemberDto get(String id) throws Exception {
        return memberRepository.selectOne(id);
    }

    @Override
    public List<MemberDto> get() throws Exception {
        return memberRepository.select();
    }
}
