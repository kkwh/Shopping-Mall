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
		 <header class="my-2 p-5 text-center text-bg-dark">
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
		 <input type="hidden" id="basketId" name="basketId" value="${ basketId }">
			<form id="deleteForm">
				<table id="basketProductList" >
					<thead>
						<tr>
                            <th>상품 아아디</th>
							<th>상품이름</th>
							<th>가격</th>
							<th>수량</th>
							<th>삭제</th>
						</tr>
					</thead>
					<tbody>
                        <c:set var="totalPrice" value="0" />
						<c:forEach items="${basketproducts }" var="basketproduct">	
                        			
								<tr>
                                    <input type="hidden" value="${ basketproduct.p_id }" class="p_id" data-id="${ basketproduct.p_id }" />  
               						<td>${ basketproduct.p_id }</td>			
									<td>${ basketproduct.pname }</td>
									<td>${ basketproduct.pprice }</td>
									<td>
                                        <button class="btnMinus" data-id="${ basketproduct.p_id }">-</button>
                                          <span class="count">${ basketproduct.pcount }</span>
                                          <input type="hidden" class="pcount" value="${ basketproduct.pcount }"/>
                                        <button class="btnPlus"  data-id="${ basketproduct.p_id }">+</button>
                                    </td>
									<td><button id="btnDelete"  data-id="${ basketproduct.id }">삭제하기</button></td>
								</tr>
                       <c:set var="totalPrice" value="${totalPrice + (basketproduct.pprice * basketproduct.pcount)}" />		
						</c:forEach>	
                      				
					</tbody>
				</table>
			</form>	
				<div>
                     <table>
                           <thead>
                               <tr>
                                   <th>총 예상 가격: ${totalPrice}</th>
                               </tr>
                           </thead>
                           <tbody>
                               <tr>
                                  <td></td>
                               </tr>
                           </tbody>
                     </table>
               </div>
				
				<div>
					<div>
						<button>전체 주문</button>
						<button type="button" id="btndeleteAll"  >전체 삭제</button>
					</div>
				</div>
	
		</main>
	    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>

<script src="https://cdn.jsdelivr.net/npm/axios/dist/axios.min.js"></script>
 <script>
 // 버튼과 수량 요소 선택
 var btnPlus = document.querySelectorAll('.btnPlus');
 var btnMinus = document.querySelectorAll('.btnMinus');
 var count = document.querySelectorAll('.count');

 // 버튼 클릭 이벤트 처리
 for (var i = 0; i < btnPlus.length; i++) {
   btnPlus[i].addEventListener('click', function() {
	   event.preventDefault();
     var currentCount = parseInt(this.parentNode.querySelector('.count').innerHTML);
     if (currentCount < 5) {
       var newCount = currentCount + 1;
       this.parentNode.querySelector('.count').innerHTML = newCount;
     } else {
       alert('최대 수량은 5입니다.');
     }

     const b_id = document.querySelector('#basketId').value;
     console.log('b_id = ' + b_id);
     const p_id = this.getAttribute('data-id');
     console.log('p_id = ' + p_id);
     const pcount = this.parentNode.querySelector('.count').innerHTML;
     console.log('pcount = ' + pcount);
     
     axios
     	.post('/joo/user/updateQuantity', {b_id, p_id, pcount})
     	.then(resp => {
     		console.log(resp.data);
     		alert('success');
     		location.reload();
     	})
     	.catch(e => {
     		alert(e);
     		console.log(e);
     	});
     
   });
 }

 for (var i = 0; i < btnMinus.length; i++) {
	  btnMinus[i].addEventListener('click', function(event) {
	    event.preventDefault(); // 폼 제출 기본 동작 막기
	    var currentCount = parseInt(this.parentNode.querySelector('.count').innerHTML);
	    if (currentCount > 1) {
	      var newCount = currentCount - 1;
	      this.parentNode.querySelector('.count').innerHTML = newCount;
	    } else {
	      alert('최소 수량은 1입니다.');
	    }
	    
	    const b_id = document.querySelector('#basketId').value;
	     console.log('b_id = ' + b_id);
	     const p_id = this.getAttribute('data-id');
	     console.log('p_id = ' + p_id);
	     const pcount = this.parentNode.querySelector('.count').innerHTML;
	     console.log('pcount = ' + pcount);
	     
	     axios
	     	.post('/joo/user/updateQuantity', {b_id, p_id, pcount})
	     	.then(resp => {
	     		console.log(resp.data);
	     		alert('success');
	     		location.reload();
	     	})
	     	.catch(e => {
	     		alert(e);
	     		console.log(e);
	     	});
	  });
	}
 </script>

   <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
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