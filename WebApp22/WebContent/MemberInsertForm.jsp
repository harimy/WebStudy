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
<title>MemberInsertForm.jsp</title>
<link rel="stylesheet" type="text/css" href="<%=cp%>/css/main.css">
</head>
<body>

<div>
	<h1>JSTL 코어(Core) 문제</h1>
	<h2>회원 정보 입력</h2>
	<hr>
</div>

<div>
	<form action="MemberInsert.jsp" method="post">
		<table class="table">
			<tr>
				<th>이름</th>
				<td>
					<!-- 
					<input type="text">
					<input type="text">
					<input type="text">
					<input type="text">
					<input type="text">
				    -->
				   	<c:forEach var="a" begin="1" end="5" step="1">
				   		<input type="text" name="name${a }">
				    </c:forEach>
				</td>
			</tr>
			<tr>
				<th>전화번호</th>
				<td>
					<!-- 
					<input type="text">
					<input type="text">
					<input type="text">
					<input type="text">
					<input type="text">
					-->
					<c:forEach var="a" begin="1" end="5" step="1">
				   		<input type="text" name="tel${a }"> 
				    </c:forEach>
				</td>
			</tr>
			<tr>
				<th>주소</th>
				<td>
					<!-- 
					<input type="text">
					<input type="text">
					<input type="text">
					<input type="text">
					<input type="text">
					-->
					<c:forEach var="a" begin="1" end="5" step="1">
				   		<input type="text" name="addr${a }"> 
				    </c:forEach>
				</td>
			</tr>
			
			<tr>
				<td colspan="2">
					<button type="submit" style="width: 100%" class="btn">입력</button>
				</td>
			</tr>
			
		</table> 
	</form>
</div>


</body>
</html>