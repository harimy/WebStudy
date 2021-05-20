<%@ page contentType="text/html; charset=UTF-8"%>
<%
	request.setCharacterEncoding("UTF-8");

	// 쿠키 생성
	Cookie c = new Cookie("cookie_test", "studyCookie");
	
	// 쿠키 설정
	c.setMaxAge(3600);
	//-- 이 시간동안 쿠키를 생존시켜둠
	
	// 쿠키 추가
	response.addCookie(c);
	//-- 요청에 응답을 하는 과정에서 쿠키를 추가해서 클라이언트에게 전달
	//   클라이언트는 쿠키를 받고 돌아가게 됨
	
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>TestSetCookie.jsp</title>
<link rel="stylesheet" type="text/css" href="css/main.css">
</head>
<body>

<div>
	<h1>쿠키 설정 및 추가</h1>
	<hr>
</div>

<div>
	<a href="TestGetCookie.jsp"><button type="button" class="btn">쿠키 정보 확인</button></a>
	<a href="TestRemoveCookie.jsp"><button type="button" class="btn">쿠키 정보 삭제</button></a>
</div>

</body>
</html>