<%@page import="net.sf.json.JSONObject"%>
<%@page import="net.sf.json.JSONArray"%>
<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
   	request.setCharacterEncoding("UTF-8");
   	String cp = request.getContextPath();
%>
<%
	// JsonTest04_ok.jsp
	
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
	
	/*
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
	*/
	
	JSONArray jsonArray = new JSONArray();
	
	for(int n=1; n<=5; n++)	// 1 ~ 5
	{
		JSONObject jsonObject = new JSONObject();
		jsonObject.put("num", n);
		jsonObject.put("name", name+n);
		jsonObject.put("content", content+n);
		
		jsonArray.add(jsonObject);
	}
	
	// 테스트 	
	System.out.println(jsonArray.toString());
	//--==> [{"num":1,"name":"이하림1","content":"내용 확인1"},{"num":2,"name":"이하림2","content":"내용 확인2"},{"num":3,"name":"이하림3","content":"내용 확인3"},{"num":4,"name":"이하림4","content":"내용 확인4"},{"num":5,"name":"이하림5","content":"내용 확인5"}]
	
	out.println(jsonArray.toString());
	// json 으로 넘겨줄 때 html 코드가 남아있으면 
	// 기존 html 코드에 out 으로 전달하는 내용이 붙어서 전송되기 때문에
	// json 포맷이라고 인식할 수 없어서 에러가 발생함
%>