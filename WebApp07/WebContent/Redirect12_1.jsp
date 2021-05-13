<%@ page contentType="text/html; charset=UTF-8"%>
<%
	String num1Str = request.getParameter("num1");
	String num2Str = request.getParameter("num2");
	String opStr = request.getParameter("calResult");
	
	int num1=0, num2=0, op=0;
	String result = "";
	try
	{
		num1 = Integer.parseInt(num1Str);
		num2 = Integer.parseInt(num2Str);
		op = Integer.parseInt(opStr);
		
		/*
		if(op==1)
			result = String.format("%d + %d = %d", num1, num2, (num1+num2));
		else if(op==2)
			result = String.format("%d - %d = %d", num1, num2, (num1-num2));
		else if(op==3)
			result = String.format("%d * %d = %d", num1, num2, (num1*num2));
		else if(op==4)
			result = String.format("%d / %d = %.1f", num1, num2, ((double)num1/num2));
		*/
		//-- result 에 "%d + %d = %d" 방식으로는 보낼 수 없다.
		//   주소에 + 라는 값이 들어가게 되면 문자열로 인식하여 
		//   문자와 문자의 결합을 시키는 기능을 하기 때문에 
		//   이런식으로는 Receive12_1 페이지에 제대로 전달할 수 없음
		
		if(op==1)
			result = String.format("%d", (num1+num2));
		else if(op==2)
			result = String.format("%d", (num1-num2));
		else if(op==3)
			result = String.format("%d", (num1*num2));
		else if(op==4)
			result = String.format("%.1f", ((double)num1/num2));
	}
	catch(Exception e)
	{
		System.out.println(e.toString());
	}
	
	//RequestDispatcher dispatcher = request.getRequestDispatcher("Receive12_1.jsp");
	//dispatcher.forward(request,response);

	response.sendRedirect("Receive12_1.jsp?num1=" + num1 + "&num2=" + num2 
			+ "&op=" + op + "&result=" + result);
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Redirect12_1.jsp</title>
<link rel="stylesheet" type="text/css" href="css/main.css">
</head>
<body>

<div>
	<h1>데이터 송수신 실습 12</h1>
	<hr>
</div>

<div>
	<h2>작은주제</h2>
	<form>
	</form>
</div>

</body>
</html>