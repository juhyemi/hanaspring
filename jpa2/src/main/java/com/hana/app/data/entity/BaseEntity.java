package com.hana.app.data.entity;


import jakarta.persistence.Column;
import jakarta.persistence.EntityListeners;
import jakarta.persistence.MappedSuperclass;
import lombok.*;
import org.springframework.data.annotation.CreatedDate;
import org.springframework.data.annotation.LastModifiedDate;
import org.springframework.data.jpa.domain.support.AuditingEntityListener;

import java.time.LocalDateTime;

@Getter
@ToString
@MappedSuperclass
@EntityListeners(AuditingEntityListener.class)
// 이벤트 발생시 자동으로 동작되게 해라
//@Entity 사용하지 않는 이유는 테이블을 만든는게 아니고 모든 엔티티의 상위 클래스이기 때문
public class BaseEntity {
    @CreatedDate
    @Column(updatable = false) //수정못하게
    private LocalDateTime createdAt;
    @LastModifiedDate
    @Setter
    private LocalDateTime updatedAt;
}
