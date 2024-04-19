package com.hana.app.repository;

import com.hana.app.data.dto.InqueryDto;
import com.hana.app.data.dto.NoticeDto;
import com.hana.app.frame.TestRepository;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

import java.util.List;

@Mapper
@Repository
public interface InqueryRepository extends TestRepository<Integer, InqueryDto> {
}
