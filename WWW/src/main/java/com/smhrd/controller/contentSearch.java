package com.smhrd.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.Iterator;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.smhrd.model.contentDAO;
import com.smhrd.model.contentDTO;

@WebServlet("/contentSearch")
public class contentSearch extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void service(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// 1. 한글 인코딩 잡아주기
		request.setCharacterEncoding("UTF-8");
		int num = Integer.parseInt(request.getParameter("rows"));

		contentDTO dto = new contentDTO();
		contentDAO dao = new contentDAO();
		List<contentDTO> content_list = dao.search();
		if (content_list != null) {
			HttpSession session = request.getSession();
			session.setAttribute("contents", content_list);
			response.sendRedirect("main.jsp");

		}
	}
}
