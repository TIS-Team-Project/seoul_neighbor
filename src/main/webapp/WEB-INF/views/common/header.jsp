<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="sec" %>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>헤더</title>
<!-- Latest compiled and minified CSS ------------>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.0/css/bootstrap.min.css">
<!-- jQuery library ------------>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<!-- Popper JS ------------>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
<!-- Latest compiled JavaScript ------------>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.0/js/bootstrap.min.js"></script>
<!-- customStyle ------------>
<link rel="stylesheet" type="text/css" href="/resources/css/common/style.css">
<!-- fontawesome -->
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.8.2/css/all.min.css"/>
</head>
<body>
	<!-- nav -------------------------------------------------------------------------------->
	<nav class="navbar navbar-expand-lg navbar-light bg-light">
		<a class="navbar-brand" href="/">
			<img src="../resources/img/common/logoblack-borderw.png" width="140px" alt="logo">
		</a>
		<button class="navbar-toggler" type="button" data-toggle="collapse"
			data-target="#navbarSupportedContent"
			aria-controls="navbarSupportedContent" aria-expanded="false"
			aria-label="Toggle navigation">
			<span class="navbar-toggler-icon"></span>
		</button>
		<div class="collapse navbar-collapse" id="navbarSupportedContent">
			<div class="mr-auto"></div>
			<ul class="navbar-nav my-2 my-lg-0">
				<li class="nav-item active">
					<a class="nav-link" href="/">Home</a></li>
				<!-- 로그인 하지 않은 상태에서 노출 ::: 상단바  -------------------------------------------------->
				<sec:authorize access="isAnonymous()">
					<li class="nav-item"><a class="nav-link" href="/subLogin">로그인</a></li>
				</sec:authorize>
				<!-- 로그인 하지 않은 상태에서 노출 ::: 상단바  -->
				
				<!-- 로그인 한 상태에서 노출 :: 상단바  -------------------------------------------------->
				<sec:authorize access="isAuthenticated()">
					<li class="nav-item dropdown">
						<a class="nav-link dropdown-toggle" href="/profile"	id="nav-profile" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
							<c:choose>
								<c:when test="${user.member_filename eq null }">
									 <img src="../resources/img/mypage/profile_sample.png" width="35" height="35" class="rounded-circle" alt="프로필 사진">
								</c:when>
								<c:when test="${user.member_filename != null}">
									<img src="/resources/img/mypage/<c:out value="${user.member_filename}"/>" width="35" height="35" class="rounded-circle" alt="프로필 사진">
								</c:when>
							</c:choose>
						</a>
						<div class="dropdown-menu dropdown-menu-right" aria-labelledby="nav-profile">
							<a class="dropdown-item" href="/profile">프로필</a>
							<a class="dropdown-item" href="/mylist">작성글 보기</a>
							<a class="dropdown-item" href="/myMessage">쪽지함</a>
							<a class="dropdown-item" href="/myQA">1:1 문의</a>
							<a class="dropdown-item" href="/myPassword">비밀번호 변경</a>
							<a class="dropdown-item" href="#" onclick="document.getElementById('logout-form').submit();">로그아웃</a>
							<form id="logout-form" action="<c:url value='/logout'/>" method="POST">
							   <input name="${_csrf.parameterName}" type="hidden" value="${_csrf.token}"/>
							</form>
						</div>
					</li>
				</sec:authorize>
				<!-- 로그인 한 상태에서 노출 :: 상단바  -->
			</ul>
		</div>
	</nav>
	<!-- nav -->
</body>
</html>
</body>
</html>