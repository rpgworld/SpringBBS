<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>
</head>
<body>
<form action="login" method="post">
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
		<td colspan="2">
			<a href="list">목록으로</a>
			<input style="float: right;" type="submit" value="로그인">
		</td>
	</tr>
</table>
</form>
</body>
</html>