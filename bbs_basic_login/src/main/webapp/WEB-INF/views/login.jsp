<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<script src="https://code.jquery.com/jquery-3.2.1.min.js"></script>
<title>Insert title here</title>
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

<c:if test="${sessionScope.msgType != null }">
	<c:remove var="msgType" scope="session" />
	<c:remove var="msgContent" scope="session" />
</c:if>
</body>
</html>