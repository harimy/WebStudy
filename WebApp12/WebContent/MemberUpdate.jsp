<%@page import="com.test.MemberDTO"%>
<%@page import="com.test.MemberDAO"%>
<%@ page contentType="text/html; charset=UTF-8"%>
<%
	// MemberUpdate.jsp

	request.setCharacterEncoding("UTF-8");

	String sid = request.getParameter("sid");
	String uName = request.getParameter("uName");
	String uTel = request.getParameter("uTel");
	
	MemberDAO dao = new MemberDAO();
	
	try
	{
		dao.connection();
		
		MemberDTO dto = new MemberDTO();
		
		dto.setSid(sid);
		dto.setName(uName);
		dto.setTel(uTel);
		
		dao.modify(dto);
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
		catch(Exception e)
		{
			System.out.println(e.toString());			
		}
	}
	
	response.sendRedirect("MemberSelect.jsp");
%>