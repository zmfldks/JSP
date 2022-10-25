<%@page import="java.util.ArrayList"%>
<%@page import="kr.co.shop.bean.OrderBean"%>
<%@page import="java.util.List"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%@page import="kr.co.shop.db.DBCP"%>
<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<%
	
	List<OrderBean> orders = new ArrayList<>();
	
	try{
		Connection conn = DBCP.getconConnection();
		Statement stmt = conn.createStatement();
		String sql = "SELECT `orderNo`, `name`, `prodName`, `orderCount`, `orderDate`FROM `customer`";
			   sql += " AS a JOIN `order` AS b ON a.custId = b.orderId";
			   sql += " JOIN `product`AS c ON b.orderProduct = c.prodNo";
		ResultSet rs = stmt.executeQuery(sql);
		
		while(rs.next()){
			OrderBean ob = new OrderBean();
			ob.setOrderNo(rs.getInt(1));
			ob.setOrderId(rs.getString(2));
			ob.setOrderProduct(rs.getString(3));
			ob.setOrderCount(rs.getInt(4));
			ob.setOrderDate(rs.getString(5));
			
			orders.add(ob);
			
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
		<title>shop::order</title>
		<!-- 
			날짜 : 2022/10/25
			이름 : 이왕근
			내용 : 수행평가
		 -->
	</head>
	<body>
		<h3>주문목록</h3>
		
		<a href="/Shop/customer.jsp">고객목록</a>
		<a href="/Shop/order.jsp">주문목록</a>
		<a href="/Shop/product.jsp">상품목록</a>
		
		<table border="1">
			<tr>
				<th>주문번호</th>
				<th>주문자</th>
				<th>주문상품</th>
				<th>주문수량</th>
				<th>주문일</th>
			</tr>
			<% for(OrderBean ob : orders){ %>
			<tr>
				<td><%= ob.getOrderNo() %></td>
				<td><%= ob.getOrderId() %></td>
				<td><%= ob.getOrderProduct() %></td>
				<td><%= ob.getOrderCount() %></td>
				<td><%= ob.getOrderDate() %></td>
			</tr>
			<% } %>
		</table>
	</body>
</html>