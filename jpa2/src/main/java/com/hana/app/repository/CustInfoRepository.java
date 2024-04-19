package com.hana.app.repository;

import com.hana.app.data.entity.CustInfoEntity;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

@Repository
public interface CustInfoRepository extends JpaRepository<CustInfoEntity, Integer> {
    //CRUDRepository는 기능이 별로 없어서 JpaRepository사용
}
