<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>student::register</title>
	</head>
	<body>
		<h3>학생등록</h3>
		
		<a href="../1_JDBC.jsp">처음으로</a>
		<a href="./list.jsp">학생목록</a>
		
		<form action="./registerProc.jsp" method="post">
			<table>
				<tr>
					<td>학생번호</td>
					<td><input type="text" name="stdNo"/></td>
				</tr>
				<tr>
					<td>학생이름</td>
					<td><input type="text" name="stdName"/></td>
				</tr>
				<tr>
					<td>학생전화번호</td>
					<td><input type="text" name="stdHp"/></td>
				</tr>
				<tr>
					<td>학년</td>
					<td><input type="text" name="stdYear"/></td>
				</tr>
				<tr>
					<td>학생주소</td>
					<td><input type="text" name="stdAddress"/></td>
				</tr>
			</table>
		</form>
				
	</body>
</html>