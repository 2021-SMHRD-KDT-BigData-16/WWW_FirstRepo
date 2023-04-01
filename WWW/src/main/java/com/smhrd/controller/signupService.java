package com.smhrd.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.text.SimpleDateFormat;
import java.util.Date;

import javax.script.ScriptContext;
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

	protected void service(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		Date date = new Date();
		// date 객체는 형변환 없이도 바로 출력이 가능하다.
		System.out.println(date.toString());

		// SimpleDateFormat 이용해 출력형식 지정
		SimpleDateFormat df = new SimpleDateFormat("yy-MM-dd");
		System.out.println(df.format(date)); // format은 String 객체 반환,

		request.setCharacterEncoding("UTF-8");
		response.setContentType("text/html; charset = UTF-8");
		PrintWriter out = response.getWriter();

		String user_id = request.getParameter("user_id");
		String user_pw = request.getParameter("user_pw");
		String user_nick = request.getParameter("user_nick");
		String user_gender = request.getParameter("user_gender");
		String user_birthdate[] = request.getParameterValues("user_birthdate");

//		String year = user_birthdate[0];
//		year = year.substring(2);
//		System.out.println(year);
//		String birthdate = year + "-" + user_birthdate[1] + "-" + user_birthdate[2];
//		System.out.println(birthdate);

		String birthdate = user_birthdate[0].substring(2) + "-" + user_birthdate[1] + "-" + user_birthdate[2];

		// String birthdate =
		// user_birthdate[0].replace("20","").replace("19","")+"-"+user_birthdate[1]+"-"+user_birthdate[2];
//		String test=user_birthdate.replace("20", "").replace("19","");

		System.out.println(user_id);
		System.out.println(user_pw);
		System.out.println(user_nick);
		System.out.println(user_gender);
//		System.out.println(user_birthdate[0]);
//		System.out.println(user_birthdate[1]);
//		System.out.println(user_birthdate[2]);
		System.out.println(birthdate);
//		

		memberDTO dto = new memberDTO();
		dto.setUser_id(user_id);
		dto.setUser_pw(user_pw);
		dto.setUser_nick(user_nick);
		dto.setUser_gender(user_gender);
		dto.setUser_birthdate(birthdate);
		dto.setUser_joindate(df.format(date));
		dto.setUser_type('U');

		memberDAO dao = new memberDAO();
		int cnt = dao.signup(dto);

		System.out.println("cnt : " + cnt);

		if (cnt > 0) {

			System.out.println("성공");


			out.println("<script>alert('회원가입이 완료되었습니다. 로그인 해주세요!'); location.href='login.html';</script>");
			// response.sendRedirect("login.html");
			out.close();

		} else {
			out.println("<script>alert('중복된 아이디가 있어요.! 다시 진행해 주세요.'); location.href='signup.html';</script>");
			// response.sendRedirect("login.html");
			out.close();
			
			System.out.println("실패");
//			response.sendRedirect("signup.html");
		}

	}

}
