<%@ page contentType="text/html; charset=UTF-8"%>
<%
	request.setCharacterEncoding("UTF-8");
%>
<jsp:useBean id="ob" class="com.test.FriendDTO"/>
<jsp:setProperty property="*" name="ob"/>

<!-- 반복문 필요(다중 선택으로 넘어온 결과값 처리) -->
<%
	String str = "";
	if(ob.getUserIdeal() != null )
	{
		 for(String s : ob.getUserIdeal())
	         str += s + " ";
	}
	// 배열로 처리할 시 null 값에 대한 처리 필수!
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Friend_ok.jsp</title>
<link rel="stylesheet" type="text/css" href="css/main.css">
</head>
<body>

<div>
	<h1>작성된 내용 확인</h1>
	<hr>
</div>

<div>
	<h3>이름 : <%=ob.getUserName() %></h3>
	<h3>나이 : <%=ob.getUserAge() %></h3>
	<h3>성별 : <%=ob.getUserGender() %></h3>
	<h3>이상형 : <%=str %></h3>
</div>

</body>
</html>