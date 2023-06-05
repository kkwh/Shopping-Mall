package com.itwill.joo.domain;

import java.time.LocalDateTime;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
@Builder
public class Product {
	
	private long id;
	
	private String name; // 상품 이름
	private String category; // 상품 카테고리
	private String region; // 상품 원산지
	private String titleImage; // 상품 타이틀 이미지 경로
	private String detailImage; // 상품 상세 이미지 경로
	
	private int alcohol; // 상품 도수
	private int sold; // 상품 판매량 (기본값: 0)
	
	private LocalDateTime createdTime; // 상품 등록일자
	private LocalDateTime modifiedTime; // 상품 수정일자

}
