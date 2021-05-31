/*===================================
   MemberListController.java
===================================*/

package com.test.mvc;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class MemberListController extends HttpServlet
{
	private static final long serialVersionUID = 1L;

	@Override
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException
	{
		doGetPost(request, response);
	}

	@Override
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException
	{
		doGetPost(request, response);
	}
	
	protected void doGetPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException
	{
		request.setCharacterEncoding("UTF-8");
		
		try
		{
			// Model 객체 연결 (업무로직 처리, View 정보 얻어내기)
			MemberListModel model = new MemberListModel();
			String view = model.process(request, response);
			
			// View 객체 연결 
			RequestDispatcher rd = request.getRequestDispatcher(view);
			rd.forward(request, response);
		}
		catch(Exception e)
		{
			System.out.println(e.toString());
		}
		
	}

	
}
