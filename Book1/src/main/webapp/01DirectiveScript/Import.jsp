<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.text.SimpleDateFormat" %>
<%@page import="java.util.Date"%>

<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>page 지시어 - import속성</title>
		<%--
			날짜 : 2022/10/11
			이름 : 이왕근
			내용 : import 속성으로 외부 클래스 불러오기
		 --%>
	</head>
	<body>
		<%
		Date today = new Date();
		SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd");
		String todayStr = dateFormat.format(today);
		out.println("오늘날짜 : "+ todayStr);
		%>
	</body>
</html>