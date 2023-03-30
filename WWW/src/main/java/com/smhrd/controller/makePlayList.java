package com.smhrd.controller;

import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.Date;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.smhrd.model.communityDAO;
import com.smhrd.model.communityDTO;


@WebServlet("/makePlayList")
public class makePlayList extends HttpServlet {
	private static final long serialVersionUID = 1L;
       

	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
//		System.out.println("서버요청");
		
		String genre = request.getParameter("genre");
		String movies = request.getParameter("movies");
		
		System.out.println(genre);
		System.out.println(movies);
		
		
		communityDTO dto = new communityDTO();
		
		Date date = new Date();
		// date 객체는 형변환 없이도 바로 출력이 가능하다.
		System.out.println(date.toString());	
		// SimpleDateFormat 이용해 출력형식 지정
		SimpleDateFormat df = new SimpleDateFormat("yy-MM-dd");
//		System.out.println(df.format(date)); // format은 String 객체 반환, 
		
		
		dto.setC_content(movies);
		dto.setC_date(df.format(date));
		dto.setC_hashtag(genre);
		dto.setC_likes(0);
		dto.setUser_id("admin");
		
		communityDAO dao = new communityDAO();
		
		dao.sendCummunity(dto);
		
		
		
	}

}
