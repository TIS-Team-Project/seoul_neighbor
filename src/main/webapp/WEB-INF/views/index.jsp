<!-- index.jsp ---------------->
<!-- 
1. Landing page
1.1 로그인 폼
1.2 비회원 입장
2. javaScript 
3. CSS
-->
<!-- index.jsp -->


<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<html>

<head>
<title>서울이웃 :: I SEOUL U</title>
</head>

<body>
	<!-- header include ------------>
	<%@include file="common/header.jsp"%>
	<!-- header include -->

	<!-- 1. Landing page ------------------------------>	
	<div class="container">
		<div class="wrap-login">
			<form class="login-form validate-form flex-sb flex-w p-3">
				<span class="login-form-title pt-3 pb-4"> Login </span>
				<!-- 1.1 로그인 폼 ------------------------------>	
				<div class="login-body pb-3">
					<div class="wrap-input validate-input mb-3" data-validate="아이디를 입력해주세요">
						<input class="input-text" type="text" name="username" placeholder="아이디"> 
						<span class="focus-on-input"></span>
					</div>
					<div class="wrap-input validate-input mb-3" data-validate="비밀번호를 입력해주세요">
						<input class="input-text" type="password" name="pass" placeholder="비밀번호">
						<span class="focus-on-input"></span>
					</div>
					<div class="container-login-button pb-3">
						<button class="login-button">Login</button>
					</div>
					<div class="row">
						<div class="col-md-6">
							<input class="input-checkbox" id="ckb1" type="checkbox" name="remember-me"> 
							<label class="label-checkbox" for="ckb1">로그인 상태 유지 </label>
						</div>
						<div class="col-md-6 text-right">
							<a href="#" class="forgot-text"> 비밀번호 찾기 </a>
						</div>
					</div>
				</div>
				<div class="text-center pt-4 pb-1">
					<p>아직 서울이웃의 회원이 아니신가요?</p>
					<a href="#" class="forgot-text">회원가입 하기</a>
				</div>
				<!-- 1.1 로그인 폼 -->	
				
				<!-- 1.2 비회원 입장 ------------------------------>
				<div class="text-center pt-4 pb-3">
					<p>비회원으로 입장하시겠어요?</p>
					<a href="#" class="forgot-text">서울이웃 체험하기</a>
				</div>
				<!-- 1.2 비회원 입장 -->
			</form>
		</div>
	</div>
</body>

<!-- 2. javaScript ------------------------------>
<%@include file="/resources/js/index_js.jsp"%>
<!-- 2. javaScirpt -->

<!-- 3. CSS ------------------------------>
<link rel="stylesheet" href="/resources/css/common/index.css">
<!-- 3. CSS -->
</html>