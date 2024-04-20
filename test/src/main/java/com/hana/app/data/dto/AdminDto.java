package com.hana.app.data.dto;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.time.LocalDate;
import java.util.Date;

@Data
@Builder
@AllArgsConstructor
@NoArgsConstructor
public class AdminDto {
    private int memberIdx;
    private String memberId;
    private String memberPw;
    private String memberName;
    private String memberEmail;
    private Date memberJoinDate;
}