package com.itwill.joo.dto;

import java.security.Timestamp;
import java.time.LocalDateTime;

import com.itwill.joo.domain.Reply;
import com.itwill.joo.domain.Review;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
@Builder
public class ReplyCreateDto {
	
	private long id;
	private long rid; // 답변 작성한 후기 아이디
	
	private String reply_content; // 후기 답변 내용
	
	private LocalDateTime rcreated_time; // 후기 답변 작성일자
	private LocalDateTime rmodified_time; // 후기 답변 수정일자
	
	public Reply toEntity() {
		return Reply.builder()
				.id(id)
				.rid(rid)
				.reply_content(reply_content)
				.rcreated_time(rcreated_time)
				.rmodified_time(rmodified_time)
				.build();
	}

}



















