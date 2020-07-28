<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
 <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>서울이웃</title>

<!-- CSS style ------------------------------>
<link rel="stylesheet" href="/resources/css/board/read.css">

</head>

<body>
	<!-- header include ------------>
	<%@include file="../common/header.jsp"%>
	<!-- header include -->


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
                    <div class="input-group mb-3">
                        <select id="selectCategory" name="category" class="form-control custom-select">
                            <option>카테고리</option>
                            <option>놀아요</option>
                            <option>운동해요</option>
                            <option>메롱</option>
                        </select>
                    </div>
                </div>

                <h5><b>우리동네 인기글</b></h5>
                <ul class="nav nav-pills flex-column">
                    <li class="nav-item">
                        <a class="nav-link" href="#">[소통해요]우리집 개가 사라졌어요</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="#">[소통해요]트레이너 참교육 썰.ssul</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="#">[소통해요]추천좀</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="#">[소통해요]추천댓글필수</a>
                    </li>
                </ul>
                <hr class="d-sm-none">
            </div>
            <!-- 왼쪽 사이드메뉴 -->

			<!-- 상세보기 본문 ------------------------------------------------------->
            <div class="col-sm-10">
                <div id="contentTitle">
                    <div id="writer" class="d-flex justify-content-between">
                        <div id="contentInfo">
                            <div id>
                                <h2><c:out value="${board.title}"/></h2>
                            </div>
                            <div>
                                <span><c:out value="${board.regdate}"/></span>
                                <span>조회 <c:out value="${board.view_count}"/></span>
                                <span>추천 <c:out value="${board.like_count}"/></span>
                                <span>댓글 <c:out value="${board.reply_count}"/></span>
                                <span>신고하기</span>
                            </div>

                        </div>

                        <div id="writerProfile">
                            <span> 
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
							</span>
                            <span>${board.userid }</span>
                        </div>
                    </div>

                </div>

                <div id="contentBody">
               		${board.content}
                </div>


                <div class="recomend_box d-flex justify-content-between">
                    <div>
                        <span class="likeCount"><c:out value="${board.like_count}"/></span>
                        <i class="likeIcon far fa-thumbs-up"></i>
                    </div>
                    <div>
                        <span class="unlikeCount"><c:out value="${board.unlike_count}"/></span>
                        <i class="likeIcon far fa-thumbs-down"></i>
                    </div>
                </div>

                <!-- 댓글창 ----------------------------------------------------->
                <div id="commentDiv">
                     
                    <!--댓글 목록--------------------------------------->
                    <div id="commentList">

                        <div class="reply-container container">
                            <div class="d-flex row">
                                <div class="col-md-12">
                                    <div class="d-flex flex-column comment-section" id="myGroup">
                                        <div class="bg-white p-2">
                                            <div class="d-flex flex-row user-info">
                                                <img class="rounded-circle" src="https://i.imgur.com/RpzrMR2.jpg" width="40" height="40">
                                                <div class="d-flex flex-column justify-content-start ml-2">
                                                    <span class="d-block font-weight-bold name">Marry Andrews</span>
                                                    <span class="date text-black-50">Shared publicly - Jan 2020</span>
                                                </div>
                                                <div class="reply-content mt-2">
                                                    <p class="comment-text">
                                                        Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat.
                                                    </p>
                                                </div>
                                                <div class="re-reply ml-auto mt-2">
                                                    <span>댓글달기</span>
                                                    <span>신고하기</span>
                                                </div>
                                            </div>    
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                        
                       <div class="reply-container container">
                            <div class="d-flex row">
                                <div class="col-md-12">
                                    <div class="d-flex flex-column comment-section" id="myGroup">
                                        <div class="bg-white p-2">
                                            <div class="d-flex flex-row user-info">
                                                <img class="rounded-circle" src="https://i.imgur.com/RpzrMR2.jpg" width="40" height="40">
                                                <div class="d-flex flex-column justify-content-start ml-2">
                                                    <span class="d-block font-weight-bold name">Marry Andrews</span>
                                                    <span class="date text-black-50">Shared publicly - Jan 2020</span>
                                                </div>
                                                <div class="reply-content mt-2">
                                                    <p class="comment-text">
                                                        Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat.
                                                    </p>
                                                </div>
                                                <div class="re-reply ml-auto mt-2">
                                                    <span>댓글달기</span>
                                                    <span>신고하기</span>
                                                </div>
                                            </div>    
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>

                    </div>
                    <!--댓글목록-->

                    <!--댓글페이징------------------------>
                    <div id="replyPaging">

                    </div>
                    <!--댓글페이징-->

                    <!--댓글 입력---------------------------------------->
                    <div id="commentWrite">
                        <div class="input-group mb-3">
                            <textarea class="form-control" placeholder="남에게 상처주는 말을 하지 맙시다."></textarea>
                            <div class="input-group-append">
                              <button class="btn btn-outline-secondary" type="submit">댓글등록하기</button>
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


</body>

</html>