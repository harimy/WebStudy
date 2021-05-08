<%@ page contentType="text/html; charset=UTF-8"%>
<%
	// 스크립트 릿 영역
	// 내가 작성한 내용
	String d = request.getParameter("dan");

	String result="";
	int dan = 0;
	try
	{
		dan = Integer.parseInt(d);
		
		for(int i=1; i<10; i++)
		{
			result += dan + " * " + i + " = " + dan*i + "<br>";
		}
		
	}
	catch(Exception e)
	{
		System.out.println(e.toString());
		
		getServletContext().log("오류 : " + e.toString());
	}
	
	// 함께 작성한 내용
	// 이전 페이지로(Gugudan.jsp)부터 데이터 수신 → 스크립트 릿 영역
	// request 객체의 getParameter() 메소드 활용 → 이름(name) 식별자
	String danStr = request.getParameter("dan");
	
	int n=0;
	try
	{
		n = Integer.parseInt(danStr);
	}
	catch(Exception e)
	{
		System.out.println(e.toString());
		
		getServletContext().log("오류 : " + e.toString());
	}
	
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Gugudan_ok.jsp</title>
<link rel="stylesheet" type="text/css" href="css/main.css">
</head>
<body>

<div>
	<h1>JSP 데이터 송수신 실습</h1>
	<hr>
	<p>Gugudan.jsp → Gugudan_ok.jsp ●</p>
</div>

<!-- 내가 작성한 내용 동작 -->
<div>
	<h2>구구단<%=dan %> 단</h2>
	<%=result %>
</div>

<!-- html 주석문 -->
<%-- JSP 주석문 --%>

<%-- 
<%
	for(int i=1; i<=9; i++)
	{%>
		<%=n %> * <%=i %> = <%=(n*i) %><br>
	<%}
			
%>
--%>

<%
	for(int i=1; i<=9; i++)
	{
		out.print( n  + " * " + i + " = " + (n*i) + "<br>");
	}
%>


</body>
</html>