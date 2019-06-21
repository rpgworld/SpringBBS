<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0, maximun-scale=1, minimun-scale=1, user-scalable=no">
<title>MVC Board</title>
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
table, .btn, .form-control {
font-size: 0.8rem
}
.title {
font-size: 1rem;
}
.list_btn {
float: left;
}
.btn_group {
float: right;
}
table {
margin-top: 30px;
}
td, tr, th, table{ 
border: 1px solid #E2E2E2;
}
th {
background-color: #FAFAFA;
}
</style>
</head>
<body>
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
		<div class="container">
		
		</div>
	</section>
<section class="content_section">
		<div class="container">
			<form action="delete" method="get">
			<table class="table" style="text-align: center;">
				<thead>
					<tr>
						<th colspan="4" class="title" style="background-color: #006DCC; color: white; border-radius: 7px 7px 0 0;">게시판 글 열람</th>
					</tr>
				</thead>
				<tbody>
					<tr>
						<th style="vertical-align:middle;">글 제목</th>
						<td><input type="text" class="form-control" placeholder="글 제목" name="subject" maxlength="50" value="${dto.title }" readonly></td>
						<th style="vertical-align:middle;">날짜</th> 
						<td style="vertical-align:middle;">${dto.writeDate } ${dto.writeTime }</td>
					</tr>
					<tr>
						<th style="vertical-align:middle;">작성자</th>
						<td><input type="text" class="form-control" placeholder="작성자" name="userID" maxlength="50" value="${dto.name }" readonly></td>
						<th style="vertical-align:middle;">조회수</th> 
						<td style="vertical-align:middle;">${dto.hit }</td>
					</tr>
					<tr>
						<th style="vertical-align:middle;">글 내용</th>
						<td colspan="3"><textarea placeholder="글 내용" class="form-control" name="content" maxlength="2048" style="height: 350px;" readonly>${dto.content }</textarea></td>
					</tr>
				</tbody>
			</table>
			<a href="list" class="btn btn-primary list_btn">목록으로</a>
			<div class="btn_group">
				
				<a href="updateForm?num=${dto.num }&name=${dto.name}" class="btn btn-primary">수정</a>
				<input type="submit" class="btn btn-primary" value="삭제하기">
				<a href="replyForm?num=${dto.num }" class="btn btn-primary">답글</a>
			</div>
			</form>
		</div>
</section>
</body>
</html>