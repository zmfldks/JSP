<%@page import="java.sql.PreparedStatement"%>
<%@page import="db.DBCP"%>
<%@page import="java.sql.Connection"%>
<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("UTF-8");
	String uid = request.getParameter("uid");
	String pass1 = request.getParameter("pass1");
	String name = request.getParameter("name");
	String nick  = request.getParameter("nick");
	String email = request.getParameter("email");
	String hp = request.getParameter("hp");
	String regip = request.getRemoteAddr();
	
	try{
		Connection conn = DBCP.getConnection();
		
		String sql = "INSERT INTO `board_user` set ";
			   sql += "`uid` =?,";
			   sql += "`pass` =SHA2(?,256),";
			   sql += "`name` =?,";
			   sql += "`nick` =?,";
			   sql += "`email` =?,";
			   sql += "`hp` =?,";
			   sql += "`regip` =?,";
			   sql += "`rdate` =NOW()";
			   
		PreparedStatement psmt =conn.prepareStatement(sql);
			   psmt.setString(1, uid);
			   psmt.setString(2, pass1);
			   psmt.setString(3, name);
			   psmt.setString(4, nick);
			   psmt.setString(5, email);
			   psmt.setString(6, hp);
			   psmt.setString(7, regip);
			   
			   psmt.executeUpdate();
			   
			   psmt.close();
			   conn.close();
			   
	}catch(Exception e){
		e.printStackTrace();
	}
	
	response.sendRedirect("/Jboard1/user/login.jsp");
	
%>