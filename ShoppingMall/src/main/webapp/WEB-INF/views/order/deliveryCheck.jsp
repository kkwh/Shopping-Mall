<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" trimDirectiveWhitespaces="true"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
    <title>배송 조회</title>
    <style>
    .container {
    max-width: 600px;
    margin: 0 auto;
    padding: 20px;
    background-color: #f2f2f2;
    text-align: center;
    }
    
    h1 {
        color: #333;
    }
    
    form {
        margin-top: 20px;
    }
    
    label {
        display: inline-block;
        margin-bottom: 5px;
    }
    
    input[type="text"] {
        padding: 5px;
        width: 200px;
    }
    
    button[type="submit"] {
        padding: 5px 10px;
    }
    
    .tracking_result {
        margin-top: 30px;
        border: 1px solid #ccc;
        padding: 10px;
        text-align: left;
    }
    
    h2 {
        color: #333;
        margin-top: 0;
        margin-bottom: 10px;
    }
    
    p {
        margin-top: 0;
        margin-bottom: 5px;
    }
    </style>
    <link rel="stylesheet" type="text/css" href="style.css">
</head>
<body>
    <div class="container">
        <h1>배송 조회</h1><!--
        <form>
            <label for="tracking_number">송장 번호:</label>
            <input type="text" id="tracking_number" name="tracking_number">
            <button type="submit">조회</button>
        </form>-->
        <div class="tracking_result">
            <h2>조회 결과</h2>
            <p>현재 상태: 배송준비중</p>
            <p>송장 번호: 525695310978</p>
            <p>예상 배송일: 2023년 6월 15일</p>
            <p>받는 사람: 홍길동</p>
            <p>배송 주소: 서울시 강남구</p>
        </div>
    </div>
</body>
</html>

