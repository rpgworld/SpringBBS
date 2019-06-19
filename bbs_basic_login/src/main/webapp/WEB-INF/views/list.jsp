<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
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
</head>
<body>

	<%  
	String id = null;
	
	if (session.getAttribute("id") != null ) {
		id = (String) session.getAttribute("id");	
	}
	
	if (id != null) {
	%>
		<%=id %> 님 환영합니다. <br>
		
		<a href="logout">로그아웃</a>
	<%
	} else {
	%>
		<a href="loginForm">로그인</a>
		<a href="joinForm">회원가입</a>
	<% } %>


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
		<td><a href="delete?num=${dto.num}&ref=${dto.ref }&step=${dto.step }&lev=${dto.lev }">X</a></td>
	<tr>
	</c:forEach>
</table>
<p><a href="writeForm">글작성</a></p>

<c:forEach var="i" begin="1" end="${pageCnt }">
	<a href="list?curPage=${i }">${i }</a>
</c:forEach>
</body>
</html>