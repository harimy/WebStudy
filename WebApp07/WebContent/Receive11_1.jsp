<%@ page contentType="text/html; charset=UTF-8"%>
<%
	String result = (String)request.getAttribute("result");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Receive11_1.jsp</title>
<link rel="stylesheet" type="text/css" href="css/main.css">
</head>
<body>

<div>
	<h1>데이터 송수신 실습 11</h1>
	<hr>
</div>

<div>
	<h2>최종 수신 페이지(Receive11_1.jsp)</h2>
	<p><%=result %></p>
</div>

</body>
</html>