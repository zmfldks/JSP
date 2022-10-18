<%@page import="java.sql.PreparedStatement"%>
<%@page import="config.DBCP1"%>
<%@page import="java.sql.Connection"%>
<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<%

	try{
		
		request.setCharacterEncoding("UTF-8");
		String stdNo = request.getParameter("stdNo");
		String stdName = request.getParameter("stdName");
		String stdHp = request.getParameter("stdHp");
		String stdYear = request.getParameter("stdYear");
		String stdAddress = request.getParameter("stdAddress");
		
		Connection conn = DBCP1.getconConnection();
		
		String sql = "INSERT INTO `student` VALUES (?,?,?,?,?)";
		PreparedStatement psmt = conn.prepareStatement(sql);
		psmt.setString(1, stdNo);
		psmt.setString(2, stdName);
		psmt.setString(3, stdHp);
		psmt.setString(4, stdYear);
		psmt.setString(5, stdAddress);
		
		psmt.executeUpdate();
		
		psmt.close();
		conn.close();
		
	}catch(Exception e){
		e.printStackTrace();
	}

	response.sendRedirect("./list.jsp");
	
	
%>