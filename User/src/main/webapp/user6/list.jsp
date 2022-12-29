<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>user6::list</title>
	</head>
	<body>
		<h3>user6 목록</h3>
		<a href="/User/user6/register.do">등록하기</a>
		<table border="1">
			<tr>
				<th>아이디</th>
				<th>이름</th>
				<th>생일</th>
				<th>성별</th>
				<th>나이</th>
				<th>주소</th>
				<th>휴대폰</th>
				<th>관리</th>
			</tr>
			<c:forEach var="user" items="${users}">
				<tr>
					<td>${user.uid}</td> 
					<td>${user.name}</td> 
					<td>${user.birth}</td>
					<c:choose>
					<c:when test="${user.gender == 0}"> 
					<td>모름</td>
					</c:when>
					<c:when test="${user.gender == 1}"> 
					<td>남자</td>
					</c:when>
					<c:when test="${user.gender == 2}"> 
					<td>여자</td>
					</c:when>
					<c:when test="${user.gender == 3}"> 
					<td>비공개</td>
					</c:when>
					</c:choose> 
					<td>${user.age}</td> 
					<td>${user.addr}</td> 
					<td>${user.hp}</td> 
					<td>
						<a href="/User/user6/modify.do?uid=${user.uid}">수정</a>
						<a href="/User/user6/delete.do?uid=${user.uid}">삭제</a>
					</td> 
				</tr>
			</c:forEach>
		</table>
	</body>
</html>