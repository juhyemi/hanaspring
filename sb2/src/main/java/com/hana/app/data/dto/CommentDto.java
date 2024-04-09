package com.hana.app.data.dto;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.time.LocalDateTime;

@Data
@Builder
@AllArgsConstructor
@NoArgsConstructor
public class CommentDto {
    private int commentId;
    private int boardId;
    private String custId;
    private String commentContent;
    private LocalDateTime commentRegdate;
    private LocalDateTime commentUpdate;
}
