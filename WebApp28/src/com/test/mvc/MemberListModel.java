package com.test.mvc;

import java.io.UnsupportedEncodingException;
import java.sql.SQLException;
import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class MemberListModel
{
	public String process(HttpServletRequest request, HttpServletResponse response) throws ClassNotFoundException, SQLException, UnsupportedEncodingException
	{
		String result = "";
		
		request.setCharacterEncoding("UTF-8");
		
		MemberDAO dao = new MemberDAO();
		ArrayList<MemberDTO> lists = dao.lists();
		
		// 데이터 전달
		request.setAttribute("lists", lists);
		
		// View 선택
		result = "WEB-INF/view/MemberList.jsp";
		
		dao.close();
		
		return result;
	}
}
