package com.test.mvc;

import java.io.UnsupportedEncodingException;
import java.sql.SQLException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class MemberInsertModel
{
	public String process(HttpServletRequest request, HttpServletResponse response) throws UnsupportedEncodingException, ClassNotFoundException, SQLException
	{
		request.setCharacterEncoding("UTF-8");
		String result = "";
		
		
		// 데이터 수신 및 DTO 구성
		MemberDTO dto = new MemberDTO();
		dto.setId(request.getParameter("userId"));
		dto.setPw(request.getParameter("userPw"));
		dto.setName(request.getParameter("userName"));
		dto.setTel(request.getParameter("userTel"));
		dto.setEmail(request.getParameter("userEmail"));
		
		// insert 쿼리문 실행
		MemberDAO dao = new MemberDAO();
		int temp = dao.add(dto);
		
		// 값 넘겨주기
		request.setAttribute("lists", dao.lists());
		
		if(temp > 0)
			result = "WEB-INF/view/MemberInsert.jsp";
		
		dao.close();
		
		
		return result;
	}
}
