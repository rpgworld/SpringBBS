<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<style>
td {
text-align: center;
}
</style>
</head>
<body>
<table width="700" cellpadding="0" cellspacing="0" border="1">
	<tr>
		<td>글번호</td>
		<td>작성자</td>
		<td>제목</td>
		<td>내용</td>
		<td>작성날짜</td>
		<td>작성시간</td>
		<td>조회수</td>
		<td>삭제</td>
	<tr>
	<c:forEach items="${list}" var="dto">
	<tr>
		<td><a href="read?num=${dto.num }">${dto.num}</a></td>
		<td>${dto.name}</td>
		<td><a href="read?num=${dto.num }">${dto.title }</a></td>
		<td style="text-align: left;"><a href="read?num=${dto.num }">${dto.content}</a></td>
		<td>${dto.writeDate}</td>
		<td>${dto.writeTime}</td>
		<td>${dto.writeCnt}</td>
		<td><a href="delete?num=${dto.num}">X</a></td>
	<tr>
	</c:forEach>
</table>
<p><a href="writeForm">글작성</a></p>

<c:forEach var="i" begin="1" end="${pageCnt }">
	<a href="list?curPage=${i }">${i }</a>
</c:forEach>
</body>
</html>