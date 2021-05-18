<%@ page contentType="text/html; charset=UTF-8"%>
<%
	request.setCharacterEncoding("UTF-8");

	String userId = request.getParameter("userId");
	String userPwd = request.getParameter("userPwd");
	
	//String userName = request.getParameter("userName");
	//String userBirth = request.getParameter("userBirth");
	//-- hidden 태그로 가져온 경우 getParameter 로 값을 얻어옴 
	
	String userName = (String)session.getAttribute("userName");
	String userBirth = (String)session.getAttribute("userBirth");
	
	session.removeAttribute("userName");
	session.removeAttribute("userBirth");
	
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>TestSession03.jsp</title>
<link rel="stylesheet" type="text/css" href="css/main.css">
</head>
<body>

<div>
	<h1>받는 페이지</h1>
	<hr>
</div>

<div>
	<h2>이름 : <%=userName %></h2>
	<h2>생일 : <%=userBirth %></h2>
	<h2>아이디 : <%=userId %></h2>
	<h2>패스워드 : <%=userPwd %></h2>
</div>

</body>
</html>