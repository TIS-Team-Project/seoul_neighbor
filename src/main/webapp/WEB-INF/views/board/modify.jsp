<!-- modify.jsp ---------------->
<!-- 
1. 메인
<<<<<<< Updated upstream
1.1 수정 폼 -->
=======
1.1 왼쪽 사이드
1.1.1 이름으로 지역선택
1.1.1.1 구선택
1.1.1.2 동선택
1.1.2 지도
1.2 수정 폼
1.2.1 카테고리 선택
1.3 취소버튼
2. javaScript -->
>>>>>>> Stashed changes
<!-- modify.jsp -->

<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>   
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>게시글 작성</title>
<!-- customStyle ------------>
<<<<<<< Updated upstream
<link rel="stylesheet" type="text/css" href="/resources/css/common/map/style.css">
=======
<link rel="stylesheet" href="/resources/css/mypage/profile-basic.css">
<link rel="stylesheet" href="/resources/css/mypage/profile-formpage.css">
<link rel="stylesheet" href="/resources/css/common/basic.css">
<link rel="stylesheet" href="/resources/css/map/style.css">
<link rel="stylesheet" href="/resources/css/board/register.css">
<link rel="stylesheet" href="/resources/css/board/style.css">
<!-- include summernote css -->
<link rel="stylesheet" type="text/css" href="/resources/css/summernote/summernote-lite.css">
>>>>>>> Stashed changes
</head>
<body>
<!-- header include ------------>
<%@include file="../common/header.jsp"%>
<!-- header include -->
<!-- 1. 메인 ------------------------>
	<main class="container">
		<div class="row">
<<<<<<< Updated upstream
			<div class="col-md-4">
				<!-- 1.1 지도 ------------------------>
				<h3>지역 선택</h3>
				<div class="map_wrap">
				    <div id="map" style="width:100%;height:300px;position:relative;overflow:hidden;"></div>
				</div>
				<!-- 카카오 지도 앱키 -->
				<script src="//dapi.kakao.com/v2/maps/sdk.js?appkey=9a12736a6f1b3f9306ad9531ab47e6e4&libraries=services"></script>
				<!-- 1.1 지도 -->
				<p>현재위치로</p>
				<p>이름으로 지역선택</p>
				
=======
			<div class="col-md-3">
				<!-- 1.1 왼쪽 사이드 ------------------->
				<div id="left_side">
					<!-- 1.1.1 이름으로 지역선택 --------------->
				<div id="name_choice">
					<!-- 1.1.1.1 구선택 ------------->
					<div class="dropdown">
					    <button class="btn btn-primary dropdown-toggle" type="button" id="selectGu" data-toggle="dropdown">구
					    <span class="caret"></span></button>
				    	<div id="gu" class="dropdown-menu" aria-labelledby="dropdownMenuButton">
							<a class="dropdown-item" href="#">강남구</a>
							<a class="dropdown-item" href="#">강동구</a>
							<a class="dropdown-item" href="#">강북구</a>
							<a class="dropdown-item" href="#">강서구</a>
							<a class="dropdown-item" href="#">관악구</a>
							<a class="dropdown-item" href="#">광진구</a>
							<a class="dropdown-item" href="#">구로구</a>
							<a class="dropdown-item" href="#">금천구</a>
							<a class="dropdown-item" href="#">노원구</a>
							<a class="dropdown-item" href="#">도봉구</a>
							<a class="dropdown-item" href="#">동대문구</a>
							<a class="dropdown-item" href="#">동작구</a>
							<a class="dropdown-item" href="#">마포구</a>
							<a class="dropdown-item" href="#">서대문구</a>
							<a class="dropdown-item" href="#">서초구</a>
							<a class="dropdown-item" href="#">성동구</a>
							<a class="dropdown-item" href="#">성북구</a>
							<a class="dropdown-item" href="#">송파구</a>
							<a class="dropdown-item" href="#">양천구</a>
							<a class="dropdown-item" href="#">영등포구</a>
							<a class="dropdown-item" href="#">용산구</a>
							<a class="dropdown-item" href="#">은평구</a>
							<a class="dropdown-item" href="#">종로구</a>
							<a class="dropdown-item" href="#">중구</a>
							<a class="dropdown-item" href="#">중랑구</a>
						</div>
					</div>
					<!-- 1.1.1.1 구선택 -->
					<!-- 1.1.1.2 동선택 ------------->
					<div class="dropdown">
					    <button class="btn btn-primary dropdown-toggle" type="button" id="selectDong" data-toggle="dropdown">동
					    	<span class="caret"></span>
					    </button>
				    	<div id="dong" class="dropdown-menu" aria-labelledby="dropdownMenuButton">
						</div>
					</div>
					<!-- 1.1.1.2 동선택 -->
				</div>
				<!-- 1.1.1 이름으로 지역선택 -->	
				<div>
					<p id="gu_notice" class="board_notice">다른 지역구에 작성하려면 구를 선택하세요!</p>
					<p id="dong_notice" class="board_notice">동을 직접 선택하거나 지도를 클릭해보세요!</p>
				</div>
				<!-- 1.1.2 지도 ------------------------>
				<div class="map_wrap">
				    <div id="map" style="width:100%;height:100%;position:relative;overflow:hidden;"></div>
				    <!-- 카카오 지도 앱키 -->
					<script src="//dapi.kakao.com/v2/maps/sdk.js?appkey=9a12736a6f1b3f9306ad9531ab47e6e4&libraries=services"></script>
				</div>				
				<!-- 1.1.2 지도 -->
				</div>
				<!-- 1.1 왼쪽 사이드 -->						
>>>>>>> Stashed changes
			</div>
			<div class="col-md-9">
				<!-- 1.2 수정 폼 ------------------>
		        <form name="frm" role="form" action="/board/modify" method="Post">
<<<<<<< Updated upstream
		        	<h3>글쓰기</h3>
		        	<div class="dropdown">
					    <button class="btn btn-primary dropdown-toggle" type="button" id="dropdownButton" data-toggle="dropdown"><c:out value='${board.category}'/>
					    <span class="caret"></span></button>
=======
            	<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" />
		        	<!-- 1.2.1 카테고리 선택 -------->
		        	<div class="dropdown" id="category_wrap">
					    <button class="btn btn-primary dropdown-toggle" type="button" id="selectcategory" data-toggle="dropdown"><c:out value='${board.category}'/>
					   		<span class="caret"></span>
					    </button>
>>>>>>> Stashed changes
					    <input type="hidden" id="category" name="category" value="<c:out value='${board.category}'/>">
					    <ul class="dropdown-menu" role="menu" aria-labelledby="menu1">
					      <li role="presentation"><a role="menuitem" tabindex="-1" href="#">소통해요</a></li>
					      <li role="presentation"><a role="menuitem" tabindex="-1" href="#">불만있어요</a></li>
					      <li role="presentation"><a role="menuitem" tabindex="-1" href="#">모여요</a></li>
					      <li role="presentation"><a role="menuitem" tabindex="-1" href="#">기타</a></li>
						</ul>
					</div>
					<input type="hidden" id="bno" name="bno" value="<c:out value='${board.bno}'/>">
		            <input type="text" name="title" value="<c:out value='${board.title}'/>" placeholder="제목"><br>      
		            <input type="hidden" name="userid" value="<c:out value='${board.userid}'/>">
		            <textarea name="content" id="content" cols="80" rows="10" style="width:100%; resize: none;"><c:out value='${board.content}'/></textarea><br>
					<input type="hidden" id="location" name="location" value="<c:out value='${board.location}'/>">
					
					<div align="right">
						<button type="submit" class="btn btn-primary" class=".btn" formmethod="get" formaction="/board/list">목록으로</button>
		            	<button type="submit" class="btn btn-primary" onclick="return boardCheck()">수정</button>  
					</div>          
		        </form>
	        	<!-- 1.2 수정 폼 -->
			</div>
		</div>
	</main>
<!-- 1. 메인 -->
</body>
<!-- 2. javaScript ------------------------------>
<%@include file="/resources/js/map/map_js.jsp"%>
<!-- 2. javaScirpt -->
</html>