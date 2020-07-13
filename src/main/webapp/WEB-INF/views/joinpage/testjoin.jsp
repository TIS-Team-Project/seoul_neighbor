<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
    <script src="https://kit.fontawesome.com/3f56318ab4.js" crossorigin="anonymous"></script>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.8.2/css/all.min.css"/>
    <script src="https://code.jquery.com/jquery-3.5.1.min.js"
        integrity="sha256-9/aliU8dGd2tb6OSsuzixeV4y/faTqgFtohetphbbj0=" crossorigin="anonymous"></script>

      <!-- 회원가입페이지 전용 css -->
<link rel="stylesheet" type="text/css" href="/resources/css/join/join.css">  
    
</head>

<body>
<!-- header include ------------>
	<%@include file="../common/header.jsp"%>
	<!-- header include -->
    <div class="wrapper">
        <form action="sign_in.jsp" method="POST" onsubmit="return verifyAll();">

            <div class="headimg">
                <a href="#"><img src="/coupang/coupang.png" alt=""></a>
            </div>
            
            <div class="input-container">
                <label for="email"><i class="far fa-envelope icon"></i></label>
                <input id="email" name="email" type="text" class="input-field" placeholder="아이디1(이메일)" onfocusout="verifyEmail()">
                <i id="emailv" class="fas fa-check check-icon"></i>
            </div>
            <p id="email-wrong-text" class="wrong-text-hide">이메일을 입력하세요</p>

            <div class="input-container">
                <label for="pw"><i class="fas fa-shield-alt icon"></i></label>
                <input id="pw" name="pw" type="password" class="input-field" placeholder="비밀번호(영문 숫자 특수문자 2가지 이상 6~15자 이내)"
                    onfocusout="verifyPW()">
                <i id="pwv" class="fas fa-check check-icon"></i>
            </div>
            <p id="pw-wrong-text" class="wrong-text-hide">비밀번호는 6~15자 이내로 입력하셔야 합니다.</p>

            <div class="input-container">
                <label for="pwcheck"><i class="fas fa-shield-alt icon"></i></label>
                <input id="pwcheck" type="password" class="input-field" placeholder="비밀번호 확인"
                    onfocusout="verifyPWcheck()">
                <i id="pwcv" class="fas fa-check check-icon"></i>
            </div>
            <p id="pwc-wrong-text" class="wrong-text-hide">비밀번호가 일치하지 않습니다.</p>

            <div class="input-container">
                <label for="name"><i class="far fa-user icon"></i></label>
                <input id="name" name="name" type="text" class="input-field" placeholder="이름" onfocusout="verifyName()">
                <i id="namev" class="fas fa-check check-icon"></i>
            </div>
            <p id="name-wrong-text" class="wrong-text-hide">이름을 정확히 입력하세요.</p>

            <div class="input-container">
                <label for="phone"><i class="fas fa-mobile-alt icon"></i></label>
                <input id="phone" name="phone" type="text" class="input-field" placeholder="휴대폰 번호" onfocusout="verifyPhone()">
                <i id="phonev" class="fas fa-check checkicon"></i>
            </div>
            <p id="phone-wrong-text" class="wrong-text-hide">휴대폰 번호를 정확하게 입력하세요.</p>

            <button type="submit" class="btn">동의하고 가입하기</button>
            <div class="instruction">
                본인은 <b>만 14세 이상</b>이며, <a href="#">쿠팡 이용약관</a>, <a href="#">전자금융거래이용약관</a>, <a href="#">개인정보 수집 및 이용</a>
                , <a href="#">개인정보 제공</a> 내용을 확인 하였으며, <b>동의합니다.</b>
            </div>
            <div class="copyright">
                ©Coupang Corp. All rights reserved.
            </div>
        </form>

    </div>
</body>

</html>