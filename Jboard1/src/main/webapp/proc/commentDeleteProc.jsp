<%@page import="com.google.gson.JsonObject"%>
<%@page import="kr.co.jboard1.dao.ArticleDAO"%>
<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("UTF-8");
	String no = request.getParameter("no");
	
	int result = ArticleDAO.getInstance().deleteComment(no);
	
	JsonObject json = new JsonObject();
	json.addProperty("result", result);
	
	out.print(json.toString());
%>