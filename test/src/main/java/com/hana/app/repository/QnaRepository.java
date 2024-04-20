package com.hana.app.repository;

import com.hana.app.data.dto.NoticeDto;
import com.hana.app.data.dto.QnaDto;
import com.hana.app.frame.TestRepository;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

import java.util.List;

@Mapper
@Repository
public interface QnaRepository extends TestRepository<Integer, QnaDto> {
    List<QnaDto> selectResult(@Param("category") String category, @Param("word") String word) throws Exception;

}
