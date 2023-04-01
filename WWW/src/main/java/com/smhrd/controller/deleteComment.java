package com.smhrd.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.smhrd.model.commentDAO;
import com.smhrd.model.commentDTO;

@WebServlet("/deleteComment")
public class deleteComment extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void service(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		response.setContentType("text/html; charset=UTF-8");
		PrintWriter out = response.getWriter();
		int idx = Integer.parseInt(request.getParameter("data"));
		HttpSession session = request.getSession();
		System.out.println("삭제할 글 번호 : " + idx);

		commentDTO dto = new commentDTO();
		dto.setCmt_idx(idx);
		commentDAO dao = new commentDAO();
		int row = dao.deleteComment(dto);
		if (row > 0) {
			System.out.println("댓글 삭제 성공");
		} else {
			System.out.println("댓글 삭제 실패");
		}

		ArrayList<commentDTO> cm_list = (ArrayList) dao.selectAll();
		if (cm_list != null) {
			System.out.println("댓글 조회 성공");
		} else {
			System.out.println("댓글 조회 실패");
		}
		session.setAttribute("comment", cm_list);
		response.sendRedirect("community_1.jsp");

	}

}
