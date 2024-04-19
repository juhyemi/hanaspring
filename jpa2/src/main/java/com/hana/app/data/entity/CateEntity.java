package com.hana.app.data.entity;

import jakarta.persistence.*;
import lombok.*;

@Entity(name="cate") //db에 테이블 생성 Entity에 name달아주면 통신 때 편함
@Table(name="t_cate") //table 이름 설정
@NoArgsConstructor
@AllArgsConstructor(access = AccessLevel.PROTECTED) //같은 패키지 하위객체, 외부 접근 불가
@Builder
@ToString
@Getter
public class CateEntity extends BaseEntity{
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name="cate_id") //column 이름 설정 가능
    private int id;
    //columnDefinition : column 제약조건 설정가능
    @Column(nullable = false, unique = true, columnDefinition = "varchar(30)")
    private String name;
}
