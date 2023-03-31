package com.smhrd.controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.smhrd.model.boardDAO;
import com.smhrd.model.boardDTO;
import com.smhrd.model.commentDAO;
import com.smhrd.model.commentDTO;
import com.smhrd.model.memberDTO;


@WebServlet("/detailPlayList")
public class detailPlayList extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		System.out.println(request.getRequestURI());
		String data = request.getParameter("data");
		System.out.println("플레이 리스트 번호 : "+ data);
		
		//좋아요 기능 구현
		boardDAO dao = new boardDAO();
		boardDTO dto = new boardDTO();
		HttpSession session = request.getSession();
		memberDTO user = (memberDTO)session.getAttribute("user");
		
		dto.setUser_id(user.getUser_id());
		dto.setNo_number(Integer.parseInt(data));
		int row =dao.checkLike(dto);
		commentDAO cm_dao = new commentDAO();
		ArrayList<commentDTO> cm_list = (ArrayList) cm_dao.selectAll();
		session.setAttribute("comment", cm_list);
		session.setAttribute("playIdx", data);
		session.setAttribute("likeCheck", row);
		response.sendRedirect("community_1.jsp");
		}

}
