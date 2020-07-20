<!-- 
	*회원가입페이지*
	작성자 강민성
	
 -->

<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>서울이웃 회원가입1</title>

<!-- CSS style ------------------------------>
<!-- <link rel="stylesheet" href="/resources/css/common/index.css"> -->

<!-- 회원가입페이지 전용 css -->
<link rel="stylesheet" type="text/css" href="/resources/css/join/newjoin.css">

</head>
<body>
	<!-- 0. 상단 네비게이션 바 ------------>
	<%@include file="../common/header.jsp"%>
	<!-- 0. 상단 네비게이션 바 -->

	<!-- 1. 메인 페이지 전체 ------------------------------>	
	<div class="container" style="margin-top : 60px;">
		<div class="wrap-login">
			<!-- 1.1 로그인 폼 ------------------------------>
			<form class="container-form validate-form p-3" action="/login" method="post" role="form">
				<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" />
				<span class="login-form-title pt-3 pb-4">회원가입</span>
				<div class="login-body pb-3">
				
					
	            	
	            	<div class="input-group">
	            		<label for="userid">아이디</label>
	            		<div class="wrap-input validate-input mb-3">
							<input id="userid" class="input-text" type="text" name="userid" placeholder="아이디"> <span class="focus-on-input"></span>
						</div>
						<p id="userId-wrong-text" class="wrong-text">ID를 정확히 입력해 주세요.(5~20자의 영소문자, 숫자만 가능합니다.)</p>
	            		<p id="userId-duplicated-text" class="wrong-text">이미 사용중인 아이디 입니다. 다시 작성해주세요</p>
	            	</div>
	            	
	            	<div class="input-group">
	            		<label for="userid">닉네임</label>
	            		<div class="wrap-input validate-input mb-3">
							<input id="userid" class="input-text" type="text" name="userid" placeholder="아이디"> <span class="focus-on-input"></span>
						</div>
						<p id="userId-wrong-text" class="wrong-text">ID를 정확히 입력해 주세요.(5~20자의 영소문자, 숫자만 가능합니다.)</p>
	            		<p id="userId-duplicated-text" class="wrong-text">이미 사용중인 아이디 입니다. 다시 작성해주세요</p>
	            	</div>
	            	
	            	<div class="input-group">
	            		<label for="userid">비밀번호</label>
	            		<div class="wrap-input validate-input mb-3">
							<input id="userid" class="input-text" type="text" name="userid" placeholder="아이디"> <span class="focus-on-input"></span>
						</div>
						<p id="userId-wrong-text" class="wrong-text">ID를 정확히 입력해 주세요.(5~20자의 영소문자, 숫자만 가능합니다.)</p>
	            		<p id="userId-duplicated-text" class="wrong-text">이미 사용중인 아이디 입니다. 다시 작성해주세요</p>
	            	</div>
	            	
	            	<div class="input-group">
	            		<label for="userid">비밀번호 재확인</label>
	            		<div class="wrap-input validate-input mb-3">
							<input id="userid" class="input-text" type="text" name="userid" placeholder="아이디"> <span class="focus-on-input"></span>
						</div>
						<p id="userId-wrong-text" class="wrong-text">ID를 정확히 입력해 주세요.(5~20자의 영소문자, 숫자만 가능합니다.)</p>
	            		<p id="userId-duplicated-text" class="wrong-text">이미 사용중인 아이디 입니다. 다시 작성해주세요</p>
	            	</div>
	            	
	            	<div class="input-group">
	            		<label for="userid">이메일</label>
	            		<div class="wrap-input validate-input mb-3">
							<input id="userid" class="input-text" type="text" name="userid" placeholder="아이디"> <span class="focus-on-input"></span>
						</div>
						<p id="userId-wrong-text" class="wrong-text">ID를 정확히 입력해 주세요.(5~20자의 영소문자, 숫자만 가능합니다.)</p>
	            		<p id="userId-duplicated-text" class="wrong-text">이미 사용중인 아이디 입니다. 다시 작성해주세요</p>
	            	</div>
					
					<div class="input-group">
	            		<label for="userid">지역</label>
	            		<div class="wrap-input validate-input mb-3">
							<input id="userid" class="input-text" type="text" name="userid" placeholder="아이디"> <span class="focus-on-input"></span>
						</div>
						<p id="userId-wrong-text" class="wrong-text">ID를 정확히 입력해 주세요.(5~20자의 영소문자, 숫자만 가능합니다.)</p>
	            		<p id="userId-duplicated-text" class="wrong-text">이미 사용중인 아이디 입니다. 다시 작성해주세요</p>
	            	</div>
	            	
	            	
	            	
	            	
					
					<c:if test="${param.error}">
						<div class="error-message pb-3">
							<c:out value="${message}">가입하지 않은 아이디이거나, 잘못된 비밀번호입니다.</c:out>
						</div>
					</c:if>
					<div class="container-login-button pb-3">
						<button type="submit" class="button-colored login-button">로그인</button>
					</div>
					
				</div>
				
			</form>
			<!-- 1.1 로그인 폼 -->
			
			
		</div>
	</div>
	<!-- 1. 메인 페이지 -->	
	
	<!-- 2. javaScript ------------------------------>
	<%@include file="/resources/js/join/newjoin_js.jsp"%>
	<!-- 2. javaScirpt -->
</body>
</html>