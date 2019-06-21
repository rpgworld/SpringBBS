<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
<form action="update" method="get">
<input type="hidden" name="num" value="${dto.num }">
<table cellpadding="0" cellspacing="0" border="1" style="width: 700px" >
	<tr>
		<th>제목</th>
		<td><input type="text" name="title" maxlength="100" style="width: 98%;" value="${dto.title }"></td>
	</tr>
	<tr>
		<th>내용</th>
		<td><textarea style="height: 200px; width: 98%;" name="content">${dto.content }</textarea></td>
	<tr>
	<tr>
		<td colspan="2">
			<a href="list">목록으로</a>
			<input type="submit" style="float: right" value="수정하기">
		</td>
	</tr>
</table>
</form>
</body>
</html>