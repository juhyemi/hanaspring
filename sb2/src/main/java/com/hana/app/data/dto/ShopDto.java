package com.hana.app.data.dto;

import lombok.*;

@Data
@Builder
@AllArgsConstructor
@NoArgsConstructor
public class ShopDto {
    private int id;
    private String title;
    private String img;
    private double lat;
    private double lng;
}
