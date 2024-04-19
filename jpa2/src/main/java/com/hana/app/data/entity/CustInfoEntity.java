package com.hana.app.data.entity;

import jakarta.persistence.*;
import lombok.*;

@Entity(name="custinfo") //db에 테이블 생성 Entity에 name달아주면 통신 때 편함
@Table(name="t_custinfo") //table 이름 설정
@NoArgsConstructor
@AllArgsConstructor(access = AccessLevel.PROTECTED) //같은 패키지 하위객체, 외부 접근 불가
@Builder
@ToString(exclude = "cust")
@Getter
public class CustInfoEntity extends BaseEntity{
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name="custinfo_id") //column 이름 설정 가능
    private int id;
    @Column(nullable = false, columnDefinition = "int default 1")
    private int age;
    @OneToOne
    @JoinColumn(name="cust_id")
    private CustEntity cust;
}
