<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
   	request.setCharacterEncoding("UTF-8");
   	String cp = request.getContextPath();
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>MemberList.jsp</title>
<link rel="stylesheet" type="text/css" href="<%=cp %>/css/main.css">
<style type="text/css">
	td {text-align: center;}
</style>
</head>
<body>

<div>
	<h1>MemberList 페이지</h1>
	<hr>
</div>

<div>
	<!-- 컨트롤러로 부터 수신한 결과 -->
	<table class="table">
		<tr>
			<th>ID</th>
			<th>PW</th>
			<th>NAME</th>
			<th>TEL</th>
			<th>EMAIL</th>
		</tr>
		<c:forEach var="i" items="${lists }">
		<tr>
			<td>${i.id}</td>
			<td>${i.pw}</td>
			<td>${i.name}</td>
			<td>${i.tel}</td>
			<td>${i.email}</td>
		</tr>
		</c:forEach>
	</table>
</div>

<div>
	<a href="insertform"><button type="submit">입력하기</button>
</div>
		


</body>
</html>