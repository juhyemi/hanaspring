package com.hana.app.repository;

import com.hana.app.data.dto.QnaDto;
import com.hana.app.frame.TestRepository;
import org.apache.ibatis.annotations.Mapper;
import org.springframework.stereotype.Repository;

@Mapper
@Repository
public interface QnaRepository extends TestRepository<Integer, QnaDto> {
}
