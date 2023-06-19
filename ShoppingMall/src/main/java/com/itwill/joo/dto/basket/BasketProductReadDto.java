package com.itwill.joo.dto.basket;

import com.itwill.joo.domain.BasketProduct;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;

@NoArgsConstructor
@Getter
@Setter
@ToString
@AllArgsConstructor
@Builder
public class BasketProductReadDto {

    private long id;
    private long p_id;
    private long b_id;
    private int pcount;
    
    public static BasketProductReadDto fromEntity(BasketProduct entity) {
        return BasketProductReadDto.builder()
                .id(entity.getId())
                .p_id(entity.getP_id())
                .b_id(entity.getB_id())
                .pcount(entity.getPcount())
                .build();
    }
}
