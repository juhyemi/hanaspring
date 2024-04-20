package com.hana.app.service;

import com.hana.app.data.dto.MemberDto;
import com.hana.app.data.dto.NoticeDto;
import com.hana.app.frame.TestService;
import com.hana.app.repository.MemberRepository;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.stereotype.Service;

import java.lang.reflect.Member;
import java.util.List;
@Service
@RequiredArgsConstructor
@Slf4j
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

    public String getId(String name, String email) throws Exception {
        log.info("MemberService==============");
        log.info(name+"=============="+email);
        return memberRepository.selectId(name,email);
    }
    public String getPwd(String id, String name, String email) throws Exception {
        log.info("MemberService==============");
        log.info(name+"=============="+email);
        return memberRepository.selectPwd(id,name,email);
    }
    public List<MemberDto> getSearch(String category, String word) throws Exception{
        return memberRepository.selectResult(category,word);
    }
    public List<MemberDto> getSearchtotal(String word) throws Exception{
        return memberRepository.selectResultIntotal(word);
    }
    public List<MemberDto> getsearchsort(String standard,String sortorder) throws Exception{
        return memberRepository.selectResultsort(standard, sortorder);
    }
    public List<MemberDto> getsearchcnt(String cnt) throws Exception{
        return memberRepository.selectResultcnt(cnt);
    }
}
