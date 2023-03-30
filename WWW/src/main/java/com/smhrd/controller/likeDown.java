package com.smhrd.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.smhrd.model.boardDAO;
import com.smhrd.model.boardDTO;
import com.smhrd.model.memberDTO;


@WebServlet("/likeDown")
public class likeDown extends HttpServlet {
	private static final long serialVersionUID = 1L;


	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HttpSession session = request.getSession();
		memberDTO user = (memberDTO)session.getAttribute("user");
		int row = Integer.parseInt(request.getParameter("data"));
		
		
		boardDAO dao = new boardDAO();
		
		System.out.println(user.getUser_nick());
		System.out.println(row);
		boardDTO dto = new boardDTO(row, user.getUser_id());
		System.out.println(dto.getNo_number());
		System.out.println(dto.getUser_id());
		int result = dao.likeDown(dto);
		System.out.println(result);
		if(result>0) {
			System.out.println("DB 저장 성공");			
		}else {
			System.out.println("DB 저장 실패");
		}
		int row2 = dao.checkLike(dto);
		session.setAttribute("likeCheck", row2);
		response.sendRedirect("community_1.jsp");
	}

}
