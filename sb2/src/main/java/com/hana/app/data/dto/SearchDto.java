package com.hana.app.data.dto;

import lombok.*;

@Data
@Builder
@AllArgsConstructor
@NoArgsConstructor
public class SearchDto {
    private int id;
    private String keyword;
}
