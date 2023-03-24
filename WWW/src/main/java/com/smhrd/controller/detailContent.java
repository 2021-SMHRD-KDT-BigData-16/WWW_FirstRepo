package com.smhrd.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;


@WebServlet("/detailContent")
public class detailContent extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		// 한글 인코딩
		
		request.setCharacterEncoding("UTF-8");
		
		String data = request.getParameter("data");
		
		HttpSession session = request.getSession();
		session.setAttribute("data", data);
		response.sendRedirect("detailPage.jsp");
	}

}
