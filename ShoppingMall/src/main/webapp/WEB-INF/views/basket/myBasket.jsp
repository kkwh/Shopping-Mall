<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		 <meta name="viewport" content="width=device-width, initial-scale=1" />
		<title>basket</title>
		<link
		href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css"
		rel="stylesheet"
		integrity="sha384-9ndCyUaIbzAi2FUVXJi0CjmCapSmO7SnpJef0486qhLnuZ2cdeRhO02iuK6FUUVM"
		crossorigin="anonymous">
		
	<style>
   		table, th, td {
  border: 1px solid black;
}
 	.hidden {
            display: none;
        }
 
</style>
	</head>
	<body>
	
		 <header>
			<h1>
				<sec:authorize access="isAuthenticated()">
					<p><sec:authentication property="principal.username"/>의 장바구니</p>
				</sec:authorize>
			</h1>
			<c:choose>
				<c:when test="${empty basketproducts}">
					<p class="empty-basket">장바구니가 비었습니다.</p>
				</c:when>
			</c:choose>
		</header>
		<main class="${empty basketproducts ? 'hidden' : ''}">		
		
			<form id="deleteForm">
				<table id="basketProductList" >
					<thead>
						<tr>
							<th><input type="checkbox" id="all_ckeckbox" name="all_ckeckbox"/></th>
							<th>상품이름</th>
							<th>가격</th>
							<th>수량</th>
							<th>삭제</th>
						</tr>
					</thead>
				
					<tbody>
						<c:forEach items="${basketproducts }" var="basketproduct">					
								<tr>
									<td>
										<input type="checkbox" id="row-checkbox" />	
									</td>
									<td>${ basketproduct.pname }</td>
									<td>${ basketproduct.pprice }</td>
									<td><button>-</button> ${ basketproduct.pcount }  <button>+</button></td>
									<td><button id="btnDelete"  data-id="${ basketproduct.id }">삭제하기</button></td>
								</tr>		
						</c:forEach>					
					</tbody>
				</table>
			</form>	
				
				
				<div>
					<div>
						<button>전체 주문</button>
						<button>선택 상품 주문</button>
						<button id="btndeleteAll"  >전체 삭제</button>
						<script>
							
						</script>
					</div>
				</div>

	
		</main>
		<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
	<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
	<script>
    $(document).ready(function() {
        $("#btndeleteAll").click(function() {
            // 삭제 여부 확인 대화상자 표시
            if (confirm("정말 전체 삭제하시겠습니까?")) {
                // 사용자가 "예" 버튼을 클릭한 경우
                $.ajax({
                    url: "/joo/user/deleteAll",
                    type: "POST",
                    success: function(result) {
                        // 삭제 후 처리할 내용
                        alert('전체 삭제 완료');
                        window.location.href = "/joo/user/myBasket"; // 장바구니 리스트 페이지로 리다이렉트
                    },
                    error: function(xhr, status, error) {
                        alert(error);
                    }
                });
            } else {
                // 사용자가 "아니오" 버튼을 클릭한 경우
                // 아무 동작도 수행하지 않음
            }
        });
    });
</script>

		<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/js/bootstrap.bundle.min.js" 
            integrity="sha384-ENjdO4Dr2bkBIFxQpeoTz1HIcje39Wm4jDKdf19U8gI4ddQ3GYNS7NTKfAdVQSZe" 
            crossorigin="anonymous"></script>
    	 <script src="../static/js/basketPage/basketproduct-delete.js"></script>
	</body>
</html>