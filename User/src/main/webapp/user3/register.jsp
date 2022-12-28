<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>user3::register</title>
	</head>
	<body>
		<h3>user3 등록</h3>
		<a href="/User/user3/list.do">user3 목록</a>
		<form action="/User/user3/register.do" method="post">
			<table border="1">
				<tr>
				 	<td>아이디</td>
				 	<td><input type="text" name="uid" placeholder="아이디 입력"></td>
				</tr>
				<tr>
				 	<td>이름</td>
				 	<td><input type="text" name="name" placeholder="이름 입력"></td>
				</tr>
				<tr>
				 	<td>휴대폰</td>
				 	<td><input type="text" name="hp" placeholder="휴대폰 입력"></td>
				</tr>
				<tr>
				 	<td>나이</td>
				 	<td><input type="number" name="age" placeholder="나이 입력"></td>
				</tr>
				<tr>
				 	<td colspan="2" align="right">
				 		<input type="submit" value="등록하기">
				 	</td>
				</tr>
			</table>
		</form>
	</body>
</html>