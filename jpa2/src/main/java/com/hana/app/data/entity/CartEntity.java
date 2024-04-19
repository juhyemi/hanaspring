package com.hana.app.data.entity;

import jakarta.persistence.*;
import lombok.*;

@Entity(name="cart") //db에 테이블 생성 Entity에 name달아주면 통신 때 편함
@Table(name="t_cart") //table 이름 설정
@NoArgsConstructor
@AllArgsConstructor(access = AccessLevel.PROTECTED) //같은 패키지 하위객체, 외부 접근 불가
@Builder
@ToString(exclude="cust")
@Getter
public class CartEntity extends BaseEntity{
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name="cart_id") //column 이름 설정 가능
    private int id;
    //columnDefinition : column 제약조건 설정가능
    private int cnt;

    @ManyToOne(fetch=FetchType.LAZY)
    @JoinColumn(name="cust_id")
    private CustEntity cust;
    @ManyToOne
    @JoinColumn(name="item_id")
    private ItemEntity item;
}
