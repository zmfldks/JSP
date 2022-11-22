<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<%
	try{
		
	}catch(Exception e){
		e.printStackTrace();
	}

%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>list</title>
	</head>
	<body>
		<h3>user2목록</h3>
		<a href="./register.jsp">user2등록</a>
		
		<table border="1">
			<tr>
				<th>아이디</th>
				<th>이름</th>
				<th>휴대폰</th>
				<th>나이</th>
				<th>관리</th>
			</tr>
			<tr>
				<td>1</td>
				<td>2</td>
				<td>3</td>
				<td>4</td>
				<td>
					<a href="./modift.jsp">수정</a>
					<a href="./delete.jsp">삭제</a>
				</td>
			</tr>
		</table>
	</body>
</html>