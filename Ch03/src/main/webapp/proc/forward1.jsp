<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>forward1</title>
	</head>
	<body>
		<h3>forward1 페이지</h3>
	</body>
</html>
<%
	pageContext.forward("../1_request.jsp");
%>
