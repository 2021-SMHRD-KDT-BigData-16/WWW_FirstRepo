package com.smhrd.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;


@WebServlet("/logoutService")
public class logoutService extends HttpServlet {
	private static final long serialVersionUID = 1L;


	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HttpSession session = request.getSession();
		
		// session 안에 들어있는 user정보 삭제
		try {
			session.removeAttribute("user");
			
			response.sendRedirect("first_window.html");
			
			System.out.println("로그아웃 성공");
			
		} catch (Exception e) {
			// TODO: handle exception
			System.out.println("로그아웃 실패");
		}
		
		
	}

}
