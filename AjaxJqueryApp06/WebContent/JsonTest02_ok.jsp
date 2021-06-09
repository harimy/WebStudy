<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
   	request.setCharacterEncoding("UTF-8");
   	String cp = request.getContextPath();
%>
<%
	// JsonTest02_ok.jsp
	
	String name = request.getParameter("name");
	String content = request.getParameter("content");
	
	String result = "";
	
	// JSON 데이터(배열)
	// [{"이름1":"값1", "이름2":"값2", "이름3":"값3"}, {"이름4":"값4", "이름5":"값5", "이름6":"값6"}]
	
	// {"num":"1", "name":"조은선1", "content":"내용1"}
	// {"num":"2", "name":"조은선2", "content":"내용2"}
	// {"num":"3", "name":"조은선3", "content":"내용3"}
	// {"num":"4", "name":"조은선4", "content":"내용4"}
	// {"num":"5", "name":"조은선5", "content":"내용5"}
	//-- 각각 별개의 요소인 상태
	
	// [ {"num":"1", "name":"조은선1", "content":"내용1"}
	// , {"num":"2", "name":"조은선2", "content":"내용2"}
	// , {"num":"3", "name":"조은선3", "content":"내용3"}
	// , {"num":"4", "name":"조은선4", "content":"내용4"}
	// , {"num":"5", "name":"조은선5", "content":"내용5"} ]
	//-- 배열로 만든 상태
	
	for(int n=1; n<=5; n++)	// 1 ~ 5
	{
		StringBuffer sb = new StringBuffer();
		
		sb.append("{\"num\":\"" + n + "\"");
		sb.append(",\"name\":\"" + name + "\"");
		sb.append(",\"content\":\"" + content + "\"},");	// check! `,`
		
		result += sb.toString();
		
	}

	result = result.substring(0, result.length()-1);	// 마지막 , 는 제거
	result = "[" + result + "]"; 						// [] 안에 넣어서 배열로 처리
	
	out.println(result);
	
%>