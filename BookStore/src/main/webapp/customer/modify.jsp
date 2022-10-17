<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
<%@page import="config.DBCP"%>
<%@page import="bean.CustomerBean"%>
<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("UTF-8");
	String custId = request.getParameter("custId");
	
	CustomerBean cb = null;
	
	try{
		Connection conn = DBCP.getConnection();
		
		String sql = "SELECT * FROM `customer` WHERE `custId`=?";
		PreparedStatement psmt = conn.prepareStatement(sql);
		psmt.setString(1, custId);
		
		ResultSet rs = psmt.executeQuery();
		
		if(rs.next()){
			cb = new CustomerBean();
			cb.setCustId(rs.getInt(1));
			cb.setName(rs.getString(2));
			cb.setAddress(rs.getString(3));
			cb.setPhone(rs.getString(4));
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
		<title>customer::modify</title>
	</head>
	<body>
		<h3>고객수정</h3>
		
		<a href="../index.jsp">처음으로</a>		
		<a href="./list.jsp">고객목록</a>
		
		<form action="modifyProc.jsp" method="post">
			<table border="1">
			 	<tr>
					<td>고객번호</td>
					<td><input type="number" name="custId"></td>
				</tr>
				<tr>
					<td>고객명</td>
					<td><input type="text" name="name"></td>
				</tr>
				<tr>
					<td>주소</td>
					<td><input type="text" name="address"></td>
				</tr>
				<tr>
					<td>휴대폰</td>
					<td><input type="text" name="phone"></td>
				</tr>
				<tr>
					<td colspan="2" align="right"><input type="submit" value="등록"></td>
				</tr>
			</table>
		</form>
	</body>
</html>