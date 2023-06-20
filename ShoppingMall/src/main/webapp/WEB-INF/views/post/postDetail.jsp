<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8" trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8" />
		<meta name="viewport" content="width=device-width, initial-scale=1"> <!-- 부트스트랩 -->
		<title>JOO</title>
		<link
			href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/css/bootstrap.min.css"
			rel="stylesheet"
			integrity="sha384-KK94CHFLLe+nY2dmCWGMq91rCGa5gtU4mk92HdvYe+M/SXH301p5ILy+dN9+nJOZ"
			crossorigin="anonymous">
	</head>
	<body>
		<div>
			<header class="my-1 p-3 text-bg-dark">
            <div>
                <nav class="navbar navbar-expand-lg bg-secondary">
                    <div class="container-fluid">
                        <!-- 홈과 로고클릭시 메인페이지로 이동 -->
                        <a class="navbar-brand" href="/joo/">로고</a>
                        <button class="navbar-toggler" type="button"
                            data-bs-toggle="collapse"
                            data-bs-target="#navbarSupportedContent"
                            aria-controls="navbarSupportedContent"
                            aria-expanded="false"
                            aria-label="Toggle navigation">
                            <span class="navbar-toggler-icon"></span>
                        </button>
                        
                        <div class="collapse navbar-collapse"
                            id="navbarSupportedContent">
                            <ul class="navbar-nav me-auto mb-2 mb-lg-0">
                                <li class="nav-item"><a
                                    class="nav-link active"
                                    aria-current="page" href="/joo/">Home</a>
                                </li>
                                
                                <!-- TODO : 로그인 회원가입 링크로 이동(로그인상태일때 비가시화) -->
                                <sec:authorize access="isAnonymous()">
                                    <li class="nav-item"><a
                                        class="nav-link" href="/joo/user/login">로그인</a></li>
                                    <li class="nav-item"><a
                                        class="nav-link" href="/joo/user/join">회원가입</a></li>
                                </sec:authorize>
                             
                                 <sec:authorize access="isAuthenticated()">
                                 <li class="nav-item"><a
                                        class="nav-link" href="/joo/user/logout">로그아웃</a></li>
                                 
                                 <li class="nav-item dropdown"><a
                                    class="nav-link dropdown-toggle"
                                    href="#" role="button"
                                    data-bs-toggle="dropdown"
                                    aria-expanded="false"> 마이페이지
                                </a>
                                    <ul class="dropdown-menu">
                                        <li><a
                                            class="dropdown-item"
                                            href="/joo/user/myDetails">개인정보 수정</a></li>
                                        <li><a
                                            class="dropdown-item"
                                            href="/joo/user/myGrade">적립금 확인</a></li>
                                        <li><a
                                            class="dropdown-item"
                                            href="/joo/user/myOrder">주문 내역</a></li>
                                        <li><a
                                            class="dropdown-item"
                                            href="/joo/questions/myQuestionsList">문의 내역</a></li>
                                        <hr class="dropdown-divider"></li>
                                        <li><a
                                            class="dropdown-item"
                                            href="/joo/user/myBasket">장바구니</a></li>
                                    </ul>
                                    </li>
                                 
                                
                                <!-- 최근본 상품은 모달로 처리 -->
                                
                                <li class="nav-item"><a class="nav-link" href="/joo/product/list">최근본상품</a></li>
                                <li class="nav-item"><a class="nav-link" href="/joo/questions/questionQnaList">문의하기</a></li>
                                </sec:authorize>
                            </ul>


  
                            <!-- 검색 페이지 -->
                            <form class="d-flex" role="search" action="/joo/product/productsList">
                                <input class="form-control me-2"
                                    type="search" placeholder="제품 검색"
                                    aria-label="Search" id="searchText">
                                <button class="btn btn-outline-success" type="submit">search</button>
                            </form>
                        </div>
                    </div>
                </nav>  
            </div>
            <h3 class="text-center">해더</h3>
            </header>
            
            <!-- 카테고리 네비 -->
            <ul class="nav nav-tabs">
    
                <li class="nav-item dropdown"><a
                    class="nav-link dropdown-toggle"
                    data-bs-toggle="dropdown" href="#" role="button"
                    aria-expanded="false">카테고리</a>
                    <ul class="dropdown-menu">
                        <li><a class="dropdown-item" href="/joo/product/productsList">모아보기</a></li>
                        <li><a class="dropdown-item" href="/joo/product/productsList">소주</a></li>
                        <li><a class="dropdown-item" href="/joo/product/productsList">맥주</a></li>
                        <li><a class="dropdown-item" href="/joo/product/productsList">와인</a></li>
                        <li><a class="dropdown-item" href="/joo/product/productsList">양주</a></li>
                    </ul></li>
                <li class="nav-item"><a class="nav-link" href="/joo/product/productsNewList">신상</a>
                </li>
                <li class="nav-item"><a class="nav-link" href="/joo/product/productsHotList">랭킹</a></li>
                <li class="nav-item"><a class="nav-link" href="/joo/post/postList">공지사항/이벤트</a></li>
            </ul>

		<main class="my-2">
			<div>
			<c:url value="https://www.imagetoday.co.kr/images2020/event/recom/01.jpg" var="im"> </c:url>
				<img src="${im}" class="rounded mx-auto d-block" id="image" width="100%" height="500"></img>
			</div>
		
			<section class="card">
				<form class="card-body">
					<div class="my-2">
						<label class="form-label" for="id">번호</label> 
						<input class="form-control" id="id" name="id" value="${ board.id }" readonly />
					</div>
					<div class="my-2">
						<label class="form-label" for="btype">타입</label> 
						<input class="form-control" id="btype" name="btype" value="${ board.btype }" readonly/>
					</div>
					<div class="my-2">
						<label class="form-label" for="btitle">제목</label> 
						<input class="form-control" id="btitle" value="${ board.btitle }" readonly/>
					</div>
					<div class="my-2">
						<label class="form-label" for="bcontent">내용</label>
						<textarea class="form-control" id="bcontent" readonly>${ board.bcontent }</textarea>
					</div>
					<%-- <div class="my-2">
						<label class="form-label" for="writer">작성자</label> <input
							class="form-control" id="writer" value="${ board.writer }" readonly />
					</div> --%>
					<div class="my-2">
						<label class="form-label" for="bcreated_time">등록 일자</label>
						<fmt:formatDate value="${ board.bcreated_time }" 
							pattern="yyyy-MM-dd HH:mm:ss" var="bcreated_time" />
						<input class="form-control" id="bcreated_time" value="${ bcreated_time }" readonly />
					</div>
					<div class="my-2">
						<label class="form-label" for="update_date">종료 일자</label>
						<fmt:formatDate value="${ board.bmodified_time }" 
							pattern="yyyy-MM-dd HH:mm:ss" var="bmodified_time" />
						<input class="form-control" id="bmodified_time" value="${ bmodified_time }" readonly />
					</div>
					<%-- <div class="my-2">
						<label class="form-label" for="image">이미지</label>
						<c:url value="/static/assets/bannerImages/001.jpg" var="im"> </c:url>
						<img src="${im}" class="rounded mx-auto d-block" id="image" width="100%" height="500" readonly></img>
					</div> --%>
				</form>
				
				<div class="card-footer">
					<c:if test="${ loginId eq 'admin' }">
	                    <c:url var="boardModifyPage" value="/joo/admin/postModify">
	                        <c:param name="id" value="${ board.id }"></c:param>
	                    </c:url>
	                    <a class="btn btn-outline-primary form-control"
	                        href="${ boardModifyPage }">수정하기</a>
	                </c:if>
                </div>
				
			</section>

		
		<a href="/joo/post/postList" class="btn btn-primary">목록</a>

		<footer class="my-1 p-3 text-bg-dark">
            <!-- 기업정보, 홈 인스타, 페이스북, 등등 필한거 -->
                <h1 class="text-center">풋터</h1>
                <a href="">home</a>
            </footer>
         
			<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/js/bootstrap.bundle.min.js"
			integrity="sha384-ENjdO4Dr2bkBIFxQpeoTz1HIcje39Wm4jDKdf19U8gI4ddQ3GYNS7NTKfAdVQSZe"
			crossorigin="anonymous"></script>
		</div>
	</body>
</html>
