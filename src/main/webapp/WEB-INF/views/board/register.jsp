<!-- register.jsp ---------------->
<!-- 
1. 메인
1.1 작성 폼
1.1.1 지도
2. javaScript -->
<!-- register.jsp -->

<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>   
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>게시글 작성</title>
<!-- customStyle ------------>
<link rel="stylesheet" type="text/css" href="/resources/css/common/map/style.css">
</head>
<body>
<!-- header include ------------>
<%@include file="../common/header.jsp"%>
<!-- header include -->
<!-- 1. 메인 ------------------------>
<main class="container">
	<div>
	<!-- 1.1 작성 폼 ------------------>
        <form role="form" action="/board/register" method="Post">
            <input type="text" name="title"><br>      
            <input type="text" name="userid" value="<c:out value='${userid}'/>" readonly><br>
            <textarea name="content" id="content" cols="30" rows="10"></textarea><br>
            <input type="hidden" name="category" value="소식">
			<input type="hidden" id="location" name="location">
			
			<!-- 1.1.1 지도 ------------------------>
			<div class="map_wrap">
			    <div id="map" style="width:350px;height:350px;position:relative;overflow:hidden;"></div>
			    <div class="hAddr">
			        <span id="centerAddr"></span>
			    </div>
			</div>
			<!-- 카카오 지도 앱키 -->
			<script src="//dapi.kakao.com/v2/maps/sdk.js?appkey=9a12736a6f1b3f9306ad9531ab47e6e4&libraries=services"></script>
			<!-- 1.1.1 지도 -->
            <button>작성</button>            
            <button formmethod="get" formaction="/board/list">목록으로</button>
        </form>
        <!-- 1.1 작성 폼 -->
    </div>
</main>
<!-- 1. 메인 -->
</body>
<!-- 2. javaScript ------------------------------>
<%@include file="/resources/js/map/map_js.jsp"%>
<!-- 2. javaScirpt -->
</html>