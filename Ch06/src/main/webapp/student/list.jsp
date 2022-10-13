<%@page import="com.mysql.cj.xdevapi.Statement"%>
<%@page import="java.sql.Connection"%>
<%@page import="config.DB" %>
<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>

<%
	// 데이터베이스 작업
	
	try{
		Connection conn = DB.getInstance().getConnection();
		
	}catch(Exception e){
		e.printStackTrace();
	}
%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>student::list</title>
		<%--
			날짜 : 2022/
			이름 : 이왕근
			내용 :
		 --%>
	</head>
	<body>
		
	</body>
</html>