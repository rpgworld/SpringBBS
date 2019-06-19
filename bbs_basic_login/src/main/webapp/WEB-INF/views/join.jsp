<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>
</head>
<body>
<form action="join" method="post">
<table>
	<tr>
		<th>ID</th>
		<td><input type="text" name="id" ></td>
	</tr>
	<tr>
		<th>PW</th>
		<td><input type="password" name="pw" ></td>
	</tr>
	<tr>
		<th>Name</th>
		<td><input type="text" name="name" ></td>
	</tr>
	<tr>
		<th>Age</th>
		<td><input type="number" name="age" ></td>
	</tr>
	<tr>
		<th>Email</th>
		<td><input type="email" name="email" ></td>
	</tr>
	<tr>
		<td colspan="2">
			<a href="list">목록으로</a>
			<input style="float: right;" type="submit" value="회원가입">
		</td>
	</tr>
</table>
</form>
</body>
</html>