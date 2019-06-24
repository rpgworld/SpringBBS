<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<form id="form1" action="uploadForm" method="post" 
	enctype="multipart/form-data" target="iframe1">
<input type="file" name="file" />
<input type="submit" value="업로드">
</form>

<iframe name="iframe1"></iframe>
<script>
function addFilePath(mag) {
	alert(msg);
	console.log(msg);
	document.getElementById("form1").reset();
}
</script>
</body>
</html>