<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
<%@page import="kr.co.college.db.DBCP"%>
<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<%
	try{
		Connection conn = DBCP.getConnection();
		String sql = "SELECT `stdNo`, `stdName`, `lecName`, `regLecNo`, `regMidScore`, `regFinalScore`, `regTotalScore`, `regGrade` ";
			   sql += "FROM `lecture` AS a JOIN `register` AS b ON a.lecNo = b.regLecNo ";	
			   sql += "JOIN `student` AS c ON b.regStdNo = c.stdNo ";	
			   sql += "where `stdNo`=? ";	
		PreparedStatement psmt = conn.prepareStatement(sql);
		ResultSet rs = psmt.executeQuery();
		
		
	}catch(Exception e){
		e.printStackTrace();
	}
%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>register</title>
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
					
					$.post('./lectureProc.jsp', jsonData, function(d ata){
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
		<h3>수강관리</h3>
		<a href="./lecture.jsp">강좌관리</a>
		<a href="./register.jsp">수강관리</a>
		<a href="./student.jsp">학생관리</a>
		
		<h3>수강현황</h3>
		<input type="text" value="입력하시오.">
		<input type="submit" value="검색" >
		<input type="submit" value="수강신청" class="btnRegister">
		<table border="1">
			<tr>
				<th>학번</th>
				<th>이름</th>
				<th>강좌명</th>
				<th>강좌코드</th>
				<th>중간시험</th>
				<th>기말시험</th>
				<th>총점</th>
				<th>등급</th>
			</tr>
			<tr>
				<td>1</td>
				<td>1</td>
				<td>1</td>
				<td>1</td>
				<td>1</td>
				<td>1</td>
				<td>1</td>
				<td>1</td>
			</tr>
		</table>
		
		<section style="display: none;">
			<h4>수강신청</h4>
			<button class="btnClose">닫기</button>
			<table border="1">
				<tr>
					<td>학번</td>
					<td><input type="text" name="#"></td>
				</tr>
				<tr>
					<td>이름</td>
					<td><input type="text" name="#"></td>
				</tr>
				<tr>
					<td>신청강좌</td>
					<td><input type="text" name="#"></td>
				</tr>
				<tr>
					<td colspan="2" align="right"><input type="submit" value="신청"></td>
				</tr>
			</table>
		</section>
	</body>
</html>