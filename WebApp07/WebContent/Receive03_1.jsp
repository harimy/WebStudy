<%@ page contentType="text/html; charset=UTF-8"%>
<%
	request.setCharacterEncoding("UTF-8");	

	String s1 = request.getParameter("n1");
	String s2 = request.getParameter("n2");
	String calc = request.getParameter("calc");
	
	int n1=0, n2=0;
	n1 = Integer.parseInt(s1);
	n2 = Integer.parseInt(s2);
	
	String result="";
	if(calc.equals("더하기"))
		result = String.valueOf(n1 + n2);
	else if(calc.equals("빼기"))
		result = String.valueOf(n1 - n2);
	else if(calc.equals("곱하기"))
		result = String.valueOf(n1 * n2);
	else if(calc.equals("나누기"))
		result = String.format("%.1f", (double)n1 / n2);		
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Receive03_1.jsp</title>
<link rel="stylesheet" type="text/css" href="css/main.css">
</head>
<body>

<div>
   <h1>데이터 송수신 실습 02</h1>
   <hr>
</div>

<div>
	<span>입력하신 </span><%=n1 %><span>와 </span><%=n2 %><span>의 연산 결과는 
	</span><%=result %><span> 입니다.</span>
</div>

</body>
</html>