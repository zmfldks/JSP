<%@page import="bean.UserBean6"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.util.List"%>
<%@page import="bean.User5Bean"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="config.DBCP"%>
<%@page import="java.sql.Connection"%>
<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<%
	List<UserBean6> users = new ArrayList<>();

	try{
		Connection conn = DBCP.getConnection();
		Statement stmt = conn.createStatement();
		ResultSet rs= stmt.executeQuery("select * from `user6`");
				
		while(rs.next()){
			UserBean6 ub = new UserBean6();
			ub.setUid(rs.getString(1));
			ub.setName(rs.getString(2));
			ub.setBirth(rs.getString(3));
			ub.setGender(rs.getInt(4));
			ub.setAge(rs.getInt(5));
			ub.setAddr(rs.getString(6));
			ub.setHp(rs.getString(7));
			
			users.add(ub);
		}
		rs.close();
		stmt.close();
		conn.close();
	}catch(Exception e){
		e.printStackTrace();
	}
%>

<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>user6::list</title>
	</head>
	<body>
		<h3>user6 목록</h3>
		
		<a href="../2_DBCPTest2.jsp">처음으로</a>		
		<a href="./register.jsp">user6 등록</a>
		
		<table border="1">
			<tr>
				<th>아이디</th>
				<th>이름</th>
				<th>생년월일</th>
				<th>성별</th>
				<th>나이</th>
				<th>주소</th>
				<th>휴대폰</th> 
				<th>관리</th>
			</tr>
			<% for(UserBean6 ub : users){ %>
			<tr>
				<td><%= ub.getUid() %></td>
				<td><%= ub.getName() %></td>
				<td><%= ub.getBirth() %></td>
				<td><%= ub.getGender() %></td>
				<td><%= ub.getAge() %></td>
				<td><%= ub.getAddr() %></td>
				<td><%= ub.getHp() %></td>
				<td>
					<a href="./modify.jsp?uid=<%= ub.getUid() %>">수정</a>
					<a href="./delete.jsp?uid=<%= ub.getUid() %>">삭제</a>
				</td>
			</tr>
			<% } %>
		</table>		
	</body>
</html>