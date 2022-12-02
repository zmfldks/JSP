<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>user4::register</title>
	</head>
	<body>
		<h3>user4 목록</h3>
		<a href="/Ch09/">처음으로</a>
		<a href="/Ch09/user4/list.do">user4 목록</a>
		
		<form action="/Ch09/user4/register.do" method="post">
			<table border="1">
				<tr>
					<td>이름</td>
					<td><input type="text" name="name" placeholder="이름을 입력하세요."></td>
				</tr>
				<tr>
					<td>성별</td>
					<td><input type="text" name="gender" placeholder="남자=1, 여자=2, 모름=3"></td>
				</tr>
				<tr>
					<td>나이</td>
					<td><input type="number" name="age" placeholder="나이를 입력하세요."></td>
				</tr>
				<tr>
					<td>주소</td>
					<td><input type="text" name="addr" placeholder="주소를 입력하세요."></td>
				</tr>
				<tr>
					<td colspan="2" align="right">
						<input type="submit" value="등록하기"/>
					</td>
				</tr>
			</table>
		</form>
	</body>
</html>