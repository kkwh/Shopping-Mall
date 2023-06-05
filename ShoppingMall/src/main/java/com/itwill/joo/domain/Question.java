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
public class Question {
	
	private long id;
	private long userId; // 문의 작성한 사용자 아이디
	private long productId; // 상품관련 문의일 경우 상품 아이디
	
	private String title; // 문의 제목
	private String content; // 문의 내용
	private String type; // 문의 타입
	
	// ERD에 없는데 필요할거 같아서 새로 추가
	private int isAnswered; // 답변 완료된 문의 인지 확인 (0 -> 미완료, 1 -> 답변완료) (기본값: 0)
	
	private LocalDateTime createdTime; // 문의 작성일자
	private LocalDateTime modifiedTime; // 문의 수정일자

}
