<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<script src="https://code.jquery.com/jquery-3.2.1.min.js"></script>
<title>Insert title here</title>
<style>
table, tr, th, td {
border: 1px solid black;
border-collapse: collapse;
}
td {
text-align: center;
}
</style>

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
</head>
<body>
	
	<c:if test="${sessionScope.id != null }">
		<c:set var="id" value="${sessionScope.id }" />
	</c:if>

	<c:choose>
		<c:when test="${id == null }">
			<a href="loginForm">로그인</a> 
			<a href="joinForm">회원가입</a>
			<a href="userList">관리자 페이지</a>
		</c:when>
		<c:otherwise>
			<c:out value="${id }님 환영합니다."/> <br>
			<a href="logout">로그아웃</a>
			<a href="userList">관리자 페이지</a>
		</c:otherwise>
	</c:choose>
	 
<table style="width: 700px;">
	<tr>
		<td>글번호</td>
		<td>작성자</td>
		<td>제목</td>
		<td>작성날짜</td>
		<td>작성시간</td>
		<td>조회수</td>
		<td>답글수</td>
		<td>삭제</td>
	<tr>
	<c:forEach items="${list}" var="dto">
	<tr>
		<td><a href="read?num=${dto.num }">${dto.num}</a></td>
		<td>${dto.name}</td>
		<td style="text-align: left;"><a href="read?num=${dto.num }">
		<c:forEach begin="1" end="${dto.lev}"> 
			&nbsp;&nbsp;
		</c:forEach>
		${dto.title }</a></td>
		<td>${dto.writeDate}</td>
		<td>${dto.writeTime}</td>
		<td>${dto.hit}</td>
		<td>${dto.replyCnt }</td>
		<td><a href="delete?num=${dto.num}&ref=${dto.ref }&step=${dto.step }&lev=${dto.lev }&name=${dto.name}">X</a></td>
	<tr>
	</c:forEach>
</table>
<p><a href="writeForm">글작성</a></p>


<a href="list?curPage=${curPage - 1 }">이전</a>

<c:forEach var="i" begin="${startPage }" end="${endPage }">
	<a href="list?curPage=${i }">${i }</a>
</c:forEach>

<form action="search" method="get">
	<select name="searchOption">
		<option value="title">제목</option>
		<option value="content">내용</option>
		<option value="both">제목+내용</option>
		<option value="name">작성자</option>
	</select>
	<input type="text" name="searchWord">
	<input type="submit" value="검색">
</form>


<c:if test="${sessionScope.msgType != null }">
	<c:remove var="msgType" scope="session" />
	<c:remove var="msgContent" scope="session" />
</c:if>
</body>
</html>