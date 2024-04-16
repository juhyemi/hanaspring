package com.hana.app.data.dto;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.time.LocalDateTime;
import java.util.List;

@Data
@Builder
@AllArgsConstructor
@NoArgsConstructor
public class BoardDto {
    private int boardId;
    private String custId;
    private String boardTitle;
    private String boardContent;
    private LocalDateTime boardRegdate;
    private LocalDateTime boardUpdate;
    private int boardCnt; //조회수
    //조회시 comment 개수 확인을 위한 field
    private int commentCnt; //댓글수
    //한 건 조회시에만 사용
    private List<CommentDto> commentList;
}
