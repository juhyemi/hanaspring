package com.hana.app.data.entity;

import jakarta.persistence.*;
import lombok.*;
import org.hibernate.annotations.OnDelete;
import org.hibernate.annotations.OnDeleteAction;

@Entity(name="item")
@Table(name="t_item")
@ToString
@Builder
@Getter
@NoArgsConstructor
@AllArgsConstructor(access = AccessLevel.PROTECTED)
public class ItemEntity extends BaseEntity {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name="item_id")
    private int id;
    @Column(nullable = false, length = 30)
    private String name;
    @Column(nullable = false, columnDefinition = "int default 0")
    private int price;

    @ManyToOne //default가 EAGER
    @OnDelete(action = OnDeleteAction.CASCADE) // cascade 설정
    @JoinColumn(name="cate_id") //조인걸 때 이렇게 해줌
    private CateEntity cate;
    //테이블 생성시엔 해당 타입을 사용할 수 없어서 포함관계로 넣어줘야한다.
    //그래서 ManyToOne 붙여줌
}
