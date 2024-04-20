package com.hana.app.repository;

import com.hana.app.data.dto.MemberDto;
import com.hana.app.data.dto.NoticeDto;
import com.hana.app.frame.TestRepository;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

import java.lang.reflect.Member;
import java.util.List;

@Mapper
@Repository
public interface MemberRepository extends TestRepository<String, MemberDto> {
    //아이디 찾기 위해 이름과 이메일 주소를 받음
    String selectId(@Param("name") String name, @Param("email") String email) throws Exception;
    String selectPwd(@Param("id") String id, @Param("name") String name, @Param("email") String email) throws Exception;
    //키워드 검색결과
    List<MemberDto> selectResult(@Param("category") String category, @Param("word") String word) throws Exception;
    //전체에서 찾기
    List<MemberDto> selectResultIntotal(@Param("word") String word) throws Exception;
}
