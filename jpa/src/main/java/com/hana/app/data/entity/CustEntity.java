package com.hana.app.data.entity;

import jakarta.persistence.*;
import lombok.*;

import java.util.ArrayList;
import java.util.List;

@Builder
@Entity(name="cust")
//엔티티끼리 호출시 사용
@Table(name="db_cust")
@Getter
@ToString(exclude = "custAddrEntityList")
@NoArgsConstructor
@AllArgsConstructor(access = AccessLevel.PRIVATE)
public class CustEntity {
    @Id
    @Column(name="cust_id", length=30)
    private String id;
    @Column(length=60,nullable = false)
    private String pwd;
    @Column(length=50,nullable = false)
    private String name;

    //포함관계를 나타냄
    @OneToOne(mappedBy = "cust") //EAGER COMPOSITION
    private CustInfoEntity custInfo;

    @OneToMany(mappedBy = "cust", fetch=FetchType.EAGER) // LAZY AGGREGATION
    @Builder.Default //시작하자마자 리스트를 먼저 만들어놓겠다.(담을 공간 준비)
    private List<CustAddrEntity> custAddrEntityList = new ArrayList<>();
}
