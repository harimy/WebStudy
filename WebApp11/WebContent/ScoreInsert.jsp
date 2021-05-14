<%@page import="com.test.ScoreDTO"%>
<%@page import="com.test.ScoreDAO"%>
<%@page import="java.sql.Statement"%>
<%@page import="com.util.DBConn"%>
<%@page import="java.sql.Connection"%>
<%@ page contentType="text/html; charset=UTF-8"%>
<%
	//ScoreInsert.jsp

	// 한글 깨짐 방지 처리
	request.setCharacterEncoding("UTF-8");
	
	// 데이터 수신 	
	String name = request.getParameter("userName");
	String korStr = request.getParameter("scoreKor");
	String engStr = request.getParameter("scoreEng");
	String matStr = request.getParameter("scoreMat");
	
	int kor=0, eng=0, mat=0;
	
	ScoreDAO dao = null;
	
	try
	{
		kor = Integer.parseInt(korStr);
		eng = Integer.parseInt(engStr);
		mat = Integer.parseInt(matStr);
		
		dao = new ScoreDAO();
		
		// ScoreDTO 구성
		ScoreDTO dto = new ScoreDTO();
		dto.setName(name);
		dto.setKor(kor);
		dto.setEng(eng);
		dto.setMat(mat);
		
		dao.add(dto);
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
	
	response.sendRedirect("ScoreList.jsp");
%>