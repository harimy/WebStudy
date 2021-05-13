<%@ page contentType="text/html; charset=UTF-8"%>
<%
	String num1 = request.getParameter("num1");
	String num2 = request.getParameter("num2");
	String op = request.getParameter("op");
	String result = request.getParameter("result");
	
	if(op.equals("1"))
		op = "+";
	else if(op.equals("2"))
		op = "-";
	else if(op.equals("3"))
		op = "*";
	else if(op.equals("4"))
		op = "/";

	String str = String.format("%s %s %s = %s", num1, op, num2, result);
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Receive12_1.jsp</title>
<link rel="stylesheet" type="text/css" href="css/main.css">
</head>
<body>

<div>
	<h1>데이터 송수신 실습 12</h1>
	<hr>
</div>

<div>
	<h2>최종 수신 페이지(Receive12_1.jsp)</h2>
	<h3>연산 결과 : <%=str %></h3>
</div>

</body>
</html>