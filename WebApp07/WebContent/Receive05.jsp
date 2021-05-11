<%@ page contentType="text/html; charset=UTF-8"%>
<%
	// 이전 페이지(Send05.html)로 부터 데이터 수신
	
	String danStr = request.getParameter("dan");
	int dan = 0;
	String result = "";
	
	try
	{
		dan = Integer.parseInt(danStr);
		for(int i=1; i<=9; i++)
			result += String.format("%d * %d = %d<br>", dan, i, (dan*i));			
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
<title>SampleTest.jsp</title>
<link rel="stylesheet" type="text/css" href="css/main.css">
</head>
<body>

<div>
	<h1>데이터 송수신 실습 05</h1>
	<hr>
</div>

<div>
	<h2>구구단 출력</h2>
	<%=result %>
</div>

</body>
</html>