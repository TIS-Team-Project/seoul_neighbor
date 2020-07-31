<!-- profile.jsp ---------------->
<!-- 
1. 메인
1.1 왼쪽 메뉴
1.2 프로필 레이아웃
1.3 프로필 이미지 업로드 부분
1.4 닉네임 수정 부분
1.5 주소 수정 부분
2. 자바스크립트 -->
<!-- profile.jsp -->

<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<!-- profile.css -->
<<<<<<< Updated upstream
<link rel="stylesheet" type="text/css" href="/resources/css/mypage/profile.css">
=======
<link rel="stylesheet" href="/resources/css/common/basic.css">
<link rel="stylesheet" href="/resources/css/mypage/profile-basic.css">
>>>>>>> Stashed changes
<title>프로필</title>
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
		<!-- 1.2 프로필 레이아웃 ---------------------------------->
<<<<<<< Updated upstream
			<div id="rightDiv" class="col-lg-9">
				<form class="form-group" method="post" action="updateUser" enctype="multipart/form-data">
=======
			<div id="rightDiv" class="col-lg-9 p-5">
				<form id="profileForm" class="form-group" method="post" action="updateUser">
				<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" />
>>>>>>> Stashed changes
				<h1>프로필</h1>
					<div id="rightDivContent" class="container">
					<!-- 1.3 프로필 이미지 업로드 부분 --------------------------------------------->
<<<<<<< Updated upstream
						<h3>프로필 이미지</h3>
						<div id="profileChangeImgBox" class="card">
							<c:choose>
								<c:when test = "${member.member_filename eq null }">
						  		<img class="card-img-top" src="/resources/img/mypage/profile_sample.png" alt="프로필 사진">
						  		</c:when>
								<c:when test = "${member.member_filename != null }">
						  		<img id="profileChangeImg" class="card-img-top" src="/resources/img/mypage/<c:out value="${member.member_filename}"/>" alt="프로필 이미지">
						  		</c:when>
						  	</c:choose>
						  
						  <div class="card-body filebox text-center">
						  	<label id="uploadBtn" for="uploadFile">업로드</label>
						    <input type="file" id="uploadFile" name="uploadFile" />
						    <input type="hidden" id="isFileChanged" name="isFileChanged" value="false" />
						  </div>
						  <div id="fileNameContainer">
						  	<input type="hidden" name="member_filename" value="${member.member_filename }">
						  </div>
					<!-- 1.3 프로필 이미지 업로드 부분 -->
						</div>
					<!-- 1.4 닉네임 수정 부분 ------------------------------------------->
						<h3><span style="color:red"> * </span>닉네임</h3>
						<div class="row">
							<div class="col-md-5">
								<input id="nickName" name="nickname" type="text" value="${member.nickname }" class="form-control">
							</div>
						</div>
					<!-- 1.4 닉네임 수정 부분 -->
					<!-- 1.5 주소 수정 부분 ------------------------------------------>
						<h3><span style="color:red"> * </span>지역</h3>
							<div class="row">
								<div class="col-md-5">
									<select id="selectGu" name="gu" class="form-control">
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
=======
				<div class="content-box">

							<!-- 1.3 프로필 이미지 업로드 부분 -->

							<!-- 1.4 닉네임 수정 부분 ------------------------------------------->
							<div class="content-box">
								<h3>
									닉네임<span style="color: red"> * </span>
								</h3>
								<div class="row">
									<div class="col-md-5">
										<input id="nickName" name="nickname" type="text"
											value="${member.nickname }" class="form-control">
									</div>
									<div class="col-md-5">
										<p id="nickName-duplicated-text" style="color:#e03131">*중복된 닉네임입니다. 다른 닉네임을 입력하세요</p>
										<p id="nickName-wrong-text" style="color:#e03131">*닉네임을 정확히 입력하세요.(2~10글자)</p>
									</div>
>>>>>>> Stashed changes
								</div>
								<div class="col-md-5">
									<select id="selectDong" name="dong" class="form-control"></select>
								</div>
								<div class="col-md-2">
									<input id="searchPost" type="button" class="btn form-control" value="주소 검색">
								</div>
								<div id="member_location"></div>
							</div>
						<!-- 1.5 주소 수정 부분 -->
						<h3>이메일</h3>
						<div class="row">
							<div class="col-md-5">
								<input id="email" class="form-control" type="email" value="${member.email}" readonly>
							</div>
						</div>
						<input type="hidden" name="userid" value="${member.userid }">
						<input id="saveChangeBtn" type="submit" class="btn" value="변경사항 저장">
					</div>

				</form>
			</div>
		<!-- 1.2 프로필 레이아웃 ---------------------------------->
		</div>
	</div>
	<!-- 1. 메인 -->
	
	<!-- 3. 프로필 사진 바꾸기 모달 ----------------------->
	<div class="modal" id="changePicture">
		<div class="modal-dialog modal-sm modal-dialog-centered">
			<div class="modal-content">
        <!-- Modal Header -->
				<div class="modal-header">
				<h4 id="pictureHeader" class="modal-title">프로필 이미지 바꾸기</h4>
				<button type="button" class="close" data-dismiss="modal">&times;</button>
				</div>
        <!-- Modal body -->
				<div class="modal-body">
						<div id="profileChangeImgBox" class="card">
						<form class="form-group" method="post" action="updateUser" enctype="multipart/form-data">
							<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" />
							<c:choose>
								<c:when test="${member.member_filename eq null }">
									<img id="profileChangeImg"
										class="card-img-top"
										src="/resources/img/mypage/profile_sample.png" alt="프로필 사진">
								</c:when>
								<c:when test="${member.member_filename != null }">
									<img id="profileChangeImg" class="card-img-top"
										src="/resources/img/mypage/<c:out value="${member.member_filename}"/>"
										alt="프로필 이미지">
								</c:when>
							</c:choose>
	
							<div class="card-body filebox text-center">
								<label id="uploadBtn" for="uploadFile">업로드</label> <input
									type="file" id="uploadFile" name="uploadFile" /> <input
									type="hidden" id="isFileChanged" name="isFileChanged"
									value="false" />
							</div>
							<div id="fileNameContainer">
								<input type="hidden" name="member_filename"
									value="${member.member_filename }">
							</div>
							<input type="hidden" name="userid" value="${member.userid }">
							<input type="hidden" name="nickname" value="${member.nickname }">
							<input type="hidden" name="email" value="${member.email }">
							<input type="hidden" name="member_location" value="${member.member_location }">
							<input type="submit" class="btn" value="프로필 저장" style="background-color:#827FFE; color:white">
						</form>
						</div>
				</div>
			</div>
		</div>
	</div>
<!-- 3. 프로필 사진 바꾸기 모달 -->
	
</body>
<!-- 2. javaScript ------------------------------>
<script src="https://t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<!-- 2. javaScirpt -->
</html>