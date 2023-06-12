package com.itwill.joo.service;

import org.springframework.stereotype.Service;

import com.itwill.joo.repository.ReplyRepository;
import com.itwill.joo.repository.ReviewRepository;
import com.itwill.joo.dto.ReplyCreateDto;

import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;

@Service
@RequiredArgsConstructor
@Slf4j
public class ReplyService {
	
	private final ReplyRepository replyRepository;
	
	public int create(ReplyCreateDto dto) {
        log.info("create(dto={})", dto);
        
        return replyRepository.insert(dto.toEntity());
    }

}
