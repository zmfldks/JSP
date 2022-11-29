<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%@page import="kr.co.shop.db.DBCP"%>
<%@page import="java.util.ArrayList"%>
<%@page import="kr.co.shop.bean.ProductBean"%>
<%@page import="java.util.List"%>
<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<%
	List<ProductBean> products = new ArrayList<>();

	try{
		Connection conn = DBCP.getconConnection();
		Statement stmt = conn.createStatement();
		ResultSet rs = stmt.executeQuery("select * from `product`");
		
		while(rs.next()){
			ProductBean pb = new ProductBean();
				pb.setProdNo(rs.getInt(1));		
				pb.setProdName(rs.getString(2));		
				pb.setStock(rs.getInt(3));		
				pb.setPrice(rs.getInt(4));		
				pb.setCompany(rs.getString(5));
				
				products.add(pb);
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
		<title>shop::product</title>
		<!-- 
			날짜 : 2022/10/25
			이름 : 이왕근
			내용 : 수행평가
		 -->
	</head>
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.1/jquery.min.js"></script>
	<script>
	$(document).ready(function(){
		
		
		$(document).on('click', '#btnOrder',function(e){
			e.preventDefault();
			
			$('section').show();
			
			/* $('nav').empty().append("<h4>주문하기</h4>");
			
			 let table = "<table border='1'>";
				table += "<tr>";
				table += "<td>상품번호</td>";
				table += "<td><input type='text' name='proNo' placeholder=''></td>";
				table += "</tr>";
				table += "<tr>";
				table += "<td>수량</td>";
				table += "<td><input type='text' name='s' placeholder=''></td>";
				table += "</tr>";
				table += "<tr>";
				table += "<td>주문자</td>";
				table += "<td><input type='text' name='d' placeholder=''></td>";
				table += "</tr>";
				table += "<tr>";
				table += "<td colspan='2' align='right'><input type='submit' value='주문하기' id='f'></td>";
				table += "</tr>";
				table += "</table>"; 	
			
			$('section').append(table);*/
			
		});
		
		$(document).on('click', '#f', function(e){
			e.preventDefault();
			
			let prodNo = $('input[name=prodNo]').val();
			let orderCount = $('input[name=orderCount]').val();
			let custId = $('input[name=custId]').val();
			
			let jsonData = {
					"prodNo" : prodNo,
					"orderCount" : orderCount,
					"custId" : custId  
			};
			
			$.ajax({
				url :'/Shop/proc/orderProc.jsp',
				method : 'post',
				data : jsonData,
				dataType : 'json',
				success : function(data){
					
					if(data.result == 1){
						alert('주문 완료!');
					}else{
						alert('주문 실패!')
					}
				}
			})
		});
		
		
		
	});
</script>
	<body>
		<h3>상품목록</h3>
		
		<a href="/Shop/customer.jsp">고객목록</a>
		<a href="/Shop/order.jsp">주문목록</a>
		<a href="/Shop/product.jsp">상품목록</a>
		
		<table border="1">
			<tr>
				<th>상품번호</th>
				<th>상품명</th>
				<th>재고량</th>
				<th>가격</th>
				<th>제조사</th>
				<th>주문</th>
			</tr>
			<% for(ProductBean pb : products){ %>
			<tr>
				<td><%= pb.getProdNo() %></td>
				<td><%= pb.getProdName() %></td>
				<td><%= pb.getStock() %></td>
				<td><%= pb.getPrice() %></td>
				<td><%= pb.getCompany() %></td>
				<td>
					<input type="submit" value="주문" id="btnOrder"/>
				</td>
			</tr>
			<% } %>
		</table>
		<nav></nav>
		<section style="display:none;">
			<h4>주문하기</h4>
			<table border="1">
				<tr>
					<td>상품번호</td>
					<td><input type="text" name="prodNo" readonly="readonly"></td>
				</tr>
				<tr>
					<td>수량</td>
					<td><input type="text" name="prodCount"></td>
				</tr>
				<tr>
					<td>주문자</td>
					<td><input type="text" name="prodOrderer"></td>
				</tr>
				<tr>
					<td colspan="2" align="right"><input type="submit" value="주문하기"></td>
				</tr>
			</table>
			<button class="btnClose">닫기</button>
		</section>
	</body>
</html>