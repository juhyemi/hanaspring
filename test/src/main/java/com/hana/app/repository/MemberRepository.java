package com.hana.app.repository;

import com.hana.app.data.dto.MemberDto;
import com.hana.app.frame.TestRepository;
import org.apache.ibatis.annotations.Mapper;
import org.springframework.stereotype.Repository;

@Mapper
@Repository
public interface MemberRepository extends TestRepository<String, MemberDto> {
}
