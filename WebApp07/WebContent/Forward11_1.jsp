<%@ page contentType="text/html; charset=UTF-8"%>
<%
	String str1 = request.getParameter("num1");
	String str2 = request.getParameter("num2");
	String opStr = request.getParameter("calResult");
	
	int num1=0, num2=0, op=0;
	String result="";
	try
	{
		num1 = Integer.parseInt(str1);
		num2 = Integer.parseInt(str2);
		op = Integer.parseInt(opStr);	
		
		if(op==1)
			result += num1 + " + " + num2 + " = " + (num1+num2);
		else if(op==2)
			result += num1 + " - " + num2 + " = " + (num1-num2);
		else if(op==3)
			result += num1 + " * " + num2 + " = " + (num1*num2);
		else if(op==4)
			result += num1 + " / " + num2 + " = " + ((double)num1 / num2);
		else 
			result += "잘못된 연산자";	
		
	}
	catch(Exception e)
	{
		System.out.println(e.toString());
	}
	
	request.setAttribute("result", result);
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Forward11_1.jsp</title>
<link rel="stylesheet" type="text/css" href="css/main.css">
</head>
<body>

<div>
	<h1>데이터 송수신 실습 10</h1>
	<hr>
</div>

<div>
	<h2>포워드</h2>
	<jsp:forward page="Receive11_1.jsp"></jsp:forward>
</div>

</body>
</html>