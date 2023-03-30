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
import com.smhrd.model.communityDAO;
import com.smhrd.model.communityDTO;
import com.smhrd.model.memberDTO;


@WebServlet("/likeDown")
public class likeDown extends HttpServlet {
	private static final long serialVersionUID = 1L;


	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HttpSession session = request.getSession();
		memberDTO user = (memberDTO)session.getAttribute("user");
		int row = Integer.parseInt(request.getParameter("data"));
		
		
		boardDAO dao = new boardDAO();
		communityDTO c_dto = new communityDTO();
		c_dto.setC_idx(row);
		communityDAO c_dao = new communityDAO();
		int likeResult = c_dao.Downlike(c_dto);
		
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
		ArrayList<communityDTO> comm_list = c_dao.selectAll();
		if (comm_list != null) {
			//dao의 search 메소드를 사용하여 결과 값이 반환된 경우
			// 세션에 contents라는 이름으로 불러온 리스트 들고오기
			session.setAttribute("community", comm_list);
			// 반복해서 세션에 데이터를 넘긴 후에 main.jsp로 이동한다.
		}
		response.sendRedirect("community_1.jsp");
	}

}
