<%@ page contentType="text/html; charset=UTF-8"%>
<%
	request.setCharacterEncoding("UTF-8");
	String name = request.getParameter("name");
	String tel = request.getParameter("tel");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Receive01_1.jsp</title>
<link rel="stylesheet" type="text/css" href="css/main.css">
</head>
<body>

<div>
	<p><%=name %>님, 회원가입이 완료되었습니다.</p>
	<p>회원님께서 등록하신 전화번호는 <%=tel %> 입니다.</p>
</div>

</body>
</html>