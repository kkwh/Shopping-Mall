package com.itwill.joo.controller;

import java.security.Principal;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.naming.directory.SearchControls;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.itwill.joo.controller.ProductController;
import com.itwill.joo.domain.Criteria;
import com.itwill.joo.domain.Product;
import com.itwill.joo.domain.Recommend;
import com.itwill.joo.domain.User;
import com.itwill.joo.dto.question.QuestionsListDto;
import com.itwill.joo.dto.recommend.RecommendDto;
import com.itwill.joo.dto.recommend.RecommendListDto;
import com.itwill.joo.service.ProductService;
import com.itwill.joo.service.QuestionService;
import com.itwill.joo.service.RecommendService;
import com.itwill.joo.service.UserService;

import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;

@Slf4j
@RequiredArgsConstructor // 생성자 자동 생성
@RequestMapping("/product") // "/post" 로 시작하는 주소 다처리
@Controller
public class ProductController {

    private final ProductService productService;
    private final QuestionService questionService;
    private final RecommendService recommendService;
    
    // 상품들을 리스트에 보여줌.
	@GetMapping("/productsList")
	public void productList(Model model) {
	    List<Product> products = questionService.getProductList();
	    model.addAttribute("products", products);
	}

	// 상품문의 정보에 product 번호를 받아옴으로써 그 제품의 상세정보를 확인
    @GetMapping("/productDetail")
    public void list(@RequestParam("pid") long pid, Principal principal, Model model) {
        log.info("GET: productQuestionsList()");
        
       
        // 컨트롤러는 서비스 계층의 메서드를 호출한 후 서비스 기능을 수행
        List<QuestionsListDto> list = questionService.readProductId(pid);
        // Product products = productService.getProduct(pid);
        //String loginId = principal.getName();
        //long u_id = userService.getUserInfo(loginId).getId();
       // RecommendListDto selectRecommendProductByPid = recommendService.selectRecommendProductByPid(pid);
              
        
        // 뷰에 보여줄 데이터를 모델에 저장
        model.addAttribute("questionsList", list);
        model.addAttribute("productId", pid);
       // model.addAttribute("u_id", u_id);
        //model.addAttribute("selectRecommendProductByPid", selectRecommendProductByPid);
        log.info("questionsList: {}", list);
    }
    
    //제품 추천 등록
    @PostMapping
    public ResponseEntity<Integer> recommendCreate(@RequestBody RecommendDto dto) {
        log.info("recommendCreate()", dto);
        
        int result = recommendService.createRecommend(dto);
        
        return ResponseEntity.ok(result);
    }
    
    // 제품 추천 삭제
    @DeleteMapping("/{p_id}/{u_id}")
    @ResponseBody
    public ResponseEntity<Integer> recommendDelete(@PathVariable long u_id, @PathVariable long p_id) {
        log.info("recommendDelete()");
        
        int result = recommendService.deleteRecommend(u_id, p_id);
        
        return ResponseEntity.ok(result);
    }
    
	@GetMapping("/productsHotList")
	public void productsHotList() {

	}

	@GetMapping("/productsNewList")
	public void productsNewList() {

	}

}