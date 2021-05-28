<%@page import="java.util.ArrayList"%>
<%@page import="java.util.List"%>
<%@page import="com.test.core.MemberDTO"%>
<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
   	request.setCharacterEncoding("UTF-8");
   	String cp = request.getContextPath();
%>
<%
	// MemberInsert.jsp
	List<MemberDTO> lists = new ArrayList<MemberDTO>();
	MemberDTO dto = null;

	for(int i=1; i<=5; i++)
	{
		String name = request.getParameter("name"+i);
		String tel = request.getParameter("tel"+i);
		String addr = request.getParameter("addr"+i);
		
		// 이름, 번호, 주소 모두 빈 값일 때는 행이 생기지 않도록 처리
		if(name=="" && tel=="" && addr=="")
			continue;
		
		dto = new MemberDTO(name, tel, addr);
		lists.add(dto);
		
	}
	
	request.setAttribute("lists", lists);
	
	// jsp 액션 태그 대신에 request Dispatcher 로 포워딩하는 것도 가능
	
%>

<jsp:forward page="MemberList.jsp"></jsp:forward>
