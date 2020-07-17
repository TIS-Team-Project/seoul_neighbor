<!-- modify.jsp ---------------->
<!-- 
1. 메인
1.1 지도
1.1.1 이름으로 지역선택
1.2 수정 폼
2. javaScript -->
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
<link rel="stylesheet" type="text/css" href="/resources/css/map/style.css">
</head>
<body>
<!-- header include ------------>
<%@include file="../common/header.jsp"%>
<!-- header include -->
<!-- 1. 메인 ------------------------>
	<main class="container">
		<div class="row">
			<div class="col-md-4">
				<!-- 1.1 지도 ------------------------>
				<h3>지역 선택</h3>
				<h3><span style="color:red"> * </span>지도</h3>
				<div class="map_wrap">
				    <div id="map" style="width:100%;height:300px;position:relative;overflow:hidden;"></div>
				</div>
				<!-- 카카오 지도 앱키 -->
				<script src="//dapi.kakao.com/v2/maps/sdk.js?appkey=9a12736a6f1b3f9306ad9531ab47e6e4&libraries=services"></script>
				<!-- 1.1 지도 -->
				<!-- 1.1.1 이름으로 지역선택 --------------->
				<h3><span style="color:red"> * </span>명칭</h3>
				<div class="form-row ">
					<select id="selectGu" name="gu" class="form-control col-md-6">
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
					<select id="selectDong" name="dong" class="form-control col-md-6">
					</select>
				</div>
				<!-- 1.1.1 이름으로 지역선택 -->				
			</div>
			<div class="col-md-8">
				<!-- 1.2 수정 폼 ------------------>
		        <form name="frm" role="form" action="/board/modify" method="Post">
		        	<h3>글쓰기</h3>
		        	<div class="dropdown">
					    <button class="btn btn-primary dropdown-toggle" type="button" id="selectcategory" data-toggle="dropdown"><c:out value='${board.category}'/>
					    <span class="caret"></span></button>
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
<%@include file="/resources/js/board/board_js.jsp"%>
<!-- 2. javaScirpt -->
</html>