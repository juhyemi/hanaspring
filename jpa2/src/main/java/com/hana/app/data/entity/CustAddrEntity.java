package com.hana.app.data.entity;

import jakarta.persistence.*;
import lombok.*;

@Entity(name="custaddr") //db에 테이블 생성 Entity에 name달아주면 통신 때 편함
@Table(name="t_custaddr") //table 이름 설정
@NoArgsConstructor
@AllArgsConstructor(access = AccessLevel.PROTECTED) //같은 패키지 하위객체, 외부 접근 불가
@Builder
@ToString(exclude = "cust")
@Getter
public class CustAddrEntity extends BaseEntity{
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name="custaddr_id") //column 이름 설정 가능
    private int id;
    private String addr;

    @ManyToOne(fetch = FetchType.LAZY)
    @JoinColumn(name="cust_id")
    private CustEntity cust;

//    public void addCust(CustEntity cust){
//        this.cust = cust;
//        cust.getCustAddrs().add(this);
//    } // 여기서 실질적으로 담아줌 CustEntity에 있는 custAddrs을
}
