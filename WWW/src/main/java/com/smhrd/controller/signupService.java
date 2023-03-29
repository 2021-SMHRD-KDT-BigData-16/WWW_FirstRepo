package com.smhrd.controller;

import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.Date;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.smhrd.model.memberDAO;
import com.smhrd.model.memberDTO;


@WebServlet("/signupService")
public class signupService extends HttpServlet {
	private static final long serialVersionUID = 1L;

	
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		Date date = new Date();
		// date 객체는 형변환 없이도 바로 출력이 가능하다.
		System.out.println(date.toString());	
		
		// SimpleDateFormat 이용해 출력형식 지정
		SimpleDateFormat df = new SimpleDateFormat("yy-MM-dd");
		System.out.println(df.format(date)); // format은 String 객체 반환, 
		
		
		
		
		request.setCharacterEncoding("UTF-8");
//		response.setContentType("text/html; charset = UTF-8");
		
		String user_id = request.getParameter("user_id");
		String user_pw = request.getParameter("user_pw");
		String user_nick = request.getParameter("user_nick");
		String user_gender = request.getParameter("user_gender");
		String user_birthdate = request.getParameter("user_birthdate");
		String test=user_birthdate.replace("20", "").replace("19","").replace("21","").replace("22","");
		
		
		System.out.println(user_id);
		System.out.println(user_pw);
		System.out.println(user_nick);
		System.out.println(user_gender);
		System.out.println(test);
		

		memberDTO dto = new memberDTO();
		dto.setUser_id(user_id);
		dto.setUser_pw(user_pw);
		dto.setUser_nick(user_nick);
		dto.setUser_gender(user_gender);
		dto.setUser_birthdate(test);
		dto.setUser_joindate(df.format(date));
		dto.setUser_type('U');
		
		
		memberDAO dao = new memberDAO();
		int cnt = dao.signup(dto);
		
		System.out.println("cnt : " + cnt);
		
		if (cnt > 0) {
			System.out.println("성공");
			response.sendRedirect("first_window.html");
		
		}else {
			System.out.println("실패");
			response.sendRedirect("signup.html");
		}
		
		
		
		
		
		
		
		
		
	}

}
