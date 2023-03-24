package com.smhrd.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.smhrd.model.communityDAO;
import com.smhrd.model.communityDTO;

@WebServlet("/communitySerach")
public class communitySearch extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void service(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// 1. 한글 인코딩 잡아주기
		communityDTO dto = new communityDTO();
		communityDAO dao = new communityDAO();
		List<communityDTO> list = dao.selectAll();
		if (list != null) {
			HttpSession session = request.getSession();
			session.setAttribute("community", list);
			response.sendRedirect("detailContent");
		}else {
			response.sendRedirect("main.jsp");
		}
	}
}
