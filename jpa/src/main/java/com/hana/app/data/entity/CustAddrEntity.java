package com.hana.app.data.entity;

import jakarta.persistence.*;
import lombok.*;
import org.springframework.data.annotation.CreatedDate;
import org.springframework.data.annotation.LastModifiedDate;
import org.springframework.data.jpa.domain.support.AuditingEntityListener;

import java.time.LocalDate;
import java.time.LocalDateTime;

@Entity(name="custaddr")
@Table(name="db_custaddr")
@Getter
@NoArgsConstructor
@AllArgsConstructor(access = AccessLevel.PRIVATE)
@Builder
@ToString(exclude = "cust")
@EntityListeners(AuditingEntityListener.class)
public class CustAddrEntity {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name="custaddr_id")
    private Long id;
    @Column(nullable = true, length=50)
    private String name;
    @Column(nullable = true, length=100)
    private String addr;

    @ManyToOne(fetch=FetchType.LAZY)
    @JoinColumn(name="cust_id")
    private CustEntity cust;
    //private Strign cust =>> 객체 간 관계 설정에서는 String 불가능
    public void addCust(CustEntity cust){
        this.cust = cust;
        cust.getCustAddrEntityList().add(this); //cust에 담는 부분 준비
    }
    //생성할 때 만들어진다.
    //수정할 수 없다.
    @CreatedDate
    @Column(updatable = false)
    private LocalDateTime regdatedAt;
    //수정할 때 만들어진다.
    @LastModifiedDate
    private LocalDateTime updatedAt;
}
