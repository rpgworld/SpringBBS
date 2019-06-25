<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>  
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Movie Cafe</title>
</head>
<body>
	<table>
		<caption>회원 관리</caption>
		<thead>
			<tr>
				<td>PID</td>
				<td>ID</td>
				<td>PW</td>
				<td>Name</td>
				<td>Age</td>
				<td>Email</td>
			</tr>
		</thead>
		<tbody>
			<c:forEach items="${list }" var="dto">
				<tr>
					<td>${dto.pid }</td>
					<td>${dto.id }</td>
					<td>${dto.pw }</td>
					<td>${dto.name }</td>
					<td>${dto.age }</td>
					<td>${dto.email }</td>
				</tr>
			</c:forEach>			
		</tbody>
	</table>
</body>
</html>