<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="sec" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>서울이웃 :: 게시판 목록</title>
</head>
<body>
<!-- header include ------------>
<%@include file="../common/header.jsp"%>
<!-- header include -->

<!-- (미완)목록에서 spring security 인증받은 회원 id 노출시키기 - 닉네임 노출로 변경해야함 ------------------------------------------->
<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" />
	<sec:authorize access="isAuthenticated()">
		<h3><sec:authentication property="principal.username"/>님 로그인 완료</h3>
	</sec:authorize>
	<sec:authorize access="isAnonymous()">
		<h3>서울이웃에 방문해주셔서 감사합니다.</h3>
	</sec:authorize>
<!-- 목록에서 spring security 인증받은 회원 id 노출시키기  -->

</body>
</html>