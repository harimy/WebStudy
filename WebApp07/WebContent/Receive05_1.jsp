<%@ page contentType="text/html; charset=UTF-8"%>
<%
	String sDan = request.getParameter("dan");
	
	int dan = Integer.parseInt(sDan);
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Receive05_1.jsp</title>
<link rel="stylesheet" type="text/css" href="css/main.css">
</head>
<body>

<div>
	<h1>데이터 송수신 실습 05</h1>
	<hr>
</div>

<div>
	<h2>구구단 <%=dan %>단 출력</h2>
	<%
		for(int i=1; i<=9; i++)
		{
			out.print(dan + " * " + i + " = " + (dan * i)+ "<br>");
		}
	%>
</div>

</body>
</html>