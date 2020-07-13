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
<title>Insert title here</title>


<!-- 회원가입페이지 전용 css -->
<link rel="stylesheet" type="text/css" href="/resources/css/join/join.css">

<!-- <script src="/resources/js/join.js"></script> -->

</head>
<body>
	<!-- header include ------------>
	<%@include file="../common/header.jsp"%>
	<!-- header include -->
	
	<!-- 회원가입  ----------------->
	<div class="wrapper">
        <form action="sign_in.jsp" method="POST" onsubmit="return verifyAll();">
			
            <div class="headimg">
                <img src="/resources/img/common/logo_1.png" alt="서울이웃 로고">
            </div>
            
            <!-- 아이디 입력칸 ------------>
            <div class="input-container">
                <label for="userId"><i class="far fa-envelope icon"></i></label>
                <input id="userId" name="userId" type="text" class="input-field" placeholder="아이디" onfocusout="verifyID()">
                <i id="emailv" class="fas fa-check checkicon"></i>
            </div>
            <p id="id-wrong-text" class="wrong-text-hide">아이디를 입력하세요</p>
			<!-- 아이디 입력칸 -->
			
			<!-- 닉네임 입력칸  ------------>
            <div class="input-container">
                <label for="nickName"><i class="far fa-user icon"></i></label>
                <input id="nickName" name="nickName" type="text" class="input-field" placeholder="닉네임" onfocusout="verifyName()">
                <i id="namev" class="fas fa-check checkicon"></i>
            </div>
            <p id="name-wrong-text" class="wrong-text-hide">닉네임을 입력하세요.</p>
			<!-- 닉네임 입력칸  -->
            
            <!-- 이메일 입력칸 ------------>
            <div class="input-container">
                <label for="email"><i class="far fa-envelope icon"></i></label>
                <input id="email" name="email" type="text" class="input-field" placeholder="이메일" onfocusout="verifyEmail()">
                <i id="emailv" class="fas fa-check checkicon"></i>
            </div>
            <p id="id-wrong-text" class="wrong-text-hide">이메일을 정확히 입력하세요</p>
			<!-- 이메일 입력칸 -->
			
			<!-- 비밀번호 입력칸 ---------->
            <div class="input-container">
                <label for="userPw"><i class="fas fa-shield-alt icon"></i></label>
                <input id="userPw" name="userPw" type="password" class="input-field" placeholder="비밀번호(영문 숫자 특수문자 중 2가지 이상 6~15자 이내)"
                    onfocusout="verifyPW()">
                <i id="pwv" class="fas fa-check checkicon"></i>
            </div>
            <p id="pw-wrong-text" class="wrong-text-hide">비밀번호는 6~15자 이내로 입력하셔야 합니다.</p>
			<!-- 비밀번호 입력칸 -->
			
			<!-- 비밀번호 확인칸 ---------->
            <div class="input-container">
                <label for="pwcheck"><i class="fas fa-shield-alt icon"></i></label>
                <input id="pwcheck" type="password" class="input-field" placeholder="비밀번호 확인"
                    onfocusout="verifyPWcheck()">
                <i id="pwcheckv" class="fas fa-check checkicon"></i>
            </div>
            <p id="pwc-wrong-text" class="wrong-text-hide">비밀번호가 일치하지 않습니다.</p>
			<!-- 비밀번호 확인칸 -->
			
			<!-- 지역 입력칸  ------------>
            <div class="input-container">
                <label for="memberLocation"><i class="far fa-user icon"></i></label>
                <input id="memberLocation" name="memberLocation" type="text" class="input-field" placeholder="지역" onfocusout="verifyName()">
                <i id="namev" class="fas fa-check checkicon"></i>
            </div>
            <p id="name-wrong-text" class="wrong-text-hide">지역을 정확히 입력하세요.</p>
			<!-- 지역 입력칸  -->
			

            <button type="submit" class="btn btn-primary">동의하고 가입하기</button>
            <div class="instruction">
                본인은 <a href="#">개인정보 수집 및 이용</a>
                , <a href="#">개인정보 제공</a> 내용을 확인 하였으며, <b>동의합니다.</b>
            </div>
            <div class="copyright">
                @JustDo Corp. All rights reserved.
            </div>
        </form>

    </div>
	<!-- 회원가입  -->
	

	
</body>
</html>