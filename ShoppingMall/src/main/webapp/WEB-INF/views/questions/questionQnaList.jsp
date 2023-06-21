<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" trimDirectiveWhitespaces="true"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8" />
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>상품문의</title>

     </head>
        <body>
        <div>
        <header>
           <jsp:include page="../common/header.jsp"></jsp:include>
        </header>
        
            <div class="my-2 p-5 text-center text-bg-dark">
                <h1> Q & A 문의 (총 ${questionQnaList.size()}건)</h1>
            </div>



    <nav class="navbar navbar-expand-lg bg-body-tertiary">
        <ul class="navbar-nav bg-light">
                <li class="nav-item">
                    <c:url var="mainPage" value="/" /> 
                    <a class="nav-link" href="${ mainPage }">메인 페이지</a>
                </li>
                <li class="nav-item">
                    <c:url var="questionFaqListPage" value="/questions/questionFaqList" />
                   <a class="nav-link" href=${ questionFaqListPage }>자주묻는 질문</a>
                </li>
                <sec:authorize access="isAuthenticated()">
                <li class="nav-item">
                    <c:url var="questionQnaCreatePage" value="/questions/questionQnaCreate" /> 
                    <a class="nav-link" href="${questionQnaCreatePage}">새 문의사항 작성</a>
                </li>
                </sec:authorize>

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
                        <th>작성자 아이디</th>
                        <th>작성시간</th>
                    </tr>
               
                </thead>
                <tbody>
                   <!-- var는 도메인 모델 이름! -->
                    <c:forEach items="${questionQnaList }" var="question">
                        <tr>
                            <td>${ question.id }</td>
                            <td>${ question.is_answered }</td>
                            <td>${ question.qtype }</td>
                            <td> 
                                <c:url var ="QuestionDetailPage" value="/questions/questionQnaDetail">
                                    <c:param name="id" value="${ question.id }" />
                                </c:url>
                                <a href="${ QuestionDetailPage }">${ question.qtitle }</a>
                            </td>
                            
                            <td>${ question.login_id }</td>
                            <td>
                                    <fmt:formatDate
                                        value="${ question.qcreated_time }"
                                        pattern="yyyy-MM-dd HH:MM:mm" />
                            </td>
                        </tr>
                    </c:forEach>
                </tbody>
            </table>
            
       </main>
       </div>
</body>
</html>

<footer>
       <jsp:include page="../common/footer.jsp"></jsp:include>
</footer>