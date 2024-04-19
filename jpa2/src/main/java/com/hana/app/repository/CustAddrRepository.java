package com.hana.app.repository;

import com.hana.app.data.entity.CartEntity;
import com.hana.app.data.entity.CustAddrEntity;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface CustAddrRepository extends JpaRepository<CustAddrEntity, Integer> {
    //CRUDRepository는 기능이 별로 없어서 JpaRepository사용

}
