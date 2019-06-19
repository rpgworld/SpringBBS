<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
<form action="reply" method="get">
<input type="hidden" value="${dto.num }">
<table style="width: 700px; cellpadding: 0; cellspacing: 0; border: 1;" >
	<tr>
		<th>제목</th>
		<td><input type="text" name="title" maxlength="100" style="width: 98%;" value="[RE]&nbsp;" ></td>
	</tr>
	<tr>
		<th>작성자</th>
		<td><input type="text" name="name" maxlength="100" style="width: 98%;"></td>
	<tr>
	<tr>
		<th>내용</th>
		<td><textarea style="height: 200px; width: 98%;" name="content"></textarea></td>
	<tr>
	<tr>
		<td colspan="2">
			<a href="list">목록으로</a>
			<input type="submit" style="float: right" value="답글쓰기">
		</td>
	</tr>
</table>
</form>
</body>
</html>