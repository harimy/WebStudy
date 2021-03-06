<%@page import="com.test.MemberDTO"%>
<%@page import="com.test.MemberDAO"%>
<%@ page contentType="text/html; charset=UTF-8"%>
<%
	// MemberInsert.jsp
	//-- 데이터 입력 액션 처리 페이지
	
	request.setCharacterEncoding("UTF-8");
	
	String userName = request.getParameter("userName");
	String userTel = request.getParameter("userTel");
	
	MemberDAO dao = null;
	
	try
	{
		dao = new MemberDAO();
		
		// MemberDTO 구성 
		MemberDTO member = new MemberDTO();
		member.setName(userName);
		member.setTel(userTel);
		
		dao.add(member);
	}
	catch(Exception e)
	{
		System.out.println(e.toString());
	}
	finally
	{
		try
		{
			dao.close();
		}
		catch(Exception e2)
		{
			System.out.println(e2.toString());
		}
	}
	
	// 클라이언트가 요청해야 할 URL 전달
	response.sendRedirect("MemberList.jsp");

%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>SampleTest.jsp</title>
<link rel="stylesheet" type="text/css" href="css/main.css">
</head>
<body>

<div>
	<h1>큰주제</h1>
	<hr>
</div>

<div>
	<h2>작은주제</h2>
	<form>
	</form>
</div>

</body>
</html>