<%@ page contentType="text/html; charset=UTF-8"%>
<%
	// 이전 페이지(Send03.html)로 부터 데이터 수신
	String num1Str = request.getParameter("num1");
	String num2Str = request.getParameter("num2");
	String op = request.getParameter("op");
	
	String result = "";
	int num1=0;
	int num2=0;
	
	try
	{
		num1 = Integer.parseInt(num1Str);
		num2 = Integer.parseInt(num2Str);
		
		if(op.equals("+"))
			result = String.valueOf(num1+num2);
		else if(op.equals("-"))
			result = String.valueOf(num1-num2);
		else if(op.equals("*"))
			result = String.valueOf(num1*num2);
		else if(op.equals("/"))
			//result = String.valueOf(num1/num2);
			result = String.valueOf((double)num1/num2);
		
	}
	catch(Exception e)
	{
		
	}
	

%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>SampleTest.jsp</title>
<link rel="stylesheet" type="text/css" href="css/main.css">
<style type = "text/css">
	span {color: blue; font-weight: : bold; font-size: 15pt;}
</style>
</head>
<body>

<div>
	<h1>데이터 송수신 실습 03</h1>
	<hr>
</div>

<div>
	<p>
		입력하신 <span><%=num1 %></span>과(와)
		<span><%=num2 %></span>의 연산결과는
		<span><%=result %></span>입니다.
	</p>
</div>

</body>
</html>