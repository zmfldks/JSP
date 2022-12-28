<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>user4::register</title>
	</head>
	<body>
		<h3>user4 등록</h3>
		<a href="/User/user4/list.do">user4 목록</a>
		<form action="/User/user4/register.do" method="post">
			<table border="1">
				<tr>
					<td>이름</td>
					<td><input type="text" name="name" placeholder="이름 입력"></td>
				</tr>
				<tr>
					<td>성별</td>
					<td><input type="number" name="gender" placeholder="남자=1, 여자=2, 비공개=3"></td>
				</tr>
				<tr>
					<td>나이</td>
					<td><input type="number" name="age" placeholder="나이 입력"></td>
				</tr>
				<tr>
					<td>주소</td>
					<td><input type="text" name="addr" placeholder="주소 입력"></td>
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