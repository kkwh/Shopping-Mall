package com.itwill.joo.domain;

import org.springframework.stereotype.Component;
import org.springframework.web.util.UriComponentsBuilder;

import com.oracle.wls.shaded.org.apache.xalan.lib.sql.QueryParameter;

import lombok.Data;


// 채한별
// 페이징 도메인
@Component
@Data
public class Criteria {
    private int pageNum; // 페이지 번호
    private int amount;    // 한 페이지의 보여줄수 있는 개수 
    private String type;   
    private String keyword;
   
    
    // 기본 페이지를 1 페이지에 7개씩 보임
    public Criteria() {
        this(1, 7);
    }
    
    // 매개변수로 들어오는 값을 이용하여 조정
    public Criteria(int pageNum, int amount) {
        this.pageNum= pageNum;
        this.amount= amount;
    }
    
    // UriComponentsBuilder를 이용해 링크 생성
    public String getListLink() {
        UriComponentsBuilder builder = UriComponentsBuilder.fromPath("")
                .queryParam("pageNum", pageNum)
                .queryParam("amount", amount);
        
        return builder.toUriString();
    }
    
    public String[] getTypeArr() { // get으로 시작해야만 myBatis에서 찾을수있음
        return type == null ? new String[]{} : type.split(""); 
    }
}
