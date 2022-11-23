<%@page import="bean.User2Bean"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Statement"%>
<%@page import="config.DBCP"%>
<%@page import="java.sql.Connection"%>
<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("UTF-8");
	String uid = request.getParameter("uid");
	
	User2Bean ub = null;
	
	try{
		Connection conn = DBCP.getConnection();
		String sql = "SELECT * FROM `user2` where `uid`=?";
		PreparedStatement psmt = conn.prepareStatement(sql);
		psmt.setString(1, uid);
		
		ResultSet rs = psmt.executeQuery();
		
		if(rs.next()){
			ub = new User2Bean();
			ub.setUid(rs.getString(1));
			ub.setName(rs.getString(2));
			ub.setHp(rs.getString(3));
			ub.setAge(rs.getInt(4));
		}
			rs.close();
			psmt.close();
			conn.close();
	}catch(Exception e){
		e.printStackTrace();
	}
%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>modify</title>
	</head>
	<body>
		<h3>user2수정</h3>
		<a href="./list.jsp">돌아가기</a>
		<a href="./register.jsp">등록하기</a>
		
		<form action="./modifyProc.jsp" method="post">
			<table border="1">
				<tr>
					<td>아이디</td>
					<td><input type="text" name="uid" value="<%= ub.getUid()%>" readonly="readonly"/></td>
				</tr>
				<tr>
					<td>이름</td>
					<td><input type="text" name="name" value="<%= ub.getName()%>"></td>
				</tr>
				<tr>
					<td>휴대폰</td>
					<td><input type="text" name="hp" value="<%= ub.getHp()%>"></td>
				</tr>
				<tr>
					<td>나이</td>
					<td><input type="text" name="age" value="<%= ub.getAge()%>"></td>
				</tr>
				<tr>
					<td colspan="2" align="right"><input type="submit" value="등록"></td>
				</tr>
			</table>
		</form>
	</body>
</html>