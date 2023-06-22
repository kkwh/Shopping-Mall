<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" trimDirectiveWhitespaces="true"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8" />
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>상품문의</title>
    <link
        href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/css/bootstrap.min.css"
        rel="stylesheet"
        integrity="sha384-KK94CHFLLe+nY2dmCWGMq91rCGa5gtU4mk92HdvYe+M/SXH301p5ILy+dN9+nJOZ"
        crossorigin="anonymous">
    </head>
        <body>
            <div class="container-fluid">
            <header class="my-2 p-5 text-center text-bg-dark">
                <h1> 상품문의 (총 ${myQuestionsList.size()}건)</h1>
            </header>

    <nav class="navbar navbar-expand-lg bg-body-tertiary">
        <ul class="navbar-nav bg-light">
                <li class="nav-item">
                    <c:url var="mainPage" value="/" /> 
                    <a class="nav-link" href="${ mainPage }">메인 페이지</a>
                </li>
                <li class="nav-item">
                    <c:url var="questionCreatePage" value="/questions/questionCreate" /> 
                    <a class="nav-link" href="${ questionCreatePage }">새 문의사항 작성</a>
                </li>
         </ul>
    </nav>

    <main class="my-2">
        <div class="card">
            <table class ="card-body table table-hover">
                <thead>
                  
                    <tr>
                        <th>번호</th>
                        <th>답변여부</th>
                        <th>문의 유형</th>
                        <th>제목</th>
                        <th>작성시간</th>
                        <th>제품 이름</th>
                    </tr>
               
                </thead>
                <tbody>
                   <!-- var는 도메인 모델 이름! -->
                    <c:forEach items="${myQuestionsList }" var="question">
                        <tr>
                            <td>${ question.id }</td>
                            <td>${ question.is_answered }</td>
                            <td>${ question.qtype }</td>
                            <td> 
                                <c:url var ="QuestionDetailPage" value="/questions/questionDetail">
                                    <c:param name="q_id" value="${ question.id }" />
                                </c:url>
                                <a href="${ QuestionDetailPage }">${ question.qtitle }</a>
                            </td>
                            <td>
                                    <fmt:formatDate
                                        value="${ question.qcreated_time }"
                                        pattern="yyyy-MM-dd HH:MM:mm" />
                            </td>
                            <td>${ question.product.pname}</td>
                        </tr>
                    </c:forEach>
                </tbody>
            </table>
            <!--페이징 -->
            <div class="pull-right">
                        <ul class="pagination">
                            <c:if test="${ pageMaker.prev }">
                                <li class="page-item"><a class="page-link"
                                    href="${ pageMaker.startPage -1 }"> 이전 </a>
                                </li>
                            </c:if>
                            <c:forEach begin="${ pageMaker.startPage }"
                                end="${ pageMaker.endPage }" var="num">
                                <li class="page-item ${ pageMaker.cri.pageNum == num ? "active" : "" } ">
                                    <a class="page-link" href="${ num }">${ num }</a>
                                </li>
                            </c:forEach>
                            <c:if test="${ pageMaker.next }">
                                <li class="page-item"><a class="page-link"
                                    href="${ pageMaker.endPage +1 }"> 다음 </a></li>
                            </c:if>
                        </ul>
                    </div>
                    <form id="actionForm" action="/joo/questions/questionsMyList" method="get">
                        <input type="hidden" name="pageNum" value="${ pageMaker.cri.pageNum }" /> 
                        <input type="hidden" name="amount" value="${ pageMaker.cri.amount }" /> 
                        <input type="hidden" name="category" value="${ pageMaker.cri.category }" />
                        <input type="hidden" name="keyword" value="${ pageMaker.cri.keyword }" />
                    </form>
                        
    
                        <script
                            src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/js/bootstrap.bundle.min.js"
                            integrity="sha384-ENjdO4Dr2bkBIFxQpeoTz1HIcje39Wm4jDKdf19U8gI4ddQ3GYNS7NTKfAdVQSZe"
                            crossorigin="anonymous"></script>
           </div>
      </main>
</body>
</html>