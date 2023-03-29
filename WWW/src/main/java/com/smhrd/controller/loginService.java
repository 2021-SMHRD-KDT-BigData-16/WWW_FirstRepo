package com.smhrd.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.smhrd.model.memberDAO;
import com.smhrd.model.memberDTO;


@WebServlet("/loginService")
public class loginService extends HttpServlet {
	private static final long serialVersionUID = 1L;
	
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		// 한글인코딩
		request.setCharacterEncoding("UTF-8");
		
		// 데이터불러오기
		String loginId = request.getParameter("loginId");
		String loginPw = request.getParameter("loginPw");
		
		// 데이터 이뿌게 묶기
		memberDTO dto = new memberDTO();
		dto.setUser_id(loginId);
		dto.setUser_pw(loginPw);
		
		// 로그인 기능 수행하기
		memberDAO dao = new memberDAO();
		memberDTO loginLogic = dao.login(dto);
		
		
		if (loginLogic != null) {
			
			HttpSession session = request.getSession();
			
			
			session.setAttribute("user", loginLogic);
			
			
			response.sendRedirect("first_window.html");
			
			System.out.println("로그인 성공");
		}else {
			System.out.println("로그인 실패");
		}
		
		
		
		
	}

}
