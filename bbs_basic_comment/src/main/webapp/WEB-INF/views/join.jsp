<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>   
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="http://code.jquery.com/jquery-3.2.1.min.js"></script>
<script>

</script>
</head>
<body>
<form action="join" method="post">
<table>
	<tr>
		<th>ID</th>
		<td><input type="text" name="id" ><input type="button" onclick="id_check()" value="중복체크"></td>
	</tr>
	<tr>
		<th>PW</th>
		<td colspan="2"><input type="password" name="pw" ></td>
	</tr>
	<tr>
		<th>Name</th>
		<td colspan="2"><input type="text" name="name" ></td>
	</tr>
	<tr>
		<th>Age</th>
		<td colspan="2"><input type="number" name="age" ></td>
	</tr>
	<tr>
		<th>Email</th>
		<td colspan="2"><input type="email" name="email" ></td>
	</tr>
	<tr>
		<td colspan="3">
			<a href="list">목록으로</a>
			<input style="float: right;" type="submit" value="회원가입">
		</td>
	</tr>
</table>
</form>
</body>
</html>