package com.itwill.joo.controller;

import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestPart;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.multipart.MultipartFile;

import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;

@RestController
@RequiredArgsConstructor
@Slf4j
@RequestMapping("/api/AdminProductImage")
public class AdminProductImageRestController {

	@PostMapping("/ProductTitleImage")
	public void productTitleImageProcess(@RequestPart("ptitle_image") MultipartFile title_image) {
		// 파일이 빈값일 경우 = 기존에 있던 파일이 지워진것 전에 파일 삭제해야한다.
		if (title_image.isEmpty()) {
			
			// 상품이름의 폴더가 있으면 폴더를 삭제한다.
			
            return ;
        }
		// 저장 경로 설정
		String Route = "../static/assets/porducts";
		// 폴더 이름 설정 = 제품이름
		// 
		
		
		log.info("타이틀 파일 처리 타이틀파일 이름 = {}",title_image);
		log.info("타이틀 name = {}",title_image.getName());
		log.info("타이틀 size = {}",title_image.getSize());
		log.info("타이틀 type = {}",title_image.getContentType());
		
		
	}
	
}
