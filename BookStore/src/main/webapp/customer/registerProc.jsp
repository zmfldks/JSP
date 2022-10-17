<%@page import="java.sql.PreparedStatement"%>
<%@page import="config.DBCP"%>
<%@page import="java.sql.Connection"%>
<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<% 
	// 데이터 처리
	request.setCharacterEncoding("UTF-8");
	String name = request.getParameter("name");
	String address =request.getParameter("address");
	String phone = request.getParameter("phone");
	
	// 데이터베이스 작업
	try{
		Connection conn = DBCP.getConnection();
		
		String sql = "INSERT INTO `customer` (`name`,`address`,`phone`) VALUES (?,?,?)";
		PreparedStatement psmt = conn.prepareStatement(sql);
		psmt.setString(1, name);
		psmt.setString(2, address);
		psmt.setString(3, phone);
		
		psmt.executeUpdate();
		
		psmt.close();
		conn.close();
		
	}catch(Exception e){
		e.printStackTrace();
	}
	
	// 리다이렉트
	response.sendRedirect("./list.jsp");
%>