<%@page import="java.util.ArrayList"%>
<%@page import="java.util.List"%>
<%@page import="bean.User2Bean"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%@page import="config.DBCP"%>
<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<%
	List<User2Bean> users = new ArrayList<>();

	try{
		Connection conn = DBCP.getConnection();
		Statement stmt = conn.createStatement();
		ResultSet rs = stmt.executeQuery("select * from `user2`");		

		while(rs.next()){
			User2Bean ub = new User2Bean();
			ub.setUid(rs.getString(1));
			ub.setName(rs.getString(2));
			ub.setHp(rs.getString(3));
			ub.setAge(rs.getInt(4));
			
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
		<title>list</title>
	</head>
	<body>
		<h3>user2목록</h3>
		<a href="./register.jsp">user2등록하기</a>
		
		<table border="1">
			<tr>
				<th>아이디</th>
				<th>이름</th>
				<th>휴대폰</th>
				<th>나이</th>
				<th>관리</th>
			</tr>
			<% for(User2Bean ub : users){ %>
			<tr>
				<td><%=ub.getUid() %></td>
				<td><%=ub.getName() %></td>
				<td><%=ub.getHp() %></td>
				<td><%=ub.getAge() %></td>
				<td>
					<a href="./modift.jsp">수정</a>
					<a href="./delete.jsp">삭제</a>
				</td>
			</tr>
			<% } %>
		</table>
	</body>
</html>