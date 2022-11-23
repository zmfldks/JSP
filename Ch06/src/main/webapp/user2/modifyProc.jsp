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
	String name = request.getParameter("name");
	String hp = request.getParameter("hp");
	String age = request.getParameter("age");
	
	
	try{
		Connection conn = DBCP.getConnection();
		String sql = "update `user2` set `name`=?, `hp`=?, `age`=? where `uid`=?";
		PreparedStatement psmt = conn.prepareStatement(sql);
		psmt.setString(1, name);		
		psmt.setString(2, hp);		
		psmt.setString(3, age);		
		psmt.setString(4, uid);		
		
		psmt.executeUpdate();
		
			psmt.close();
			conn.close();
	}catch(Exception e){
		e.printStackTrace();
	}
	
	response.sendRedirect("./list.jsp");
%>
