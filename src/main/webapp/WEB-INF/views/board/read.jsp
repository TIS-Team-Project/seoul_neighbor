<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<<<<<<< Updated upstream
=======
    
>>>>>>> Stashed changes
<!DOCTYPE html>
<html lang="en">

<head>
<<<<<<< Updated upstream
	<meta charset="UTF-8">
	
	<style>

	body {
	  font-family: "Lato", sans-serif;
	}
	
	.sidenav {
	margin-left : 30px;
	  width: 300px;
	  position: fixed;
	  top: 200px;
	  left: 20px;
	  overflow-x: hidden;
	  padding-top: 20px;
	}
	
	.sidenav a {
	  padding: 6px 6px 6px 32px;
	  text-decoration: none;
	  font-size: 25px;
	  color: #818181;
	  display: block;
	}
	
	.sidenav a:hover {
	  color: #f1f1f1;
	}
	
	.main {
	  margin-right: 300px;
	  margin-left: 300px; /* Same as the width of the sidenav */
	}
	
	@media screen and (max-height: 450px) {
	  .sidenav {padding-top: 15px;}
	  .sidenav a {font-size: 18px;}
	}
	.grid-container {
	  display: grid;
	  grid-template-columns: auto auto auto auto;
	  grid-gap: 10px;
	  padding: 10px;
	}
	
	.grid-container > div {
	  text-align: center;
	  padding: 20px 0;
	  font-size: 30px;
	}
	
	.item1 {
	  grid-column-end: span 3;
	}
	.padding20{
		padding: 20px;
	}
	.buttons{
		text-align: right;
		margin:20px;
	}
	
	/* temp */
	#selectGu{
		display:initial;
		width:auto;
	}
	
	#selectCategory{
		display:initial;
		width:auto;
	}
	
	#sideMenu{
		height:90vh;
		border-right:1px solid black;
		padding:2rem;
	}
	
	/* 게시글 상세 제목,아이디 부분  */
	#rightTop{
		border-top:1.5px solid black;
		border-bottom:1.5px solid black;
	}
	
	#rightContent{
		padding:5rem;
	}
	
	#boardTitle{
		padding:1rem;
	}
	
	#userDiv{
		width:3rem;
		display:inline-block;
		border:none;
	}
	
	/* 게시글 상세 내용 부분 */
	#boardContent{
		padding:1rem;
	}
	
	.likeCount{
		float:right;
		padding:1rem;
		cursor:pointer;
	}
	
	.unlikeCount{
		float:left;
		padding:1rem;
		cursor:pointer;
	}
	
	#commentInsertDiv{
		margin:10px;
	}
	
	</style>
	
	<title>상세 보기</title>
	    
=======
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>서울이웃</title>

<!-- CSS style ------------------------------>
<link rel="stylesheet" href="/resources/css/board/read.css">


>>>>>>> Stashed changes
</head>

<body>
	<!-- header include ------------>
	<%@include file="../common/header.jsp"%>
	<!-- header include -->
<<<<<<< Updated upstream
	
	<div class="container" style="margin-top:60px">
		<div class="row">
			<div id="sideMenu" class="col-lg-3">
					<!-------	side menu-------------------------->
					<div>
						<h5>빠른 게시판 이동</h5>
							<div>지역 >
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
							</div>
							<div>카테고리 >
							<select id="selectCategory" name="category" class="form-control">
								<option>놀아요</option>
								<option>운동해요</option>
								<option>메롱</option>
							</select>
							</div>
					</div>
					<div>
						<h5>우리 동네 인기글</h5>
					</div>
<%-- 			  		<em>지역-><a href="#">${board.location}</a></em>
			  		<em>카테고리-><a href="#">${board.category}</a></em> --%>
					<!-- side menu -->
			</div>
			<div id="rightContent" class="col-lg-9">
				<!-- 게시글 상세 제목,아이디 부분 -------------------->
				<div id="rightTop" class="row">
					<div id="boardTitle" class="col-lg-9">
						<h4>[${board.category}] ${board.title}</h4>
						<span>${board.updatedate} | 조회 ${board.view_count} | 추천 ${board.like_count} | 댓글 ${board.reply_count} </span>
					</div>
					<div class="col-lg-3" style="padding:1rem">
						<div id="userDiv" class="card text-center">
							<img class="card-img-top" src="/resources/img/mypage/profile_sample.png" alt="프로필 사진">
						</div>
						<span id="userId">${board.userid}</span>
					</div>
				</div>
				<!-- 게시글 상세 제목, 아이디 부분 -->
				
				<!-- 게시글 내용 부분 ------------------------------->
				<div id="boardContent" class="row">
					<p>${board.content}</p>
				</div>
				<!-- 게시글 내용 부분 -->
=======


    <div class="container" style="margin-top:30px">
        <div class="row">
        
        	<!-- 왼쪽 사이드메뉴 ---------------------------------------->
            <div class="col-sm-2 left-menu">
                <div id="speedMove">
                    <h5><b>빠른 게시판 이동</b></h5>
                    <div class="input-group mb-3">
                        <select id="selectGu" name="gu" class="form-control custom-select">
                            <option>지역선택</option>
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

                <h5><b>우리동네 인기글</b></h5>
                <ul>
				<c:forEach items="${hotList}" var="board" begin="0" end="5" step="1" varStatus="i">
				    <li class="nav-item">
                        <a class="nav-link" href='<c:out value="${board.bno}"/>?gu=${criteria.gu}'><c:out value="${board.title}"/></a>
                    </li>
				</c:forEach>
				</ul>
                <hr class="d-sm-none">
            </div>
            <!-- 왼쪽 사이드메뉴 -->

			<!-- 상세보기 본문 ------------------------------------------------------->
            <div class="col-sm-10">
                <div id="contentTitle">
                    <div id="writer" class="d-flex justify-content-between">
                        <div id="contentInfo">
                            <div>
                                <h2><c:out value="${board.title}"/></h2>
                            </div>
                            <div>
                                <span><c:out value="${board.regdate}"/></span>
                                <span>조회 <c:out value="${board.view_count}"/></span>
                                <span>추천 <c:out value="${board.like_count}"/></span>
                                <span>댓글 <c:out value="${board.reply_count}"/></span>
                                <span id="reportBoard">신고하기</span>
                            </div>

                        </div>
	
                        <div id="writerProfile">
                            <span> 
                            	<c:choose>
									<c:when test="${fileName eq null }">
										<img id="profileChangeImg"
											class="card-img-top"
											src="/resources/img/mypage/profile_sample.png" alt="프로필 사진">
									</c:when>
									<c:when test="${fileName != null }">
										<img id="profileChangeImg" class="card-img-top"
											src="/resources/img/mypage/<c:out value="${fileName}"/>"
											alt="프로필 이미지">
									</c:when>
								</c:choose>
							</span>
                            <span class="userNickname" data-toggle="dropdown">${board.nickname }</span>
                            <div class="dropdown-menu">
							<a class="dropdown-item sendMessageToUser">쪽지 보내기</a>
                        </div>
                    </div>

                </div>

                <div id="contentBody">
               		${board.content}
                </div>


                <div class="recomend_box d-flex justify-content-between">
                    <div>
                        <span class="likeCount"><c:out value="${board.like_count}"/></span>
                        <i class="likeButton likeIcon far fa-thumbs-up"></i>
                    </div>
                    <div>
                        <span class="unlikeCount"><c:out value="${board.unlike_count}"/></span>
                        <i class="unLikeButton likeIcon far fa-thumbs-down"></i>
                    </div>
                </div>
                
				<!-- 댓글창 ----------------------------------------------------->
                <div id="commentDiv">
                     
                    <!--댓글 목록--------------------------------------->
                    <div id="commentList">

                    </div>
                    <!--댓글목록-->

                    <!--댓글페이징------------------------>
                    <div id="replyPaging">

					</div>
                    <!--댓글페이징-->

                    <!--댓글 입력---------------------------------------->
                    <div id="commentWrite">
                        <div class="input-group mb-3">
                            <textarea id="replyInput" class="form-control" placeholder="남에게 상처주는 말을 하지 맙시다."></textarea>
                            <div class="input-group-append">
                              <button id="replyBtn" class="btn btn-outline-secondary">댓글등록하기</button>
                            </div>
                        </div>
                    </div>
                    <!--댓글입력-->

                </div>
                <!-- 댓글창 -->

                <!-- 버튼 모음 -------------------------------->
                <div class="btn-box d-flex">
                    <button class="btn btn-primary mr-auto m-1">목록으로</button>
                    <button class="btn btn-warning m-1">수정하기</button>
                    <button class="btn btn-warning m-1">삭제하기</button>
                    <button class="btn btn-primary m-1">글쓰기</button>
                </div>
                <!-- 버튼모음 -->

            </div>
            <!-- 상세보기 본문 -->
        </div>
    </div>
</div>

<!-- reply 모듈 -->
<!-- <script src="/resources/js/board/reply.js"></script> -->

<!-- read javascript -->
<%-- <%@include file="/resources/js/board/read_js.jsp"%> --%>
<%@include file="/resources/js/report_js.jsp"%>
<%@include file="/resources/js/board/userClick_js.jsp"%>

<script>

var csrfHeaderName = "${_csrf.headerName}";
var csrfTokenValue="${_csrf.token}";
//ajax요청시 마다 csrf 토큰 자동 적용
$(document).ajaxSend(function(e, xhr, options){
	xhr.setRequestHeader(csrfHeaderName, csrfTokenValue);
});

var replyService = (function(){

	
	// 빠른 게시판 이동 ////////////////////////////////
	$("#selectGu").change(function(){
		location.href = "/board/list?gu="+$(this).val();
	})
	// 빠른 게시판 이동 //
	
	// 신고하기 ////////////////////////////
	$("#reportBoard").on("click",function(){
		if('${member.userid}' == ""){
			alert("신고하려면 로그인 해주세요");
		}
		else{
			$('#reportUserModal').modal("show");
			$("#reportContent").val("");
			$("#reportUserHeader").text("글 제목: ${board.title} 신고하기");
			$("#reportInfo").empty();
			$("#reportInfo").append(
				"<input type='hidden' id='target' value='"+${board.bno}+"'>"+		
				"<input type='hidden' id='group' value='b'>"		
			);
		}
	})
	
	$(document).on("click",".reportReply",function(){
		if('${member.userid}' == ""){
			alert("신고하려면 로그인 해주세요");
		}
		else{
			$('#reportUserModal').modal("show");
			$("#reportContent").val("");
			$("#reportUserHeader").text("글 제목: ${board.title} 신고하기");
			$("#reportInfo").empty();
			$("#reportInfo").append(
				"<input type='hidden' id='target' value='"+${board.bno}+"'>"+		
				"<input type='hidden' id='group' value='b'>"		
			);
		}
	})
	// 신고하기 //
	

	
//댓글 등록
	function add(reply, callback, error) {
		console.log("reply......");
		
		$.ajax({
			type: "post",
			url : "/reply/new",
			data : JSON.stringify(reply),
			contentType : "application/json; charset=utf-8",
			success : function(result, status, xhr) {
				if(callback){
					callback(result);
				}
			},
			error : function(xhr, status, er) {
				if(error) {
					error(er);
				}
			}
		});
	}
	
	//대댓글 등록
	function reAdd(reply, callback, error) {
		console.log("reply......");
		
		$.ajax({
			type: "post",
			url : "/reply/newRe",
			data : JSON.stringify(reply),
			contentType : "application/json; charset=utf-8",
			success : function(result, status, xhr) {
				if(callback){
					callback(result);
				}
			},
			error : function(xhr, status, er) {
				if(error) {
					error(er);
				}
			}
		});
	}
	
	//댓글 목록 사져오기
	function getList(param, callback, error) {
		var bno = param.bno;
		var page = param.page || 1;
		
		$.getJSON("/reply/pages/" + bno + "/" + page + ".json",
				function(data) {
			if(callback){
				console.log(data);
				callback(data);
			}
		}).fail(function(xhr, status, err) {
			if(error){
				error();
			}
		});
	}
	
	//댓글 삭제
	function remove(data, callback, error) {
		
		var no = data.no;
		var type = data.type;
		
		console.log(no);
		console.log(type);
		
		$.ajax({
			type:"delete",
			url:"/reply/delete/" + no + "/" + type,
			dataType: "text",
			success : function(deleteResult, status, xhr) {
				if(callback) {
					callback(deleteResult);
				}
			},
			error : function(xhr, status, er) {
				if(error){
					error(er);
				}
			}
		});
	}
	
	//댓글 수정
	function update(reply, type, callback, error) {
		$.ajax({
			type : 'put',
			url : '/reply/update/' + reply.no +"/" + type,
			data : JSON.stringify(reply),
			contentType : "application/json; charset=utf-8",
			success : function(result, status, xhr) {
				if(callback) {
					callback(result);
				}
			},
			error : function(xhr, status, er) {
				if(error){
					error(er);
				}
			}
		});
	}
		
	return {
		add : add,
		reAdd : reAdd,
		getList : getList,
		remove : remove,
		update : update
	};
})();


	$(document).ready(function(){
		//좋아요 눌렀는지 확인 ////////////////////////////
		function likeCheck(){
	            var form = {
 	            		bno: '${board.bno}',
 	            		userid: '${member.userid}'
 	            }
 		  	      $.ajax({
 		  	    	 data: form,
 		 	         url: "/board/likeCheck", 
 		 	         type: "GET",
 		 	         success: function(result){
	 	        		 $(".fa-thumbs-up").addClass("likeButton");
		 	        	 $(".fa-thumbs-down").addClass("unLikeButton");
		 	        	 $(".fa-thumbs-down").removeClass("likeClicked");
		 	        	 $(".fa-thumbs-up").removeClass("likeClicked");
 		 	        	
 		 	        	 if(result=="L" || result =="U"){
 		 	        		 $(".fa-thumbs-up").removeClass("likeButton");
 		 	        		 $(".fa-thumbs-down").removeClass("unLikeButton");
 		 	        	 }
 		 	        	 if(result =="L"){
 		 	        		$(".fa-thumbs-up").addClass("likeClicked");
 		 	        	 }
 		 	        	 else if(result == "U"){
 		 	        		$(".fa-thumbs-down").addClass("likeClicked");
 		 	        	 }
 		 	         }
 		 	      });
		}
		
		likeCheck();
		//좋아요 눌렀는지 확인 //
		
		// 좋아요 싫어요 ////////////////////////////////////
	    $(document).on("click",".likeButton",function(){
	    	if('${member.userid}' == ""){
	    		alert("로그인 해주세요");
	    	}
	    	else{
	  	      $.ajax({
	 	         url: "/read/plusLike/${board.bno}", 
	 	         type: "GET",
	 	         dataType: "text",
	 	         success: function(result, status, xhr){
	 	            $(".likeCount").html(result);
	 	            var form = {
	 	            		bno: '${board.bno}',
	 	            		userid: '${member.userid}',
	 	            		type:'L'
	 	            }
	 		  	      $.ajax({
	 		  	    	 data: form,
	 		 	         url: "/board/insertLikeAjax", 
	 		 	         type: "POST",
	 		 			 beforeSend: function(xhr){
	 						xhr.setRequestHeader('${_csrf.headerName}', '${_csrf.token}')
	 					 },
	 		 	         success: function(result, status, xhr){
	 		 	        	likeCheck()
	 		 	         }
	 		 	      });
	 	         }
	 	      });
	    	}
	   });
	   
	   $(document).on("click",".unLikeButton",function(){
	    	if('${member.userid}' == ""){
	    		alert("로그인 해주세요");
	    	}
	    	else{
	  	      $.ajax({
	 	         url: "/read/plusUnlike/${board.bno}", 
	 	         type: "GET",
	 	         dataType: "text",
	 	         success: function(result, status, xhr){
		 	            $(".unlikeCount").html(result);
		 	            var form = {
		 	            		bno: '${board.bno}',
		 	            		userid: '${member.userid}',
		 	            		type:'U'
		 	            }
		 		  	      $.ajax({
		 		  	    	 data: form,
		 		 	         url: "/board/insertLikeAjax", 
		 		 	         type: "POST",
		 		 			 beforeSend: function(xhr){
		 						xhr.setRequestHeader('${_csrf.headerName}', '${_csrf.token}')
		 					 },
		 		 	         success: function(result, status, xhr){
		 		 	        	likeCheck()
		 		 	         }
		 		 	      });
		 	         }
	 	      });	
	    	}

	   });
		// 좋아요 싫어요 //
		
		// 좋아요 싫어요 취소 ///////////////////////////
		$(document).on("click",".likeClicked",function(){
			if($(this)[0].dataset.icon == "thumbs-up"){
 	            var form = {
 	            		bno: '${board.bno}',
 	            		userid: '${member.userid}',
 	            		type:'L'
 	            }
 		  	      $.ajax({
 		  	    	 data: form,
 		 	         url: "/board/cancelLike", 
 		 	         type: "POST",
 		 			 beforeSend: function(xhr){
 						xhr.setRequestHeader('${_csrf.headerName}', '${_csrf.token}')
 					 },
 		 	         success: function(result, status, xhr){
 		 	        	likeCheck()
 		 	        	$(".likeCount").html(parseInt($(".likeCount").text()) -1)
 		 	         }
 		 	      });
			}
			else if($(this)[0].dataset.icon == "thumbs-down"){
 	            var form = {
 	            		bno: '${board.bno}',
 	            		userid: '${member.userid}',
 	            		type:'U'
 	            }
 		  	      $.ajax({
 		  	    	 data: form,
 		 	         url: "/board/cancelLike", 
 		 	         type: "POST",
 		 			 beforeSend: function(xhr){
 						xhr.setRequestHeader('${_csrf.headerName}', '${_csrf.token}')
 					 },
 		 	         success: function(result, status, xhr){
 		 	        	likeCheck()
 		 	        	$(".unlikeCount").html(parseInt($(".unlikeCount").text()) -1)
 		 	         }
 		 	      });
			}
		})
		// 좋아요 싫어요 취소 //
	
		var bnoValue = <c:out value="${board.bno}"/>;
		var replyList = $("#commentList");
		
		//댓글 기능은 기본적으로 로그인한 유저만 작성이 가능하므로 로그인된 정보 중 닉네임을 replyer로 기본 설정
		var replyer = null;
		<sec:authorize access="isAuthenticated()">
			replyer = '${member.nickname}'
		</sec:authorize>
			
		//대댓글 입력칸 토글 변수, true : 생성이 안됬으니 생성해라, false : 생성되었으니 없애라
		var reReplyToggle = true;
		
		showList(1);
		
		//댓글목록 불러오기 함수
		function showList(page) {
			
			console.log("show list " + page);
			
			var dataObj = {
				bno : bnoValue, 
				page : page || 1,
			}
			
			console.log(dataObj);
			
			replyService.getList(dataObj, 
			function(result) {
				
				console.log("replyCnt " + result.replyCount);
				console.log("replyList " + result.replyList);
				console.log("reReplyList : " +result.reReplyList);
				
				if(page == -1) {
					pageNum = Math.ceil(result.replyCount/10.0);
					showList(pageNum);
					return;
				}
				
				
				var str = "";	
				
				
				if(result.replyList == null || result.replyList.length == 0) {
					replyList.html("");
					return;
				}
				replyList.html("");
				//먼저 댓글들을 생성해주고
				for(var i = 0, len = result.replyList.length || 0; i<len; i++) {
					str += '<div class="reply-container container">';
					str += '	<div class="d-flex row">';
					str += '		<div class="col-md-12">';
					str += '			<div class="d-flex flex-column comment-section">';
					str += '				<div class="bg-white p-2">';
					str += '					<div class="d-flex flex-row user-info">';
					str += '						<img class="rounded-circle" src="/resources/img/mypage/'+result.replyList[i].member_filename+'" width="40" height="40">';
					str += '						<div class="d-flex flex-column justify-content-start ml-2">';
					str += '							<span class="d-block font-weight-bold name">'+result.replyList[i].replyer+'</span>';
					str += '							<span class="date text-black-50">'+result.replyList[i].replyDate+'</span>';
					str += '						</div>';
					str += '						<div class="reply-content mt-2">';
					str += '							<p class="comment-text">'+result.replyList[i].reply+'</p>';
					str += '						</div>';
					str += '						<div class="re-reply ml-auto mt-2" data-rno="'+result.replyList[i].rno+'" data-type="0">';
					str += '							<sec:authorize access="isAuthenticated()">';
					str += '								<span class="re-reply-create">댓글달기</span>';
					if(replyer == result.replyList[i].replyer) {
						str += '									<span class="reply-update">수정</span>';
						str += '									<span class="reply-delete">삭제</span>';
					} else {
						str += '								<span class="reply-report">신고하기</span>';
					}
					str += '							</sec:authorize>';
					str += '						</div>';
					str += '					</div>';
					str += '				</div>';
					str += '				<div id="re-reply'+result.replyList[i].rno+'">';			
					str += '				</div>';			
					str += '				<div id="point'+result.replyList[i].rno+'">';		
					str += '				</div>';		
					str += '			</div>';
					str += '		</div>';
					str += '	</div>';
					str += '</div>';
				}
				
				replyList.html(str);
				//대댓글을 만들어줍니다.
				for(var i = 0, len = result.reReplyList.length || 0; i<len; i++) {
					var re_str = "";
					re_str += '<div class="reply-container container">';
					re_str += '	<div class="d-flex row">';
					re_str += '		<div class="col-md-12">';
					re_str += '			<div class="d-flex flex-column comment-section">';
					re_str += '				<div class="bg-white p-2">';
					re_str += '					<div class="d-flex flex-row user-info">';
					re_str += '						<img src="/resources/img/board/replyArrow.png" width="30" height="30">';
					re_str += '						<img class="rounded-circle" src="/resources/img/mypage/'+result.reReplyList[i].member_filename+'" width="40" height="40">';
					re_str += '						<div class="d-flex flex-column justify-content-start ml-2">';
					re_str += '							<span class="d-block font-weight-bold name">'+result.reReplyList[i].r_replyer+'</span>';
					re_str += '							<span class="date text-black-50">'+result.reReplyList[i].r_replyDate+'</span>';
					re_str += '						</div>';
					re_str += '						<div class="reply-content mt-2">';
					re_str += '							<p class="comment-text">'+result.reReplyList[i].r_reply+'</p>';
					re_str += '						</div>';
					re_str += '						<div class="re-reply ml-auto mt-2" data-rno="'+result.reReplyList[i].r_rno+'" data-type="1">';
					re_str += '							<sec:authorize access="isAuthenticated()">';
					if(replyer == result.reReplyList[i].r_replyer) {
						re_str += '									<span class="reply-update">수정</span>';
						re_str += '									<span class="reply-delete">삭제</span>';
					} else {
						re_str += '								<span class="reply-report">신고하기</span>';
					}
					re_str += '							</sec:authorize>';
					re_str += '						</div>';
					re_str += '					</div>';
					re_str += '				</div>';					
					re_str += '			</div>';
					re_str += '		</div>';
					re_str += '	</div>';
					re_str += '</div>';
					
					$("#re-reply" + result.reReplyList[i].rno).append(re_str);
				}
>>>>>>> Stashed changes
				
				<!-- 좋아요, 싫어요 부분 ------------------------------>
				<div id="boardLikeUnlike" class="row text-center">
					<div style="width:50%">
						<span class="likeCount">${board.like_count} <i id="likeButton" class="fas fa-thumbs-up"></i> 좋아요</span>
					</div>
					<div style="width:50%">
						<span class="unlikeCount">${board.unlike_count} <i id="unlikeButton" class="fas fa-thumbs-down"></i> 별로에요</span>
					</div>
				</div>
				<!-- 좋아요, 싫어요 부분 -->
				
<<<<<<< Updated upstream
				<!-- 댓글 창 부분 ----------------------------------->
				<div id="commentDiv	" class="row">
					
				</div>
				<!-- 댓글 창 부분 -->
				
				<!-- 댓글 입력 창 ----------------------------------->
				<div id="commentInsertDiv" class="row">
					<input type="text" class="form-control" placeholder="댓글을 입력하세요" style="width:80%"><input type="button" class="form-control" value="등록" style="width:20%">
				</div>
				<!-- 댓글 입력 창 -->
				
				<!-- 다른 페이지 이동 버튼 --------------------------->
				<div id="crudDiv" class="row" style="display:block">
						<button type="button" class="btn btn-primary">목록</button>
						<button type="button" class="btn btn-primary float-right">글쓰기</button>
						<button type="button" class="btn btn-primary float-right">삭제</button>
						<button type="button" class="btn btn-primary float-right">수정</button>

		
				</div>
				<!-- 다른 페이지 이동 버튼 -->
			</div>

		</div>
	</div>
	
	
	
	
	
<%-- 	<div class="container" style="margin-top:600px">

	
  <div class="main">

	<header>
		<!--   [category], title, userId, updateDate, viewCount, likeCount, unlikeCount, replyCount--------------------------------------->	
		<hr />
		<div class="grid-container">
			<div class="item1">
				<div>
					<span >
						카테고리 : [${board.category}]
					</span> 
					<span >
						제목 : ${board.title}
					</span>	
				</div>
				
				<div>
					<span >
						${board.updatedate} |
					</span>
					<span>
								조회 ${board.view_count} |
					</span>
					<span>
						<i class="fas fa-thumbs-up"> 좋아요  <p class="likeCount">${board.like_count}</p></i> |
					</span>					
					<span >
						<i class="fas fa-thumbs-down"> 싫어요  <p class="unlikeCount">${board.unlike_count}</p></i> |
					</span>
					<span >
						<i class="far fa-comment-dots"> 댓글  ${board.reply_count}</i>
					</span>
				</div>
			</div>
			<div class="item=2">
				<span>
					<em>ID : ${board.userid}</em>
				</span>	
			</div>
		</div>
		
		<br>
		<br>
		<hr />
	</header>
	<!--   [category], title, userId, updateDate, viewCount, likeCount, unlikeCount, replyCount--------------------------------------->	
	
	<!-- content ------------------------------------------------>
	<div class="padding20">
		<h1>${board.content}</h1>
		<br />
		<br />
		<br />
		<br />
		<br />
		<hr />
	</div>
	<!-- content -->
			
	
	<br />
<!-- 	좋아요, 싫어요------------------------------------------------- -->
	<div style="text-align: center;">
	

								
		<button class="btn btn-primary" id="likeButton">
			<i class="fas fa-thumbs-up"> 
				좋아요  <p class="likeCount">${board.like_count}</p>
			</i>
		</button>
		
		<button class="btn btn-danger" id="unlikeButton">
			<i class="fas fa-thumbs-down"> 
				싫어요  <p class="unlikeCount">${board.unlike_count}</p>
			</i>
		</button>

		<br />
		<br />
		<hr />
	</div>
	<!-- 	좋아요, 싫어요-- -->
	
	
	<br />
	<br />
	<br />
	
	
	<!--댓글  -------------------------------------------------->
	<div class="padding20">
		댓글들이 쭈욱~~~
	</div>
	<br />
	<hr />
	<!--댓글  -->
	<!--댓글달기 ------------------------------------------------------- -->
	<div class="padding20"> 
		<em>
			댓글 input
		</em>
		<div style="text-align: right;">
			<button type="button" class="btn btn-primary" data-dismiss="modal" >
							<i class="far fa-comment-dots"> 댓글</i>
		    </button>
		</div>	
	</div>

	
	<br />
	<hr />
	<!--댓글달기  -->
	
	<!--목록, 삭제, 수정, 글쓰기 버튼  --------------------------------------------->
	<div class="buttons">
		<button type="button" class="btn btn-primary" data-dismiss="modal">
	    	 목록
	    </button>
		<button type="button" class="btn btn-danger" data-dismiss="modal">
	    	 삭제
	    </button>
		<button type="button" class="btn btn-primary" data-dismiss="modal">
	    	 수정
	    </button>
		<button type="button" class="btn btn-primary" data-dismiss="modal">
	    	 글쓰기
	    </button>
	</div>
	
	<!--목록, 삭제, 수정, 글쓰기 버튼  -->
	</div>
	</div> --%>
<script>
   $(document).ready(function(){
	   $(document).on("click","#likeButton",function(){
    	  let bno=${board.bno}
         $.ajax({
            url: "/read/plusLike/" + bno, 
            type: "GET",
            dataType: "text",
            success: function(result, status, xhr){
               console.log(result);
               
               $(".likeCount").html(result+" <i id='likeButton' class='fas fa-thumbs-up'></i> 좋아요</span>");
            }
         });
      });

      $(document).on("click","#unlikeButton",function(){
    	  let bno=${board.bno}
         $.ajax({
            url: "/read/plusUnlike/" + bno, 
            type: "GET",
            dataType: "text",
            success: function(result, status, xhr){
               console.log(result);
               
               $(".unlikeCount").html(result+" <i id='unlikeButton' class='fas fa-thumbs-down'></i> 별로에요</span>");
            }
         });
      });
   })		   
</script>

</body> 
=======
				showReplyPage(result.replyCount);
			});
		}
		
		var pageNum = 1;
		var replyPaging = $("#replyPaging");
		
		//페이징 부분 만드는 함수
		function showReplyPage(replyCnt) {
			if(replyCnt == 0) {
				replyPaging.html("");
				return;
			}
			var endNum = Math.ceil(pageNum / 10.0) * 10;
			var startNum = endNum - 9;
			
			var prev = startNum != 1;
			var next = false;
			
			if(endNum * 10 >= replyCnt) {
				endNum = Math.ceil(replyCnt/10.0);
			}
			
			if(endNum * 10 < replyCnt) {
				next = true;
			}
			
			var str = '<ul class="pagination justify-content-center mb-3">';
			
			if(prev) {
				str += '<li class="page-item"><a class="page-link" href="'+(startNum - 1)+'">Previous</a></li>';
			}
			
			for(var i = startNum; i<=endNum; i++) {
				var active = pageNum == i? "active" : "";
				str += '<li class="page-item '+active+'"><a class="page-link" href="'+i+'">'+i+'</a></li>';
			}
			
			if(next) {
				str += '<li class="page-item"><a class="page-link" href="'+(endNum + 1)+'">Next</a></li>';
			}
			
			str += '</ul>';
			
			replyPaging.html(str);
		}
		
		//등록버튼을 눌렀을 시 (댓글 입력)
		$("#replyBtn").on("click", function(e){
			var reply = {
					reply : $("#replyInput").val(),
					replyer : replyer,
					bno : bnoValue
			};
			
			replyService.add(reply, function(result){
				$("#replyInput").val("");
				showList(-1);
			});
		});
		
		//등록버튼을 눌렀을 시 (대댓글 입력)
		replyList.on("click", ".re-reply-submit", function(e){
			var rno = $(this).data("what");
			
			var re_reply = {
				rno : rno,
				r_reply : $("#re-replyInput"+rno).val(),
				r_replyer : replyer
			};
			
			var rno = $(this).closest("div").data("rno");
			var point = $("#point"+rno);
			
			replyService.reAdd(re_reply, function(result){
				console.log("result");
				showList(pageNum);
				point.html("");
				reReplyToggle = true;
			});
		});
		
		//페이징 링크 눌렀을 시
		replyPaging.on("click", "ul li a", function(e){
			e.preventDefault();
			console.log("page click");
			
			var targetPageNum = $(this).attr("href");
			
			console.log("targetPageNum : " + targetPageNum);
			pageNum = targetPageNum;
			showList(pageNum);
		});
		//댓글달기 누를시 대댓글 입력 창 생성
		replyList.on("click", ".re-reply-create", function(e){
			var rno = $(this).closest("div").data("rno");
			//var point = $(".re-reply-box");
			var point = $("#point"+rno);
			console.log(rno);
			
			var str = "";
			str += '<div id="re-commentWrite">';
			str += '	<div class="input-group mb-3">';
			str += '		<textarea id="re-replyInput'+rno+'" class="form-control" placeholder="남에게 상처주는 말을 하지 맙시다."></textarea>';
			str += '		<div class="input-group-append">';
			str += '			<button id="re-replyBtn'+rno+'" class="re-reply-submit btn btn-outline-secondary" data-what="'+rno+'">댓글등록하기</button>';
			str += '		</div>';
			str += '	</div>';
			str += '</div>';
			
			if(reReplyToggle){
				point.html(str);
				reReplyToggle = false;
			} else {
				point.html("");
				reReplyToggle = true;
			}
			
		});
		
		//삭제
		replyList.on("click", ".reply-delete", function(e){
			
			//data.type이 0이면 댓글, 1이면 대댓글
			var data = {
					no : $(this).closest("div").data("rno"),
					type : $(this).closest("div").data("type")
			};
			console.log(data);
			
			//삭제하는 녀석이 type = 0 (댓글) 이고 댓글에 대댓글이 달려있을때
			if(data.type == 0 && $("#re-reply"+data.no).children().length != 0){
				replyService.remove(data, function(deleteResult){
					alert(deleteResult);
					showList(pageNum);
				});
			}
			
			replyService.remove(data, function(deleteResult){
				alert(deleteResult);
				showList(pageNum);
				console.log("댓글 목록 갱신");
			});
		});
		
		//수정
		replyList.on("click", ".reply-update", function(e){
			var rno = $(this).closest("div").data("rno");
			var point = $(this).closest(".bg-white");
			
			var type = $(this).closest("div").data("type");
			
			var temp = $(this).parent().prev().children("p").text();
			
			console.log(temp);
			var str = "";
			str += '<div id="re-commentWrite">';
			str += '	<div class="input-group mb-3">';
			str += '		<textarea id="updateInput'+rno+'" class="form-control">'+temp+'</textarea>';
			str += '		<div class="input-group-append">';
			str += '			<button id="updateBtn'+rno+'" class="update-submit btn btn-outline-secondary" data-type="'+type+'" data-what="'+rno+'">댓글등록하기</button>';
			str += '		</div>';
			str += '	</div>';
			str += '</div>';
			point.html(str);
		});
		
		replyList.on("click", ".update-submit", function(e){
			e.preventDefault();
			var rno = $(this).data("what");
			var type = $(this).data("type");
			
			var point = $("#point"+rno);
			
			//보낼 데이터
			var data = {
					no : rno,
					reply : $("#updateInput"+rno).val()
			};
			replyService.update(data, type, function(result){
				alert(result);
				showList(pageNum);
				point.html("");
				reReplyToggle = true;
			});
		});		
		
	});
</script>
>>>>>>> Stashed changes

</body>

</html>