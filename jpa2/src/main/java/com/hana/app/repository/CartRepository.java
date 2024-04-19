package com.hana.app.repository;

import com.hana.app.data.entity.CartEntity;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface CartRepository extends JpaRepository<CartEntity, Integer> {
    //CRUDRepository는 기능이 별로 없어서 JpaRepository사용
    List<CartEntity> findByCust_id(String id);
}
