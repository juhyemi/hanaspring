package com.hana.app.repository;

import com.hana.app.data.entity.CustAddrEntity;
import com.hana.app.data.entity.CustInfoEntity;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

@Repository
public interface CustAddrRepotory extends JpaRepository<CustAddrEntity, Long> {

}
