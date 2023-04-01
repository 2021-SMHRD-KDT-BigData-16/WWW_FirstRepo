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

import com.smhrd.model.boardDAO;
import com.smhrd.model.boardDTO;
import com.smhrd.model.communityDAO;
import com.smhrd.model.communityDTO;
import com.smhrd.model.memberDTO;


@WebServlet("/likeUp")
public class likeUp extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HttpSession session = request.getSession();
		memberDTO user = (memberDTO)session.getAttribute("user");
		int row = Integer.parseInt(request.getParameter("data"));
		
		response.setContentType("text/html; charset=UTF-8");
		PrintWriter out = response.getWriter();
		
		boardDAO dao = new boardDAO();
		communityDTO c_dto = new communityDTO();
		c_dto.setC_idx(row);
		communityDAO c_dao = new communityDAO();
		int likeResult = c_dao.Uplike(c_dto);
		
		
		System.out.println(user.getUser_nick());
		System.out.println(row);
		boardDTO dto = new boardDTO(row, user.getUser_id());
		System.out.println(dto.getNo_number());
		System.out.println(dto.getUser_id());
		int result = dao.likeUp(dto);
		System.out.println(result);
		if(result>0) {
			System.out.println("DB 저장 성공");
			session.setAttribute("like", 1);			
		}else {
			System.out.println("DB 저장 실패");
			session.setAttribute("like", 0);
		}
		int row2 = dao.checkLike(dto);
		if(likeResult>0) {
			System.out.println("community 저장 성공");
			ArrayList<communityDTO> comm_list = c_dao.selectAll();
		}else {
			System.out.println("community 저장 실패");
		}
		session.setAttribute("likeCheck", row2);
		ArrayList<communityDTO> comm_list = c_dao.selectAll();
		session.setAttribute("community", comm_list);
		response.sendRedirect("community_1.jsp");
	}

}
