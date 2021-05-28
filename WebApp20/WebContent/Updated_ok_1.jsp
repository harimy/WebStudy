<%@page import="com.test.BoardDAO"%>
<%@page import="com.util.DBConn"%>
<%@page import="java.sql.Connection"%>
<%@ page contentType="text/html; charset=UTF-8"%>
<%
	request.setCharacterEncoding("UTF-8");
   String cp = request.getContextPath();
%>

<jsp:useBean id="dto" class="com.test.BoardDTO" scope="page"></jsp:useBean>
<jsp:setProperty property="*" name="dto"></jsp:setProperty>

<%
	// Updated_ok.jsp
	String subject = request.getParameter("subject");
	String name = request.getParameter("name");
	String content = request.getParameter("content");
	String email = request.getParameter("email");
	
	//int num = Integer.parseInt(request.getParameter("num"));
	String pageNum = request.getParameter("pageNum");
	
	Connection conn = DBConn.getConnection();
	BoardDAO dao = new BoardDAO(conn);
	
	//dto.setNum(num);
	dto.setSubject(subject);
	dto.setName(name);
	dto.setContent(content);
	
	dao.updateData(dto);
	
	DBConn.close();
	
	response.sendRedirect("List.jsp?pageNum=" + pageNum);
%>