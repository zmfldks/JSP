<%@page import="kr.co.jboard1.bean.UserBean"%>
<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<%
	UserBean sessUser = (UserBean)session.getAttribute("sessUser");

	if(sessUser == null){
		// 로그인을 안했으면
		pageContext.forward("./user/login.jsp");
	}else{
		// 로그인을 했으면
		pageContext.forward("./list.jsp");
	}

%>