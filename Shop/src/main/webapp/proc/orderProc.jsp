<%@page import="com.google.gson.JsonObject"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
<%@page import="kr.co.shop.db.DBCP"%>
<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("UTF-8");
	String prodNo = request.getParameter("prodNo");
	String prodCount = request.getParameter("prodCount");
	String prodOrderer = request.getParameter("prodOrderer");
	
	int result = 0;
	
	try{
		Connection conn = DBCP.getconConnection();
		String sql = "insert into `order` (`orderId`, `orderProduct`, `orderDate`) ";
			   sql += "values (?, ?, ?, NOW())";
			   
		PreparedStatement psmt = conn.prepareStatement(sql);
		psmt.setString(1, prodOrderer);
		psmt.setString(2, prodNo);
		psmt.setString(3, prodCount);
		
		result = psmt.executeUpdate();
		
		psmt.close();
		conn.close();
		
	}catch(Exception e){
		e.printStackTrace();
	}
	
	// Json 출력
	JsonObject json = new JsonObject();
	json.addProperty("result", result);
	
	
%>