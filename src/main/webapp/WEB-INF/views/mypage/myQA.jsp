<!-- myQA.jsp ---------------->
<!-- 
1. 메인
1.1 왼쪽 메뉴
1.2 1:1 문의 레이아웃
2. 자바스크립트 -->
<!-- myQA.jsp -->

<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<title>1:1 문의</title>
<link rel="stylesheet" type="text/css" href="/resources/css/mypage/myQA.css">
</head>
<body>
	<!-- header include ------------>
	<%@include file="../common/header.jsp"%>
	<!-- header include -->
	<div style="position:fixed"><img src="/resources/img/mypage/left_background.png"></div>
	<!-- 1. 메인 ------------------------------------------------->
	<div class="container" style="margin-top:60px">
		<div class="row">
		<!-- 1.1 왼쪽 메뉴 ---------------------------->
			<div id="leftNav" class="col-lg-3 d-flex justify-content-center">
				<!-- header include ------------>
				<%@include file="leftNav.jsp"%>
				<!-- header include -->
			</div>
		<!-- 1.1 왼쪽 메뉴 -->
		<!-- 1.2 1:1 문의 레이아웃 ---------------------------------->
			<div id="rightDiv" class="col-lg-9">
				<h1>1:1 문의</h1>
				<div id="rightDivContent" class="container text-center">
					<h5>도움이 필요하신가요?</h5>
					<button type="button" id="QABtn" class="btn form-control" data-toggle="modal" data-dismiss="modal" data-target="#sendQA">1:1 문의 하기</button>
					<table class="table text-center table-hover">
						<thead class="thead">
							<tr>
								<th>처리 상태</th>
								<th>문의 사항</th>
								<th>문의 날짜</th>
							</tr>
						</thead>
						<tbody id="QAList">
							<c:forEach items="${QA}" var="QA">
							<tr>
								<td><c:choose><c:when test="${QA.q_check eq 'N' }">접수 중</c:when><c:when test="${QA.q_check eq 'Y' }">처리 완료</c:when></c:choose></td>
								<td class="QATitle" data-toggle="modal" data-dismiss="modal" data-target="#readQA">${QA.q_title}</td>
								<td>${QA.q_regdate}</td>
								<td style="display:none">${QA.q_content}</td>
							</tr>
							</c:forEach>
						</tbody>
					</table>
					<nav>
						<ul id="pageNumBtnList" class="pagination justify-content-center"></ul>
					</nav>
				</div>
			</div>
		<!-- 1.2 1:1 문의 레이아웃 -->
		</div>
	</div>
	<!-- 1. 메인 -->
	<!-- 2. 문의하기 모달창 -------------------------------------->
	<div class="modal" id="sendQA">
		<div class="modal-dialog modal-lg modal-dialog-centered">
			<div class="modal-content">
        <!-- Modal Header -->
				<div class="modal-header">
				<h4 class="modal-title">무엇을 도와드릴까요?</h4>
				<button type="button" class="close" data-dismiss="modal">&times;</button>
				</div>
        <!-- Modal body -->
				<div class="modal-body">
					<input id="writeQATitle" type="text" class="form-control" placeholder="문의 제목">
					<textarea id="writeQAContent" class="form-control" rows="10" placeholder="문의 내용(1000자 이내)"></textarea>
				</div>
				<div class="modal-footer">
					<span id="warn">(0/1000)글자</span><button type="button" id="insertQABtn" class="btn" data-toggle="modal" data-dismiss="modal" data-target="#sendMessage">문의하기</button>
				</div>
				<div id="messageInfo"></div>
			</div>
		</div>
	</div>
	<!-- 3. 문의내용 모달창 -->
		<!-- 2. 문의하기 모달창 -------------------------------------->
	<div class="modal" id="readQA">
		<div class="modal-dialog modal-lg modal-dialog-centered">
			<div class="modal-content">
        <!-- Modal Header -->
				<div class="modal-header">
				<h4 id="QAheader" class="modal-title"></h4>
				<button type="button" class="close" data-dismiss="modal">&times;</button>
				</div>
        <!-- Modal body -->
				<div class="modal-body">
					<h5 id="QAStatus">처리상태: </h5>
					<h4>문의 내용</h4>
					<p id="QAContent"></p>
				</div>
			</div>
		</div>
	</div>
	<!-- 3. 문의내용 모달창 -->
<!-- 4.자바스크립트------------------------>
<%@include file="/resources/js/mypage/myQA_js.jsp"%>
<!-- 4.자바스크립트 -->
</body>
</html>