<%@page import="java.util.ArrayList"%>
<%@page import="kr.co.shop.bean.CustomerBean"%>
<%@page import="java.util.List"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="kr.co.shop.db.DBCP"%>
<%@page import="java.sql.Connection"%>
<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<%

	List<CustomerBean> customers = new ArrayList<>();	

	try{
		Connection conn =DBCP.getconConnection();
		Statement stmt = conn.createStatement();
		ResultSet rs = stmt.executeQuery("select * from `customer`");
		
		while(rs.next()){
			CustomerBean cb = new CustomerBean();
			cb.setCustId(rs.getString(1));
			cb.setName(rs.getString(2));
			cb.setHp(rs.getString(3));
			cb.setAddr(rs.getString(4));
			cb.setRdate(rs.getString(5));
			
			customers.add(cb);
		}
		
		rs.close();
		stmt.close();
		conn.close();
		
	}catch(Exception e){
		e.printStackTrace();
	}
%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>shop::customer</title>
		<!-- 
			날짜 : 2022/10/25
			이름 : 이왕근
			내용 : 수행평가
		 -->
	</head>
	<body>
		<h3>고객목록</h3>
		
		<a href="/Shop/customer.jsp">고객목록</a>
		<a href="/Shop/order.jsp">주문목록</a>
		<a href="/Shop/product.jsp">상품목록</a>
		
		<table border="1">
			<tr>
				<th>아이디</th>
				<th>이름</th>
				<th>휴대폰</th>
				<th>주소</th>
				<th>가입일</th>
			</tr>
			<% for(CustomerBean cb : customers){ %>
			<tr>
				<td><%= cb.getCustId() %></td>
				<td><%= cb.getName() %></td>
				<td><%= cb.getHp() %></td>
				<td><%= cb.getAddr() %></td>
				<td><%= cb.getRdate() %></td>
			</tr>
			<% } %>
		</table>
		
	</body>
</html>