package com.hana.app.repository;

import com.hana.app.data.dto.MemberDto;
import com.hana.app.frame.TestRepository;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

@Mapper
@Repository
public interface MemberRepository extends TestRepository<String, MemberDto> {
    //아이디 찾기 위해 이름과 이메일 주소를 받음
    String selectId(@Param("name") String name, @Param("email") String email) throws Exception;
    String selectPwd(@Param("id") String id, @Param("name") String name, @Param("email") String email) throws Exception;
}
