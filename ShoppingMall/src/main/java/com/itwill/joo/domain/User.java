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
/**
 * User 클래스 작성
 * @author 서원준
 *
 */
public class User {
	
	private long id;
	
	private String loginId; // 로그인 아이디
	private String password; // 비밀번호
	
	private String name; // 이름
	private String email; // 이메일
	private String phone; // 전화번호
	
	private String grade; // 회원등급 (기본값: BRONZE)
	
	private long currentPoint; // 현재 포인트 (기본값: 0)
	private long totalPoint; // 누적 포인트 (기본값: 0)
	
	// 주소
	private String street; // 도로명주소
	private String detailAddress; // 상세주소
	private String postcode; // 우편번호
	
	// 사용자 역할 (ROLE_USER, ROLE_ADMIN, ROLE_SOCIAL)
	private String role;
	
	private int isAuthenticated; // 사용자 인증 여부 (기본값: 0)
	
	private LocalDateTime createdTime; // 회원 가입일자
	private LocalDateTime modified_Time; // 회원정보 수정일자

}
