<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>2021. 9. 2.오후 4:54:16</title>
<style>
table {border-collapse: collapse; margin: 0 auto;}
table, th, td {border: 1px solid black;}
th, td {padding: 10px;}
</style>
</head>
<body>
<table>
	<tr>
		<th>아이디</th>
		<th>비밀번호</th>
		<th>이메일</th>
		<th>이름</th>
	</tr>
	<c:forEach items="${members}" var= "members">
	<tr>
		<td>${members.id}</td>
		<td>${members.pwd}</td>
		<td>${members.email}</td>
		<td>${members.name}</td>
	</tr>
	</c:forEach>
</table>
</body>
</html>