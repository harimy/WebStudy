<%@ page contentType="text/html; charset=UTF-8"%>
<%
	// Redirect12.jsp
	
	// 데이터 수신
	String num1Str = request.getParameter("num1");
	String num2Str = request.getParameter("num2");
	String op = request.getParameter("calResult");
	
	String str = "";
	int num1 = 0;
	int num2 = 0;
	
	try
	{
		// 연산 처리
		
		num1 = Integer.parseInt(num1Str);
		num2 = Integer.parseInt(num2Str);
		
		if(op.equals("1"))
			str = String.format("%d", (num1+num2));
		else if(op.equals("2"))
			str = String.format("%d", (num1-num2));
		else if(op.equals("3"))
			str = String.format("%d", (num1*num2));
		else if(op.equals("4"))
			str = String.format(" %.1f", ((double)num1/num2));
		
	}
	catch(Exception e)
	{
		System.out.println(e.toString());
	}
	
	//request.setAttribute("result", str);
	//-- 여기서의 request는 여기까지만 존재하기 때문에 소용이 없음
	
	// check!
	// 결과 데이터 재전송 → sendRedirect() 메소드 사용
	// ※ response 객체의 주요 메소드 중 하나인
	//   『sendRedirect(String location)』
	//   : 지정된 URL(location)로 요청을 재전송한다. 
	response.sendRedirect("Receive12.jsp?num1=" + num1 
		+ "&num2=" + num2 + "&op=" + op + "&str=" + str);
	
%>