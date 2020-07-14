<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<!-- header include ------------>
<%@include file="../common/header.jsp"%>
<!-- header include -->

<h1>${id}</h1>

	<!-- 리스트 ------------------>
	<table id="dataTables-example">
		<thead>
			<tr>
				<th>번호</th>
				<th>제목</th>
				<th>작성자</th>
				<th>작성자</th>
				<th>작성자</th>
			</tr>
		</thead>
		<c:forEach items="${list}" var="board">
			<tr>
				<td><c:out value="${board.bno}" /></td>
				<td width="300">
					<a href='/board/get?bno=<c:out value="${board.bno}"/>'><c:out value="${board.title}"/></a>
				</td>
				<td><c:out value="${board.userid}" /></td>
			</tr>
		</c:forEach>
	</table>
	<!-- 리스트 -->
	
<!-- 글쓰기페이지로 이동 ------------->
<button onclick="location.href='/board/register'">글쓰기</button>
<!-- 글쓰기페이지로 이동 -->
</body>
</html>