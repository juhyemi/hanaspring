package com.hana.app.repository;

import com.hana.app.data.dto.AddrDto;
import com.hana.app.frame.HanaRepository;
import org.apache.ibatis.annotations.Mapper;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
@Mapper
public interface AddrRepository extends HanaRepository<Integer, AddrDto> {
    //interface끼리는 extends
    List<AddrDto> getAddr(String s) throws Exception;
}
