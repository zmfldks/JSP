<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>user3::modify</title>
	</head>
	<body>
		<h3>user3 수정</h3>
		<a href="/User/user3/list.do">user3 목록</a>
		<form action="/User/user3/modify.do" method="post">
		 	<table border="1">
		 		<tr>
		 			<td>아이디</td>
		 			<td><input type="text" name="uid" value="${vo.uid }"></td>
		 		</tr>
		 		<tr>
		 			<td>이름</td>
		 			<td><input type="text" name="name" value="${vo.name}"></td>
		 		</tr>
		 		<tr>
		 			<td>휴대폰</td>
		 			<td><input type="text" name="hp" value="${vo.hp}"></td>
		 		</tr>
		 		<tr>
		 			<td>나이</td>
		 			<td><input type="number" name="age" value="${vo.age}"></td>
		 		</tr>
		 		<tr>
		 			<td colspan="2" align="right">
		 				<input type="submit" value="수정하기">
		 			</td>
		 		</tr>
		 	</table>
		</form>
	</body>
</html>