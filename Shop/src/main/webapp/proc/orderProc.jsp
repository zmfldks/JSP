<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
<%@page import="kr.co.shop.db.DBCP"%>
<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("UTF-8");
	String prodNo = request.getParameter("prodNo");
	String orderCount = request.getParameter("orderCount");
	String custId = request.getParameter("custId");
	
	try{
		Connection conn = DBCP.getconConnection();
		String sql = "insert into `order` set `orderProduct`=?, `orderCount`=?, `orderId`=?, `orderDate`=NOW() ";
		PreparedStatement psmt = conn.prepareStatement(sql);
		
	}catch(Exception e){
		e.printStackTrace();
	}
%>