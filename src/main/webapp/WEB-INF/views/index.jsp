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
			<form class="container-form validate-form p-3">
				<span class="login-form-title pt-3 pb-4"> Login </span>
				<!-- 1.1 로그인 폼 ------------------------------>
				<div class="login-body pb-3">
					<div class="wrap-input validate-input mb-3"
						data-validate="아이디를 입력해주세요">
						<input class="input-text" type="text" name="username"
							placeholder="아이디"> <span class="focus-on-input"></span>
					</div>
					<div class="wrap-input validate-input mb-3"
						data-validate="비밀번호를 입력해주세요">
						<input class="input-text" type="password" name="password"
							placeholder="비밀번호"> <span class="focus-on-input"></span>
					</div>
					<div class="container-login-button pb-3">
						<button class="button-colored login-button">로그인</button>
					</div>
					<div class="row">
						<div class="col-md-6">
							<input class="input-checkbox" id="remember-me-checkbox" type="checkbox" name="remember-me"> 
							<label class="label-checkbox" for="remember-me-checkbox">로그인 상태 유지 </label>
						</div>
						<div class="col-md-6 text-right">
							<a href="#" class="text-colored"> 비밀번호 찾기 </a>
						</div>
					</div>
				</div>
				<div class="add-border-top text-center pt-4 pb-1">
					<p>아직 서울이웃의 회원이 아니신가요?</p>
					<a href="#" class="text-colored">회원가입 하기</a>
				</div>
			</form>
			<!-- 1.1 로그인 폼 -->
			
			<!-- 1.2 비회원 입장 ------------------------------>
				<div class="text-center pr-3 pl-3 pb-3">
					<p class="mb-1">비회원으로 입장하시겠어요?</p>
					<div class="row">
						<div class="col-md-8 pr-0">
							<div class="form-row">
								<select id="selectGu" name="gu" class="form-control selectBox">
									<option selected>지역을 선택하세요</option>
									<option>강남구</option>
									<option>강동구</option>
									<option>강북구</option>
									<option>강서구</option>
									<option>관악구</option>
									<option>광진구</option>
									<option>구로구</option>
									<option>금천구</option>
									<option>노원구</option>
									<option>도봉구</option>
									<option>동대문구</option>
									<option>동작구</option>
									<option>마포구</option>
									<option>서대문구</option>
									<option>서초구</option>
									<option>성동구</option>
									<option>성북구</option>
									<option>송파구</option>
									<option>양천구</option>
									<option>영등포구</option>
									<option>용산구</option>
									<option>은평구</option>
									<option>종로구</option>
									<option>중구</option>
									<option>중랑구</option>
								</select>
							</div>
						</div>
						<div class="col-md-4">
							<div class="container-login-button">
								<button class="mini-button pass-button">입장</button>
							</div>
						</div>
					</div>
				</div>
				<!-- 1.2 비회원 입장 -->
		</div>
	</div>
	<!-- 1. Landing page -->	

</body>

<!-- 2. javaScript ------------------------------>
<%@include file="/resources/js/index_js.jsp"%>
<!-- 2. javaScirpt -->

<!-- 3. CSS ------------------------------>
<link rel="stylesheet" href="/resources/css/common/index.css">
<!-- 3. CSS -->
</html>