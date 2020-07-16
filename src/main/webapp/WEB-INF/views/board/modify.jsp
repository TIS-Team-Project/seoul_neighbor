<!-- modify.jsp ---------------->
<!-- 
1. 메인
1.1 수정 폼 -->
<!-- modify.jsp -->

<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>   
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>게시글 작성</title>
</head>
<body>
<!-- header include ------------>
<%@include file="../common/header.jsp"%>
<!-- header include -->
<!-- 1. 메인 ------------------------>
<main class="container">
	<div>
		<!-- 1.1 수정 폼 ------------------>
		<form role="form" action="/board/modify" method="Post">            
            <input type="hidden" id="bno" name="bno" value="<c:out value='${board.bno}'/>">            
            <input type="text" name="title" value="<c:out value='${board.title}'/>"><br>            
            <input type="text" name="userid" value="<c:out value='${board.userid}'/>" readonly><br>            
            <textarea name="content" id="content" cols="30" rows="10"><c:out value='${board.content}'/></textarea><br>
            <input type="hidden" name="category" value="<c:out value='${board.category}'/>">
			<input type="hidden" name="category" value="<c:out value='${board.location}'/>">
            
            <button>수정</button>            
            <button formmethod="get" formaction="/board/list">목록으로</button>
		</form>
		<!-- 1.1 수정 폼 -->
	</div>
</main>
<!-- 1. 메인 -->
</body>