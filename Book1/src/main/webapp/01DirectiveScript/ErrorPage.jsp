<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8" errorPage="IsErrorPage.jsp"%>

<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>page 지시어 - errorPage, isErrorPage 속성</title>
		<%--
			날짜 : 2022/10/11
			이름 : 이왕근
			내용 : 에러 발생 페이지
		 --%>
	</head>
	<body>
	<% 
		int myAge = Integer.parseInt(request.getParameter("age")) + 10;
		out.println("10년 후 당신의 나이는 " + myAge + "입니다.");
	%>
	</body>
</html>