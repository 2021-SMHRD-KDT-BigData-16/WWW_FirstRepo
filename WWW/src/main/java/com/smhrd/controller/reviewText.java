package com.smhrd.controller;

import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.smhrd.model.memberDTO;
import com.smhrd.model.reviewDAO;
import com.smhrd.model.reviewDTO;


@WebServlet("/reviewText")
public class reviewText extends HttpServlet {
	private static final long serialVersionUID = 1L;

	
	
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		// 한글인코딩
		request.setCharacterEncoding("UTF-8");
		
		// 데이터불러오기
		String review_content = request.getParameter("review_content");
		HttpSession session = request.getSession();
		
		int idx = (int)session.getAttribute("idx");
		memberDTO user= (memberDTO) session.getAttribute("user");
		
		// DTO로 데이터 묶기
		reviewDTO dto = new reviewDTO();
		
		// 오늘 날짜 
		Date date = new Date();
		System.out.println(date.toString());
		System.out.println("영화인덱스 :"+idx);
		
		System.out.println(review_content);
		
		SimpleDateFormat df = new SimpleDateFormat("yy-MM-dd");
		

		dto.setV_idx(idx);
		dto.setReview_content(review_content);
		dto.setReview_dt(df.format(date));
		dto.setUser_id(user.getUser_id());
		
		// 구현하기
		reviewDAO dao = new reviewDAO();
		int cnt = dao.write(dto);
		
		if (cnt >0) {
			System.out.println("저장 성공");
		}else{
			System.out.println("저장 실패");
		}
		ArrayList<reviewDTO> review_list = dao.search();
		if (review_list != null) {
			//dao의 search 메소드를 사용하여 결과 값이 반환된 경우
			
			// 세션을 불러오기
			// 세션에 contents라는 이름으로 불러온 리스트 들고오기
			session.setAttribute("review", review_list);
			// 반복해서 세션에 데이터를 넘긴 후에 main.jsp로 이동한다.
		}
		response.sendRedirect("movie_detail.jsp");
		
		

		
		
		
		
		
	}

}