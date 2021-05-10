<%@ page contentType="text/html; charset=UTF-8"%>
<%
	String su1Str = request.getParameter("su1");
	String su2Str = request.getParameter("su2");
	
	int su1 = Integer.parseInt(su1Str);
	int su2 = Integer.parseInt(su2Str);
	
	int n = 1;
	
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Table_ok.jsp</title>
<link rel="stylesheet" type="text/css" href="css/main.css">
</head>
<body>

<div>
	<h1>JSP 데이터 송수신 실습</h1>
	<hr>
	<p>Table.jsp → Table_ok.jsp ●</p>
</div>

<table border="1">
	<%
	for(int i=1; i<=su2; i++)
	{
	%>
		<tr>
		<%
			for(int j=1; j<=su1; j++, n++)
			{
		%>
			<td><%out.print(n); %>
			</td>
		<%
			}
		%>
		</tr>
	<% 
	}
	%>	
</table>

</body>
</html>