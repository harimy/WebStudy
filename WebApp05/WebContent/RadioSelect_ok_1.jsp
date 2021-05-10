<%@ page contentType="text/html; charset=UTF-8"%>
<%
	request.setCharacterEncoding("UTF-8");

	String name = request.getParameter("name");
	String g = request.getParameter("gender");
	String major = request.getParameter("major");
	String[] hs = request.getParameterValues("hobby");
	
	String gender = "";
	
	if (g.equals("F"))
		gender = "여자";
	else
		gender = "남자";
	
	String hobby = "";
	
	if (hs != null)
	{
		for (String h : hs)
		{
			hobby += "[" + h + "] ";
		}
	}
	
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>RadioSelect_ok.jsp</title>
<link rel="stylesheet" type="text/css" href="css/main.css">
</head>
<body>

<div>
	<h1>JSP 데이터 송수신 실습</h1>
	<hr>
	<p>RadioSelect.jsp → RadioSelect_ok.jsp ●</p>
</div>

<div>
	<h2>수신 데이터</h2>
	
	<h3>이름 : <%=name %></h3>
	<h3>성별 : <%=gender %></h3>
	<h3>전공 : <%=major %></h3>
	<h3>취미 : <%=hobby %></h3>
</div>

</body>
</html>