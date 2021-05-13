<%@page import="java.sql.Statement"%>
<%@page import="com.util.DBConn"%>
<%@page import="java.sql.Connection"%>
<%@ page contentType="text/html; charset=UTF-8"%>
<%
	// 한글 인코딩 처리
	request.setCharacterEncoding("UTF-8");
	
	// 데이터 수신
	String uName = request.getParameter("userName");
	String korStr = request.getParameter("kor");
	String engStr = request.getParameter("eng");
	String matStr = request.getParameter("mat");
	
	int kor=0, eng=0, mat=0;
	
	try
	{
		kor = Integer.parseInt(korStr);
		eng = Integer.parseInt(engStr);
		mat = Integer.parseInt(matStr);
		
		// 데이터베이스 연결
		Connection conn = DBConn.getConnection();
		
		// 쿼리문 준비
		String sql = String.format("INSERT INTO TBL_SCORE(SID, NAME, KOR, ENG, MAT)"
						+ " VALUES(SCORESEQ.NEXTVAL, '%s', %d, %d, %d)"
						, uName, kor, eng, mat);
		
		// 작업 객체 생성 및 쿼리문 실행
		Statement stmt = conn.createStatement();
		int result = stmt.executeUpdate(sql);
		
		if (result<1)
			response.sendRedirect("ErrorPage.jsp");
		else
			response.sendRedirect("ScoreList.jsp");
		
	}
	catch(Exception e)
	{
		System.out.println(e.toString());
	}	
	
%>
