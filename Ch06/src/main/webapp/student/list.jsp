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
			날짜 : 2022/10/18
			이름 : 이왕근
			내용 : 
		 --%>
	</head>
	<body>
		<h3>학생 목록</h3>
		
		<a href="../1_JDBC.jsp">처음으로</a>
		<a href="./register.jsp">학생등록</a>
		
		<table border="1">
			<tr>
				<th>학생번호</th>
				<th>학생이름</th>
				<th>학생전화번호</th>
				<th>학년</th>
				<th>학생주소</th>
				<th>관리</th>
			</tr>
			<tr>
				<td>1</td>
				<td>2</td>
				<td>3</td>
				<td>4</td>
				<td>5</td>
				<td>
					<a href="#">수정</a>
					<a href="#">삭제</a>
				</td>
			</tr>
		</table>
	</body>
</html>