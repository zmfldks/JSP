<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>user6::modify</title>
	</head>
	<body>
		<h3>user6 수정</h3>
		<a href="/User/user6/list.do">user6 목록</a>
		<form action="/User/user6/modify.do" method="post">
			<table border="1">
				<tr>
					<td>아이디</td>
					<td><input type="text" name="uid" value="${vo.uid}" readonly></td>
				</tr>
				<tr>
					<td>이름</td>
					<td><input type="text" name="name" value="${vo.name}"></td>
				</tr>
				<tr>
					<td>생일</td>
					<td><input type="text" name="birth" value="${vo.birth}"></td>
				</tr>
				<tr>
					<td>성별</td>
					<td><input type="number" name="gender" value="${vo.gender}"></td>
				</tr>
				<tr>
					<td>나이</td>
					<td><input type="number" name="age" value="${vo.age}"></td>
				</tr>
				<tr>
					<td>주소</td>
					<td><input type="text" name="addr" value="${vo.addr}"></td>
				</tr>
				<tr>
					<td>휴대폰</td>
					<td><input type="text" name="hp" value="${vo.hp}"></td>
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