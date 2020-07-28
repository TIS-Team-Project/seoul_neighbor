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
		<a class="navbar-brand logo" href="/">
			<img src="../resources/img/common/logoblack-borderw.png" width="140px" alt="logo">
		</a>
		<button class="navbar-toggler" type="button" data-toggle="collapse"
			data-target="#navbarSupportedContent"
			aria-controls="navbarSupportedContent" aria-expanded="false"
			aria-label="Toggle navigation">
			<span class="navbar-toggler-icon"></span>
		</button>
		<sec:authorize access="isAuthenticated()">
			<div class="weatherContent">
				<span id="guWeatherText">${weatherGu} </span>
				<c:choose>
					<c:when test="${weather eq '비' }">
					<i class="fas fa-cloud-rain"></i><span> 비 </span><span> ${temperature} °C</span>
					</c:when>
					<c:when test="${weather eq '비/눈' }">
					<i class="fas fa-cloud-meatball"></i><span> 비/눈 </span><span> ${temperature} °C</span>
					</c:when>
					<c:when test="${weather eq '눈' }">
					<i class="far fa-snowflake"></i><span> 눈 </span><span> ${temperature} °C</span>
					</c:when>
					<c:when test="${weather eq '소나기' }">
					<i class="fas fa-cloud-showers-heavy"></i><span> 소나기 </span><span> ${temperature} °C</span>
					</c:when>
					<c:when test="${weather eq '진눈개비' }">
					<i class="fas fa-wind"></i><span> 진눈개비 </span><span> ${temperature} °C</span>
					</c:when>
					<c:when test="${weather eq '맑음' }">
					<i class="fas fa-sun"></i><span> 맑음 </span><span> ${temperature} °C</span>
					</c:when>
					<c:when test="${weather eq '구름많음' }">
					<i class="fas fa-cloud-sun"></i></i><span> 구름많음 </span><span> ${temperature} °C</span>
					</c:when>
					<c:when test="${weather eq '흐림' }">
					<i class="fas fa-cloud"></i><span> 흐림 </span><span> ${temperature} °C</span>
					</c:when>
				</c:choose>
			</div>
		</sec:authorize>
		<div class="collapse navbar-collapse" id="navbarSupportedContent">
			<div class="mr-auto"></div>
			<ul class="navbar-nav my-2 my-lg-0">
				<li class="nav-item active">
				<!-- 로그인 하지 않은 상태에서 노출 ::: 상단바  -------------------------------------------------->
				<sec:authorize access="isAnonymous()">
					<li class="nav-item"><a class="nav-link" href="/subLogin">로그인</a></li>
				</sec:authorize>
				<!-- 로그인 하지 않은 상태에서 노출 ::: 상단바  -->
				
				<!-- 로그인 한 상태에서 노출 :: 상단바  -------------------------------------------------->
				<sec:authorize access="isAuthenticated()">
			      	<!-- 메시지 알림 창 -------------------------------------------------------------->

			      	<li class="nav-item">
			      	<div class="dropdown">
			      		<a id="showMiniMessageBtn" class="nav-link" data-toggle="dropdown"><i class="far fa-comments" style="font-size:1.4rem; line-height:51px"></i><span id="noReadCount" class="badge badge-light"></span></a>
						<div id="subMessageDiv" class="dropdown-menu">
							<a class="dropdown-item" href="#">Link 1</a>
							<a class="dropdown-item" href="#">Link 2</a>
							<a class="dropdown-item" href="#">Link 3</a>
						</div>
			      	</div>
			      	</li>
			      	<!-- 메시지 알림 창 -->				
					<li class="nav-item dropdown">
						<a class="nav-link dropdown-toggle" href="/profile"	id="nav-profile" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
							<c:choose>
								<c:when test="${member.member_filename eq null }">
									 <img src="../resources/img/mypage/profile_sample.png" width="35" height="35" class="rounded-circle" alt="프로필 사진">
								</c:when>
								<c:when test="${member.member_filename != null}">
									<img src="/resources/img/mypage/<c:out value="${member.member_filename}"/>" width="35" height="35" class="rounded-circle" alt="프로필 사진">
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
	
<!-- 2. 답장 모달창 -------------------------------------->
<div class="modal" id="sendMessage">
	<div class="modal-dialog modal-dialog-centered">
		<div class="modal-content">
       <!-- Modal Header -->
			<div class="modal-header">
			<h4 id="messageReplyHeader" class="modal-title">님에게 답장</h4>
			<button type="button" class="close" data-dismiss="modal">&times;</button>
			</div>
       
       <!-- Modal body -->
			<div class="modal-body">
			<textarea class="form-control" rows="5" id="messageReplyContent" placeholder="내용을 입력하세요 (100자 미만)"></textarea>
			</div>
       <!-- Modal footer -->
			<div class="modal-footer">
			<span id="warn">(0/100)글자</span><button type="button" id="messageReplySendBtn" class="btn btn-info" data-dismiss="modal">답장</button>
			</div>
		</div>
	</div>
</div>
<!-- 2. 답장 모달창 -->

<!-- 3. 쪽지 내용 모달창 -------------------------------------->
<div class="modal" id="readMessage">
	<div class="modal-dialog modal-dialog-centered">
		<div class="modal-content">
       <!-- Modal Header -->
			<div class="modal-header">
			<h4 id="messageShowHeader" class="modal-title">님의 쪽지</h4>
			<button type="button" class="close" data-dismiss="modal">&times;</button>
			</div>
       <!-- Modal body -->
			<div class="modal-body">
				<p id="readMessageContent"></p>
			</div>
			<div class="modal-footer" style="display:initial">
				<button type="button" id="deleteMessageBtn" class="btn btn-danger float-left" data-toggle="modal" data-dismiss="modal">삭제</button>
				<button type="button" id="replyMessageBtn" class="btn btn-primary float-right" data-toggle="modal" data-dismiss="modal" data-target="#sendMessage">답장</button>
			</div>
			<div id="messageInfo"></div>
		</div>
	</div>
</div>
<!-- 3. 쪽지내용 모달창 -->



<!-- 자바스크립트------------------------>
<%@include file="/resources/js/messageAlert_js.jsp"%>
<!-- 자바스크립트 -->
</body>
</html>