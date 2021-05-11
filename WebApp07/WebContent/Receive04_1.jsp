<%@ page contentType="text/html; charset=UTF-8"%>
<%
	request.setCharacterEncoding("UTF-8");

	String id = request.getParameter("userId");
	String pw = request.getParameter("userPw");
	String name = request.getParameter("userName");
	String tel = request.getParameter("userTel");
	String g = request.getParameter("gender");
	String region = request.getParameter("region");
	String[] subject = request.getParameterValues("subject");
	
	String gender="";
	if(g.equals("F"))
		gender = g + "(여자)";
	else if(g.equals("M"))
		gender = g + "(남자)";
	else
		gender = "확인 불가";
	
	String subjects = "";
	if(subject != null)
	{
		for (String s : subject)
		{
			subjects += "[" + s + "]";
		}
	}
		
	
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Receive04_1.jsp</title>
<link rel="stylesheet" type="text/css" href="css/main.css">
</head>
<body>

<div>
	<h1>데이터 송수신 실습 04</h1>
	<hr>
</div>

<div>
	<h2>회원가입 완료</h2>
	<p>
		아이디 : <span><%=id %></span>
		비밀번호 : <span><%=pw %></span>
		이름 : <span><%=name %></span>
		전화번호 : <span><%=tel %></span>
	</p>
	
</div>

</body>
</html>