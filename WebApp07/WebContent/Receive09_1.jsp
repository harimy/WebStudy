<%@ page contentType="text/html; charset=UTF-8"%>
<%
	String danStr = request.getParameter("dan");
	
	int dan=0;
	try
	{
		dan = Integer.parseInt(danStr);
	}
	catch(Exception e)
	{
		System.out.println(e.toString());
	}
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Receive09_1.jsp</title>
<link rel="stylesheet" type="text/css" href="css/main.css">
</head>
<body>

<div>
	<h1>데이터 송수신 실습 09</h1>
	<hr>
</div>

<div>
	<h2>구구단 <%=dan %>단</h2>
	
	<%
		for(int i=1; i<=9; i++)
		{
			out.print(dan + " * " + i + " = " + (dan*i) + "<br>");
		}
	%>
</div>

</body>
</html>