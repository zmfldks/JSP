<%@page import="java.util.ArrayList"%>
<%@page import="kr.co.college.bean.LectureBean"%>
<%@page import="java.util.List"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%@page import="kr.co.college.db.DBCP"%>
<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<%
	List<LectureBean> lectures = new ArrayList<>();
	
	try{
		Connection conn = DBCP.getConnection();
		Statement stmt = conn.createStatement();
		ResultSet rs = stmt.executeQuery("select * from `lecture`");
		
		while(rs.next()){
			LectureBean lb = new LectureBean();
			lb.setLecNo(rs.getInt(1));
			lb.setLecName(rs.getString(2));
			lb.setLecCredit(rs.getInt(3));
			lb.setLecTime(rs.getInt(4));
			lb.setLecClass(rs.getString(5));
			
			lectures.add(lb);
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
		<title>lecture</title>
		<!-- 
			날짜 : 2022/11/07
			이름 : 이왕근
			내용 : 수행평가
		 -->
		<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.1/jquery.min.js"></script>
		<script>
			$(function(){
				
				$('.btnRegister').click(function(){
					$('section').show();
				});
				
				$('.btnClose').click(function(){
					$('section').hide();
				});
				
				$('input[type=submit]').click(function(){
					let lecNo	= $('input[name=lecNo]').val();
					let lecName	= $('input[name=lecName]').val();
					let lecCredit	= $('input[name=lecCredit]').val();
					let lecTime	= $('input[name=lecTime]').val();
					let lecClass	= $('input[name=lecClass]').val();
					
					let jsonData = {
							"lecNo":lecNo,
							"lecName":lecName,
							"lecCredit":lecCredit,
							"lecTime":lecTime,
							"lecClass":lecClass
							
					};
					
					$.post('./lectureProc.jsp', jsonData, function(data){
						let	table = "<tr>";
							table += "<td>"+lecNo+"</td>";
							table += "<td>"+lecName+"</td>";
							table += "<td>"+lecCredit+"</td>";
							table += "<td>"+lecTime+"</td>";
							table += "<td>"+lecClass+"</td>";
							table += "</tr>";
						
							$('.lec').append(table);
							
							
							
					});
					
				});
			});
		</script> 
	</head>
	<body>
		<h2>강좌관리</h2>
		<a href="./lecture.jsp">강좌관리</a>
		<a href="./register.jsp">수강관리</a>
		<a href="./student.jsp">학생관리</a>
		
		<h3>강좌현황</h3>
		<button class="btnRegister">등록</button>
		<table border="1" class="lec">
			<tr>
				<th>번호</th>
				<th>강좌명</th>
				<th>학점</th>
				<th>시간</th>
				<th>강의장</th>
			</tr>
			<% for(LectureBean lb : lectures){ %>
			<tr>
				<td><%= lb.getLecNo() %></td>
				<td><%= lb.getLecName() %></td>
				<td><%= lb.getLecCredit() %></td>
				<td><%= lb.getLecTime() %></td>
				<td><%= lb.getLecClass() %></td>
			</tr>
			<% } %>
		</table>
		
		<section style="display:none;">
			<h3>강좌등록</h3>
			<button class="btnClose">닫기</button>
			<table border="1">
				<tr>
					<td>번호</td>
					<td><input type="text" name="lecNo"></td>
				</tr>
				<tr>
					<td>강좌명</td>
					<td><input type="text" name="lecName"></td>
				</tr>
				<tr>
					<td>학점</td>
					<td><input type="text" name="lecCredit"></td>
				</tr>
				<tr>
					<td>시간</td>
					<td><input type="text" name="lecTime"></td>
				</tr>
				<tr>
					<td>강의장</td>
					<td><input type="text" name="lecClass"></td>
				</tr>
				<tr>
					<td colspan="2" align="right"><input type="submit" value="추가"></td>
				</tr>
			</table>
			
		</section>
	</body>
</html>