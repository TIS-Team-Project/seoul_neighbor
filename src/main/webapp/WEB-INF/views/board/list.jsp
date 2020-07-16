<!-- list.jsp ---------------->
<!-- 
1. 메인
1.1 목록 폼
1.2 글쓰기 페이지로 이동 -->
<!-- list.jsp -->

<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>게시글 목록</title>
</head>
<body>
<!-- header include ------------>
<%@include file="../common/header.jsp"%>
<!-- header include -->

<h1>${userid}</h1>

<!-- 1. 메인 ---------------->
<main class="container">
	<!-- 1.1 목록 폼 ------------------>
	<table id="dataTables-example">
		<thead>
			<tr>
				<th>번호</th>
				<th>제목</th>
				<th>작성자</th>
				<th>작성일</th>
                <th>수정일</th>
                <th>카테고리</th>
                <th>지역</th>
			</tr>
		</thead>
		<c:forEach items="${list}" var="board">
			<tr>
				<td><c:out value="${board.bno}" /></td>
				<td width="300">
					<a href='/board/get?bno=<c:out value="${board.bno}"/>'><c:out value="${board.title}"/></a>
				</td>
				<td><c:out value="${board.userid}" /></td>
				<td><fmt:formatDate pattern="yyyy-MM-dd" value="${board.regDate}" /></td>
               <td><fmt:formatDate pattern="yyyy-MM-dd" value="${board.updateDate}"/></td>
               <td><c:out value="${board.category}" /></td>
               <td><c:out value="${board.location}" /></td>
			</tr>
		</c:forEach>
	</table>
	<!-- 1.1 목록 폼 -->
	
	<!-- 1.2 글쓰기페이지로 이동 ------------->
	<form role="form" action="/board/register" method="get">
	<input type="hidden" name="userid" value="<c:out value='${userid}'/>">
	<button>글쓰기</button>
	</form>
	<!-- 1.2 글쓰기페이지로 이동 -->
</main>
<!-- 1. 메인 -->
</body>
</html>