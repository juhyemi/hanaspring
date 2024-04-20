package com.hana.app.repository;

import com.hana.app.data.dto.MemberDto;
import com.hana.app.data.dto.NoticeDto;
import com.hana.app.frame.TestRepository;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

import java.util.List;

@Mapper
@Repository
public interface NoticeRepository extends TestRepository<String, NoticeDto> {
    List<NoticeDto> selectResult(@Param("category") String category, @Param("word") String word) throws Exception;
    //전체에서 찾기
    List<NoticeDto> selectResultIntotal(@Param("keyword") String keyword) throws Exception;
    //순서에 맞게 찾기
    List<NoticeDto> selectResultsort(@Param("standard") String standard, @Param("sortorder") String sortorder) throws Exception;
    //개수에 맞게 찾기
    List<NoticeDto> selectResultcnt(@Param("cnt") String cnt) throws Exception;

}
