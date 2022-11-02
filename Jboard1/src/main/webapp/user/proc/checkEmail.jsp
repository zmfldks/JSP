<%@page import="kr.co.jboard1.bean.UserBean"%>
<%@page import="kr.co.jboard1.db.Sql"%>
<%@page import="com.google.gson.JsonObject"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
<%@page import="kr.co.jboard1.db.DBCP"%>
<%@ page contentType="application/json;charset=UTF-8" pageEncoding="UTF-8"%>

<%

	 // 전송 데이터수신
	/* request.setCharacterEncoding("UTF-8");
	String email = request.getParameter("email");
	
	// 데이터베이스 처리
	UserBean ub = null;	
	
	try{
		Connection conn = DBCP.getConnection();
		PreparedStatement psmt = conn.prepareStatement(Sql.SELECT_COUNT_EMAIL);
		psmt.setString(1, email);
		
		ResultSet rs = psmt.executeQuery();
		
		if(rs.next()){
			ub = new UserBean();
			
		}
		
		rs.close();
		psmt.close();
		conn.close();
		
	}catch(Exception e){
		e.printStackTrace();
	}
	
	// JSON 출력
	JsonObject json = new JsonObject();
	// json.addProperty("result", result);
	
	String jsonData = json.toString();
	out.print(jsonData); */
%>