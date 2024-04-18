package com.hana.app.data.entity;

import jakarta.persistence.*;
import lombok.*;

@Builder
@Entity
@Table(name="db_custinfo")
@Getter
@ToString(exclude="cust")
@NoArgsConstructor
@AllArgsConstructor(access = AccessLevel.PRIVATE)
public class CustInfoEntity {
    @Id
    @Column(name="custinfo_id")
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;
    //1:1 관계에서 FK 설정
    @OneToOne(fetch = FetchType.LAZY)
    @JoinColumn(name="cust_id")
    private CustEntity cust;
    private String addr;
    private int age;
}
