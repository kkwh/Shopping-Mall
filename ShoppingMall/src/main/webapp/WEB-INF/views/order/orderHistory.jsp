<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" trimDirectiveWhitespaces="true"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8" />
<meta name="viewport" content="width=device-width, initial-scale=1">
<!-- 부트스트랩 -->
<title>JOO</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-KK94CHFLLe+nY2dmCWGMq91rCGa5gtU4mk92HdvYe+M/SXH301p5ILy+dN9+nJOZ" crossorigin="anonymous">
<link rel="stylesheet" href="../static/css/myOrder.css">
<style>
.container {
    display: flex;
    justify-content: center;
    align-items: center;
}

.order-history, .cancel-history {
    margin: 0 10px; /* 일정한 간격을 조정할 수 있는 여백을 지정합니다. */
}
</style>
</head>
<body>
    <div>
        <header class="my-1 p-3 text-bg-dark">
            <div>
                <nav class="navbar navbar-expand-lg bg-secondary">
                    <div class="container-fluid">
                        <!-- 홈과 로고클릭시 메인페이지로 이동 -->
                        <a class="navbar-brand" href="/joo01/">로고</a>
                        <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
                            <span class="navbar-toggler-icon"></span>
                        </button>

                        <div class="collapse navbar-collapse" id="navbarSupportedContent">
                            <ul class="navbar-nav me-auto mb-2 mb-lg-0">
                                <li class="nav-item"><a class="nav-link active" aria-current="page" href="/joo01/">Home</a></li>

                                <!-- TODO : 로그인 회원가입 링크로 이동(로그인상태일때 비가시화) -->
                                <li class="nav-item"><a class="nav-link" href="/joo01/user/sign">로그인/회원가입</a></li>

                                <li class="nav-item dropdown"><a class="nav-link dropdown-toggle" href="#" role="button" data-bs-toggle="dropdown" aria-expanded="false"> 마이페이지 </a>
                                    <ul class="dropdown-menu">

                                        <li><a class="dropdown-item" href="/joo01/user/myPrivate">개인정보 수정</a></li>
                                        <li><a class="dropdown-item" href="/joo01/user/myGrade">적립금 확인</a></li>
                                        <li><a class="dropdown-item" href="/joo01/user/myOrder">주문 내역</a></li>
                                        <li><a class="dropdown-item" href="/joo01/user/myQuseries">문의 내역</a></li>
                                        <li><hr class="dropdown-divider"></li>
                                        <li><a class="dropdown-item" href="/joo01/user/myBasket">장바구니</a></li>

                                    </ul></li>
                                <!-- 최근본 상품은 모달로 처리 -->
                                <li class="nav-item"><a class="nav-link" href="">최근본상품</a></li>
                                <li class="nav-item"><a class="nav-link" href="">문의하기</a></li>
                            </ul>
                            <!-- 검색 페이지 -->
                            <form class="d-flex" role="search" action="/joo01/product/productsList">
                                <input class="form-control me-2" type="search" placeholder="제품 검색" aria-label="Search" id="searchText">
                                <button class="btn btn-outline-success" type="submit">search</button>
                            </form>
                        </div>
                    </div>
                </nav>
            </div>
        </header>

        <div class="container">
            <h3 class="order-history">
                <button id="btnOrder" class="btn btn-outline-primary col-12 mx-auto">주문 내역 조회</button>
            </h3>
            <h3 class="cancel-history">
                <button id="btnCancel" class="btn btn-outline-primary col-12 mx-auto">취소 내역 조회</button>
            </h3>
        </div>

        <div class="order-filter">
            <div class="order-filter-period">
                <div class="order-filter-period__button">
                    <button type="button" class="order-filter-period__tab__button">1주일</button>
                    <button type="button" class="order-filter-period__tab__button">1개월</button>
                    <button type="button" class="order-filter-period__tab__button">3개월</button>
                    <button type="button" class="order-filter-period__tab__button">6개월</button>
                </div>
                <div class="order-filter-period__date">
                    <div class="order-filter-period__input-wrap">
                        <input type="date" class="order-filter-period__input" name="dt_fr_input" value="" placeholder="-">
                    </div>
                    <div class="order-filter-period__input-wrap">
                        <input type="date" class="order-filter-period__input" name="dt_to_input" value="" placeholder="-">
                    </div>
                </div>
                <button type="button" class="order-filter-confirm ">조회하기</button>
            </div>
        </div>

        <!-- 주문 내역 조회 테이블 -->
        <table id="order-table" class="n-table table-col n-order-view" width="100%">
            <colgroup>

                <col style="width: 14.2%">
                <col style="width: 14.2%">
                <col style="width: 14.2%">
                <col style="width: 10.2%">
                <col style="width: 11%">
            </colgroup>
            <thead>
                <tr>
                    <th scope="col">상품정보</th>
                    <th scope="col">수량</th>
                    <th scope="col">금액</th>
                    <th scope="col">주문일자</th>
                    <th scope="col" colspan="2">주문 상태</th>
                </tr>
            </thead>
            
            <tbody>

                <c:forEach items="${ orders }" var="order">
                    <c:set var="cancelComple" value="취소완료" />
                    <c:set var="payComple" value="결제완료" />
                    <c:set var="deliveryReady" value="배송준비중" />
                    <c:set var="deliverying" value="배송중" />
                    <c:set var="deliveryComple" value="배송완료" />
                    <c:set var="buyComple" value="구매확정" />
                    <c:if test="${ order.dstatus ne cancelComple }">
                        <tr>
                            <td>
                                <div class="n-prd-row">
                                    <a href="/joo01/product/productDetail" class="img-block"> <img src="${ order.ptitle_image }" alt="전통주" width="100">
                                    </a>${ order.pname } ${ order.id }
                                </div>
                            </td>
                            <td>${ order.pstock }개</td>
                            <td>
                                KRW ${ order.pprice }</a>
                            </td>
                            <td>
                                <fmt:formatDate value="${ order.ocreated_time }" pattern="yyyy.MM.dd" var="created" />
                                ${ created }
                            </td>
                            
                            <td class="txt-lighter">
                                <div class="btn-set btn-parents">
                                    <c:choose>
                                        <c:when test="${order.dstatus eq payComple }"> <!-- 결제완료 -->
                                             <div style="color: black; font-weight: bold;">
                                                ${ order.dstatus }
                                             </div>
                                             <c:url var="deliveryCheck" value="/order/deliveryCheck">
                                                <c:param name="id" value="${ order.id }" />
                                             </c:url>
                                                <a href="${ deliveryCheck }" target="_blank" onclick="openWindowWithPosition(event)">
                                                    <button type="button" class="btn btn-primary btn-sm float-right ml-2" >배송조회</button>
                                                </a>
                                             <button id="cancelOrderButton" type="button" class="btn btn-danger btn-sm float-right" data-orderid="${order.id}">주문취소</button>

                                                <!-- 주문 취소 모달 -->
                                                <div id="cancelOrderModal" class="modal">
                                                    <div class="modal-content">
                                                        <span class="close">&times;</span>
                                                        <h2>주문 취소 확인</h2>
                                                        <p>주문을 취소하시겠습니까?</p>
                                                        <button id="confirmCancel">확인</button>
                                                    </div>
                                                </div>
                                        </c:when>
                                        <c:when test="${order.dstatus eq deliveryReady }"> <!-- 배송준비중 -->
                                             <div style="color: black; font-weight: bold;">
                                                ${ order.dstatus }
                                             </div> 
                                             <c:url var="deliveryCheck" value="/order/deliveryCheck">
                                                <c:param name="id" value="${ order.id }" />
                                             </c:url>
                                                <a href="${ deliveryCheck }" target="_blank" onclick="openWindowWithPosition(event)">
                                                    <button type="button" class="btn btn-primary btn-sm float-right ml-2" >배송조회</button>
                                                </a>
                                             <div class="btn btn-danger btn-sm float-right">취소불가</div>
                                        </c:when>
                                        <c:when test="${order.dstatus eq deliverying }">  <!-- 배송중 -->
                                             <div style="color: black; font-weight: bold;">
                                                ${ order.dstatus }
                                             </div>
                                             <c:url var="deliveryCheck" value="/order/deliveryCheck">
                                                <c:param name="id" value="${ order.id }" />
                                             </c:url>
                                                <a href="${ deliveryCheck }" target="_blank" onclick="openWindowWithPosition(event)">
                                                    <button type="button" class="btn btn-primary btn-sm float-right ml-2" >배송조회</button>
                                                </a>
                                              <div class="btn btn-danger btn-sm float-right">취소불가</div>
                                        </c:when>
                                        <c:when test="${order.dstatus eq deliveryComple }"> <!-- 배송완료 -->
                                             <div style="color: black; font-weight: bold;">
                                                ${ order.dstatus }
                                             </div> 
                                             <c:url var="deliveryCheck" value="/order/deliveryCheck">
                                                <c:param name="id" value="${ order.id }" />
                                             </c:url>
                                                <a href="${ deliveryCheck }" target="_blank" onclick="openWindowWithPosition(event)">
                                                    <button type="button" class="btn btn-primary btn-sm float-right ml-2" >배송조회</button>
                                                </a>
                                              <button id="confirmOrderButton" type="button" class="btn btn-danger btn-sm float-right" data-confirmid="${order.id}">구매확정</button>
                                              
                                              <!-- 구매 확정 모달 -->
                                              <div id="confirmOrderModal" class="modal">
                                                <div class="modal-content">
                                                    <span class="closeOrder">&times;</span>
                                                        <h2>구매 확정 확인</h2>
                                                            <p>구매를 확정하시겠습니까?</p>
                                                                <button id="confirmOrder">확인</button>
                                                </div>
                                              </div>
                                        </c:when>
                                        <c:otherwise>
                                             <div style="color: black; font-weight: bold;">
                                                ${ order.dstatus }
                                             </div> 
                                             <!-- <a href="/joo/order/deliveryCheck" target="_blank"> -->
                                             <c:url var="deliveryCheck" value="/order/deliveryCheck">
                                                <c:param name="id" value="${ order.id }" />
                                             </c:url>
                                                <a href="${ deliveryCheck }" target="_blank" onclick="openWindowWithPosition(event)">
                                                    <button type="button" class="btn btn-primary btn-sm float-right ml-2" >배송조회</button>
                                                </a>
                                                <button type="button" class="btn btn-danger btn-sm float-right">후기작성</button>
                                        </c:otherwise>
                                    </c:choose>
                                    
                                   <%--  ${ order.dstatus } <a href="https://tracker.delivery/#/kr.epost/6113101024721" target="_blank">
                                        <button type="button" class="btn btn-primary btn-sm float-right ml-2" onclick="openWindowWithPosition('https://tracker.delivery/#/kr.epost/6113101024721')">배송조회</button>
                                                       </a>
                                    <button id="cancelOrderButton" type="button" class="btn btn-danger btn-sm float-right">주문취소</button>

                                    <!-- 주문 취소 모달 -->
                                    <div id="cancelOrderModal" class="modal">
                                        <div class="modal-content">
                                            <span class="close">&times;</span>
                                            <h2>주문 취소 확인</h2>
                                            <p>주문을 취소하시겠습니까?</p>
                                            <button id="confirmCancel">확인</button>
                                        </div>
                                    </div> --%>

                                </div>
                            </td>
                        </tr>
                    </c:if>
                </c:forEach>
            </tbody>
        </table>

        <!-- 취소 내역 조회 테이블 -->
        <table id="cancel-table" class="n-table table-col n-order-view" width="100%" style="display: none;">
            <colgroup>
                <col style="width: 14.2%">
                <col style="width: 14.2%">
                <col style="width: 14.2%">
                <col style="width: 10.2%">
                <col style="width: 11%">
            </colgroup>
            <thead>
                <tr>
                    <th scope="col">상품정보</th>
                    <th scope="col">수량</th>
                    <th scope="col">금액</th>
                    <th scope="col">취소일자</th>
                    <th scope="col" colspan="2">주문 상태</th>
                </tr>
            </thead>
                
            <tbody>
                <c:forEach items="${ orders }" var="order">
                    <c:if test="${order.dstatus eq cancelComple }">
                        <tr>
                            <td>
                                <div class="n-prd-row">
                                    <a href="/joo01/product/productDetail" class="img-block"> <img src="${ order.ptitle_image }" alt="전통주" width="100">
                                    </a>${ order.pname }
                                </div>
                            </td>
                            <td>${ order.pstock }개</td>
                            <td>
                                KRW ${ order.pprice }</a>
                            </td>
                            <td>
                                <fmt:formatDate value="${ order.dmodified_time }" pattern="yyyy.MM.dd" var="created" />
                                ${ created }
                            </td>
                            <td class="txt-lighter">
                                <div class="btn-set btn-parents">${ order.dstatus }</div>
                            </td>
                        </tr>
                    </c:if>

                </c:forEach>
            </tbody>
        </table>

        <footer class="my-1 p-3 text-bg-dark">
            <!-- 기업정보, 홈 인스타, 페이스북, 등등 필한거 -->
            <h1 class="text-center">풋터</h1>

            <a href="">home</a>
        </footer>

        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ENjdO4Dr2bkBIFxQpeoTz1HIcje39Wm4jDKdf19U8gI4ddQ3GYNS7NTKfAdVQSZe" crossorigin="anonymous"></script>
        <script src="https://cdn.jsdelivr.net/npm/axios/dist/axios.min.js"></script>
        <script src="../static/js/order/myOrder.js"></script>
    </div>
</body>
</html>