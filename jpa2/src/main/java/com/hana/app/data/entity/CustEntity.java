package com.hana.app.data.entity;

import jakarta.persistence.*;
import lombok.*;

import java.util.ArrayList;
import java.util.List;

@Entity(name="cust") //db에 테이블 생성 Entity에 name달아주면 통신 때 편함
@Table(name="t_cust") //table 이름 설정
@NoArgsConstructor
@AllArgsConstructor(access = AccessLevel.PROTECTED) //같은 패키지 하위객체, 외부 접근 불가
@Builder
@ToString
@Getter
public class CustEntity extends BaseEntity{
    @Id
    @Column(name="cust_id", length=30) //column 이름 설정 가능
    private String id;
    @Column(nullable = false, columnDefinition = "varchar(60)")
    private String pwd;
    @Column(nullable = false, columnDefinition = "varchar(30)")
    private String name;

    @OneToOne(mappedBy = "cust")
    //OneToOne은 조인과 같이 쓰이지 않으면 사용이 불가능하다.
            //그대신 mappedBy를 써줬다.
    //ToString에 "exclude entity명" 하지 않으면 서로 무한 호출 둘 중 하나에서 빼줘야함
            //지금은 CustInfoEntity에서 빼줬음
    CustInfoEntity custInfo;

    @OneToMany(mappedBy = "cust", fetch = FetchType.EAGER) //나는 하나 쟤는 여러개
            @Builder.Default //담을 준비를 한 객체에 넣어준다.
    List<CustAddrEntity> custAddrs = new ArrayList<>(); //자동 세팅이 되지 않아서 담을 준비를 해야한다.
}
