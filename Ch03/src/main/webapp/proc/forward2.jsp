<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>forward2</title>
	</head>
	<body>
		<h3>forward2 페이지</h3>
	</body>
</html>
<%
	// forward는 서버 지원 내에서 페이지 이동이기 때문에 타 서버 지원으로 forwarding 안됨
	pageContext.forward("https://naver.com");
%>
