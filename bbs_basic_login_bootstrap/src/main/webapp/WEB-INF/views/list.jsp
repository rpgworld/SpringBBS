<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0, maximun-scale=1, minimun-scale=1, user-scalable=no">
<title>Insert title here</title>
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css">
<link rel="stylesheet" href="https://cdn.jsdelivr.net/bxslider/4.2.12/jquery.bxslider.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script	src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"></script>
<script src="https://cdn.jsdelivr.net/bxslider/4.2.12/jquery.bxslider.min.js"></script>
<style>
@import url('https://fonts.googleapis.com/css?family=Roboto&display=swap');

* {
font-family: 'Roboto', sans-serif;
}
.content_section, .btn {
font-size: 0.8rem;
}
th:first-child, td:first-child {
border-radius: 7px 0 0 7px;
border-left: 1px solid #E2E2E2;
}
th:last-child, td:last-child {
border-radius: 0 7px 7px 0;
border-right: 1px solid #E2E2E2;
}
td{ 
border-bottom: 1px solid #E2E2E2;
}
.bbs_bottom {
display: flex;
justify-content: space-between;
}

</style>
</head>
<body>

<c:if test="${sessionScope.id != null }">
	<c:set var="id" value="${sessionScope.id }" />
</c:if>
<c:if test="${sessionScope.msgType != null }" >
	<c:set var="msgType" value="${sessionScope.msgType }"/>
	<c:set var="msgContent" value="${sessionScope.msgContent }"/>
</c:if>
<script>
	var msgType = '${msgType}';
	var msgContent = '${msgContent}';
	
$('document').ready(function(){
	if(msgType != '') {
		alert(msgType + ' + ' + msgContent);
	}
});

</script>

	<nav class="navbar navbar-expand-lg navbar-light bg-light">
	  <a class="navbar-brand" href="index">Movie Cafe</a>
	  <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
	    <span class="navbar-toggler-icon"></span>
	  </button>
	
	  <div class="collapse navbar-collapse" id="navbarSupportedContent">
	    <ul class="navbar-nav mr-auto">
	      <li class="nav-item">
	        <a class="nav-link" href="index">메인 <span class="sr-only">(current)</span></a>
	      </li>
	      <li class="nav-item active">
	        <a class="nav-link" href="list">게시판</a>
	      </li>
	    </ul>
	    <ul class="navbar-nav navbar-right">
	       <li class="nav-item dropdown">
		       <c:choose>
				<c:when test="${id == null }">
			        <a class="nav-link dropdown-toggle" href="#" id="navbarDropdown" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
			          접속하기
			        </a>
			        <div class="dropdown-menu dropdown-menu-right" aria-labelledby="navbarDropdown">
			          <a class="dropdown-item" href="loginForm">로그인</a>
			          <a class="dropdown-item" href="joinForm">회원가입</a>
			          <div class="dropdown-divider"></div>
			          <a class="dropdown-item" href="#">미제</a>
			        </div>
			      </c:when>
						<c:otherwise>
							<a class="nav-link dropdown-toggle" href="#" id="navbarDropdown" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
			          회원관리
			        </a>
			        <div class="dropdown-menu dropdown-menu-right" aria-labelledby="navbarDropdown">
			          <a class="dropdown-item" href="userUpdateForm">회원정보 수정</a>
			          <div class="dropdown-divider"></div>
			          <a class="dropdown-item" href="#">미제</a>
			        </div>
			      </c:otherwise>
					</c:choose>
	      </li>
	    </ul>
	  </div>
	</nav>
	
	<section class="content_section">
		<div class="container" style="margin-top: 30px;">
			<table class="table table-striped" style="text-align: center;">
				<thead>
					<tr style="background-color: #006DCC; color: white;">
						<th style="text-align: center;">글번호</th>
						<th style="text-align: center;">글제목</th>
						<th style="text-align: center;">작성자</th>
						<th style="text-align: center;">작성일</th>
						<th style="text-align: center;">작성시간</th>
						<th style="text-align: center;">조회수</th>
						<th style="text-align: center;">답글수</th>
					</tr>
				</thead>
				<tbody>
					<c:forEach items="${list }" var="dto">
						<tr>
							<td><a href="read?num=${dto.num }">${dto.num }</a></td>
							<td style="text-align: left;">
								<c:forEach begin="1" end="${dto.lev }">
									<c:out value="&nbsp; &nbsp;" escapeXml="false"/>
								</c:forEach>
								<a href="read?num=${dto.num }"><c:out value="${dto.title }"/></a>
							</td>
							<td>${dto.name }</td>
							<td>${dto.writeDate }</td>
							<td>${dto.writeTime }</td>
							<td>${dto.hit }</td>
							<td>${dto.replyCnt }</td>
						</tr>
					</c:forEach>
				</tbody>
			</table>
			<form action="search" method="post" class="bbs_bottom form-inline">
				<div>
					<a href="list" class="btn btn-default pull-left">첫 페이지</a>
					<c:forEach var="i" begin="1" end="${pageCnt }">
						<a  class="btn btn-default pull-left" href="list?curPage=${i }">${i }</a>
					</c:forEach>
				</div>
				<div class="search_box">
					<select class="form-control" name="searchOption" style="width: 100px;">
						<option value="title">제목</option>
						<option value="content">내용</option>
						<option value="both">제목+내용</option>
						<option value="name">작성자</option>
					</select>
				
					<input type="text" class="form-control" name="searchWord" placeholder="키워드" style="width: 150px;">
					<input type="submit" class="btn btn-default" value="검색">
				</div>
				<div>
        	<a href="bbsWriteForm.bbs" class="btn btn-primary pull-right">글쓰기</a>
        </div>
			</form>
		</div>
	</section>

<c:if test="${sessionScope.msgType != null }">
	<c:remove var="msgType" scope="session" />
	<c:remove var="msgContent" scope="session" />
</c:if>
</body>
</html>