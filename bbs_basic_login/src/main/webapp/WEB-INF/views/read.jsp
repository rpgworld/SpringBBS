<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<style>
</style>
</head>
<body>
<form action="delete" method="get">
<input type="hidden" name="num" value="${dto.num }">
<input type="hidden" name="ref" value="${dto.ref }">
<input type="hidden" name="step" value="${dto.step }">
<input type="hidden" name="lev" value="${dto.lev }">
<table cellpadding="0" cellspacing="0" border="1" style="width: 700px" >
	<tr>
		<th>제목</th>
		<th>${dto.title }</th>
		<th>작성일</th>
		<th>${dto.writeDate } ${dto.writeTime }</th>
	<tr>
	<tr>
		<th>작성자</th>
		<th>${dto.name}</th>
		<th>조회수</th>
		<th>${dto.hit }</th>
	</tr>
	<tr>
		<th>내용</th>
		<td colspan="3"><textarea style="height: 200px; width: 98%;" name="mContent" readOnly>${dto.content }</textarea></td>
	<tr>
	<tr>
		<td colspan="4">
			<a href="list">목록으로</a>
			<a href="replyForm?num=${dto.num }" style="float:right;">답글</a>
			<input type="submit" value="삭제하기" style="float:right">
			<a href="updateForm?num=${dto.num }" style="float:right;">수정하기</a>
		</td>
	</tr>
</table>
</form>
</body>
</html>