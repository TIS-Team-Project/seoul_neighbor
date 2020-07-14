<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>


<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<STYLE TYPE="text/css">
	.table{
	font-size: 70%;
	white-space:nowrap;
	}
	body{
	overflow: scroll;
	}
	.container{
	background-color: white;
	}

</STYLE>
<title>Insert title here</title>
</head>
<body>
	<!-- header include ------------>
	<%@include file="../common/header.jsp"%>
	<!-- header include -->
	<div id="page-wrapper" class="container">
		<div class="row pb-3 pt-5">
			<div class="col-lg-12">
				<div class="page-header">
					<div class="dropdown">
						<h3>지역선택 :
					  		<button type="button" class="btn dropdown-toggle" data-toggle="dropdown">
					   			양천구
					  		</button>
					  		<div class="dropdown-menu">
						    <a class="dropdown-item" href="#">구로구</a>
						    <a class="dropdown-item" href="#">영등포구</a>
						    <a class="dropdown-item" href="#">강남구</a>
						  	</div>
					 	</h3>
					</div>
      			</div>
     		 </div>
		</div>
		<div class="row">
			<div class="col-xl-8">
				<div class="panel panel-default ">
					<div class="panel-heading pb-3">김서울님,양천구의이야기를들어보세요!</div>
				</div>
				<div class="panel panel-body">
					<div class="row">
						<div class="col-xl-6">
							<table class="table table-striped table-bordered table-hover"
								id="dataTables-example">
								<thead>
									<th colspan="3">추천 수가 많은 소식</th>
								</thead>
								<tbody>
									<c:forEach items="${list}" var="board" begin="1" end="5" step="1" varStatus="i">
										<tr>
											<td>[<c:out value="${board.location}"/>]</td>
											<td><a class='move' href='<c:out value="${board.bno}" />'>
												<c:out value="${board.title}"/></a>
												<b>[<c:out value="${board.replycnt}"/>]</b></td>
											<td><c:out value="${board.likecount}"/></td>
										</tr>
									</c:forEach>
								</tbody>
							</table>
						</div>
						<div class="col-xl-6">
							<table class="table table-striped table-bordered table-hover"
								id="dataTables-example">
								<thead>
									<th colspan="3">댓글 수가 많은 소식</th>
								</thead>
								<tbody>
									<c:forEach items="${list}" var="board" begin="1" end="5" step="1" varStatus="i">
										<tr>
											<td>[<c:out value="${board.location}"/>]</td>
											<td><a class='move' href='<c:out value="${board.bno}" />'>
												<c:out value="${board.title}"/></a>
												<b>[<c:out value="${board.replycnt}"/>]</b></td>
											<td><c:out value="${board.likecount}"/></td>
										</tr>
									</c:forEach>
								</tbody>
							</table>
						</div>
					</div>
				</div>
			</div>
			<div class="col-xl-4">
				<div class="panel panel-default ">
					<div class="panel-heading pb-3">서울전체 인기 소식</div>
				</div>
				<div class="panel panel-body">
					<div class="row">
						<div class="col-xl-12">
							<table class="table table-hover"
								id="dataTables-example">
								<tbody>
									<c:forEach items="${list}" var="board" begin="1" end="6" step="1" varStatus="i">
										<tr>
											<td>[<c:out value="${board.location}"/>]</td>
											<td><a class='move' href='<c:out value="${board.bno}" />'>
												<c:out value="${board.title}"/></a>
												<b>[<c:out value="${board.replycnt}"/>]</b></td>
											<td><c:out value="${board.likecount}"/></td>
										</tr>
									</c:forEach>
								</tbody>
							</table>
						</div>
					</div>
				</div>
			</div>
		</div>

		<div class="row">
			<div class="col-lg-12">
				<div class="panel panel-default ">
					<div class="panel-heading pt-5 pb-3">양천구의전체이야기</div>
				</div>
				<div class="panel panel-body">
					<ul class="nav nav-tabs" role="tablist">
						<li class="nav-item"><a class="nav-link active"
							data-toggle="tab" href="#all">전체</a></li>
						<li class="nav-item"><a class="nav-link" data-toggle="tab"
							href="#menu1">소통해요</a></li>
						<li class="nav-item"><a class="nav-link" data-toggle="tab"
							href="#menu2">불만있어요</a></li>
						<li class="nav-item"><a class="nav-link" data-toggle="tab"
							href="#menu3">모여요</a></li>
					</ul>
					
				<div class="pull-right">
				<form action="/board/list" method='get'>
					<select  name="amount" class="selectpicker" data="pull-right" data-style="text-right"  dir="rtl">
						<option value="20"<c:out value="${pageMaker.cri.amount == '20'?'selected':''}"/>>20개씩</option>
						<option value="30" <c:out value="${pageMaker.cri.amount == '30'?'selected':''}"/>>30개씩</option>
					</select>
					</form>
					</div>

					<div class="tab-content pt-4">
						<div id="all" class="tab-pane active">
							<table width="100%"
								class="table table-striped table-bordered table-hover"
								id="dataTables-example">
								<thead>
									<tr>
										<th>글번호</th>
										<th>지역</th>
										<th>카테고리</th>
										<th>제목</th>
										<th>조회수</th>
										<th>추천수</th>
									</tr>
								</thead>
								<tbody>
									<c:forEach items="${list}" var="board">
										<tr>
											<td><c:out value="${board.bno}"/></td>
											<td><c:out value="${board.location}"/></td>
											<td><c:out value="${board.category}" /></td>
											<td><a class='move' href='<c:out value="${board.bno}" />'>
												<c:out value="${board.title}"/></a>
												<b>[<c:out value="${board.replycnt}"/>]</b></td>
											<td><c:out value="${board.viewcount}"/></td>
											<td><c:out value="${board.likecount}"/></td>
										</tr>
									</c:forEach>
								</tbody>
							</table>
						</div>
						<div id="menu1" class="container tab-pane fade">
							<table width="100%"
								class="table table-striped table-bordered table-hover"
								id="dataTables-example">
								<thead>
									<tr>
										<th>글번호</th>
										<th>지역</th>
										<th>카테고리</th>
										<th>제목</th>
										<th>조회수</th>
										<th>추천수</th>
									</tr>
								</thead>
								<tbody>
									<tr>
										<td>12</td>
										<td>신정동</td>
										<td>불만있어요</td>
										<td>신정4동OO노래방뒤쪽에쓰레기를버리는분들이많은것같아요[7]</td>
										<td>64</td>
										<td>13</td>
									</tr>
									<tr>
										<td>12</td>
										<td>신정동</td>
										<td>불만있어요</td>
										<td>신정4동OO노래방뒤쪽에쓰레기를버리는분들이많은것같아요[7]</td>
										<td>64</td>
										<td>13</td>
									</tr>
									<tr>
										<td>12</td>
										<td>신정동</td>
										<td>불만있어요</td>
										<td>신정4동OO노래방뒤쪽에쓰레기를버리는분들이많은것같아요[7]</td>
										<td>64</td>
										<td>13</td>
									</tr>
									<tr>
										<td>12</td>
										<td>신정동</td>
										<td>불만있어요</td>
										<td>신정4동OO노래방뒤쪽에쓰레기를버리는분들이많은것같아요[7]</td>
										<td>64</td>
										<td>13</td>
									</tr>
								</tbody>
							</table>
						</div>
						<div id="menu2" class="container tab-pane fade">
							<table width="100%"
								class="table table-striped table-bordered table-hover"
								id="dataTables-example">
								<thead>
									<tr>
										<th>글번호</th>
										<th>지역</th>
										<th>카테고리</th>
										<th>제목</th>
										<th>조회수</th>
										<th>추천수</th>
									</tr>
								</thead>
								<tbody>
									<tr>
										<td>12</td>
										<td>신정동</td>
										<td>불만있어요</td>
										<td>신정4동OO노래방뒤쪽에쓰레기를버리는분들이많은것같아요[7]</td>
										<td>64</td>
										<td>13</td>
									</tr>
									<tr>
										<td>12</td>
										<td>신정동</td>
										<td>불만있어요</td>
										<td>신정4동OO노래방뒤쪽에쓰레기를버리는분들이많은것같아요[7]</td>
										<td>64</td>
										<td>13</td>
									</tr>
									<tr>
										<td>12</td>
										<td>신정동</td>
										<td>불만있어요</td>
										<td>신정4동OO노래방뒤쪽에쓰레기를버리는분들이많은것같아요[7]</td>
										<td>64</td>
										<td>13</td>
									</tr>
									<tr>
										<td>12</td>
										<td>신정동</td>
										<td>불만있어요</td>
										<td>신정4동OO노래방뒤쪽에쓰레기를버리는분들이많은것같아요[7]</td>
										<td>64</td>
										<td>13</td>
									</tr>
								</tbody>
							</table>
						</div>
						<div id="menu3" class="container tab-pane fade">
							<table width="100%"
								class="table table-striped table-bordered table-hover"
								id="dataTables-example">
								<thead>
									<tr>
										<th>글번호</th>
										<th>지역</th>
										<th>카테고리</th>
										<th>제목</th>
										<th>조회수</th>
										<th>추천수</th>
									</tr>
								</thead>
								<tbody>
									<tr>
										<td>12</td>
										<td>신정동</td>
										<td>불만있어요</td>
										<td>신정4동OO노래방뒤쪽에쓰레기를버리는분들이많은것같아요[7]</td>
										<td>64</td>
										<td>13</td>
									</tr>
									<tr>
										<td>12</td>
										<td>신정동</td>
										<td>불만있어요</td>
										<td>신정4동OO노래방뒤쪽에쓰레기를버리는분들이많은것같아요[7]</td>
										<td>64</td>
										<td>13</td>
									</tr>
									<tr>
										<td>12</td>
										<td>신정동</td>
										<td>불만있어요</td>
										<td>신정4동OO노래방뒤쪽에쓰레기를버리는분들이많은것같아요[7]</td>
										<td>64</td>
										<td>13</td>
									</tr>
									<tr>
										<td>12</td>
										<td>신정동</td>
										<td>불만있어요</td>
										<td>신정4동OO노래방뒤쪽에쓰레기를버리는분들이많은것같아요[7]</td>
										<td>64</td>
										<td>13</td>
									</tr>
								</tbody>
							</table>
						</div>
					</div>
				</div>
			
															<!-- end pageination -->
					<div class='pull-right'>
						<ul class="pagination">
							<c:if test="${pageMaker.prev}">
								<li class="paginate_button previous"><a class="page-link" href="${pageMaker.startPage -1}">Previous</a></li>
							</c:if>

							<c:forEach var="num" begin="${pageMaker.startPage}"
								end="${pageMaker.endPage}">
								<li class="paginate_button" ${pageMaker.cri.pageNum==num? "active":""}"><a class="page-link" href="${num}">${num}</a></li>
							</c:forEach>

							<c:if test="${pageMaker.next}">
								<li class="paginate_button"><a class="page-link" href="${pageMaker.endPage +1}">Next</a></li>
							</c:if>
						</ul>
					</div>
					<!-- end pageination -->
						<form id='actionForm' action="/board/list" method="get">
						<input type='hidden' name='pageNum' value='${pageMaker.cri.pageNum}'> 
						<input type='hidden' name='amount' value='${pageMaker.cri.amount}'>
					</form>
			</div>
		</div>
	</div>
</body>

<script type="text/javascript">
$(document).ready(function(){
    var actionForm = $("#actionForm");
    
    $(".paginate_button a").on("click", function(e){
  	  e.preventDefault();
  	  
  	  console.log('click');
  	  
  	  actionForm.find("input[name='pageNum']").val($(this).attr("href"));
  	  actionForm.submit();
    });
});
</script>
</html>