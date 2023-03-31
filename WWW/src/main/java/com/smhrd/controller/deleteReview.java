package com.smhrd.controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.smhrd.model.reviewDAO;
import com.smhrd.model.reviewDTO;


@WebServlet("/deleteReview")
public class deleteReview extends HttpServlet {
	private static final long serialVersionUID = 1L;


	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		String temp = request.getParameter("data");
		HttpSession session = request.getSession();
		int idx = Integer.parseInt(temp);
		System.out.println("삭제할 글 번호 : "+ idx);
		reviewDTO dto = new reviewDTO();
		dto.setReview_idx(idx);
		reviewDAO dao = new reviewDAO();
		int row = dao.delete(dto);
		if(row>0) {
			System.out.println("삭제 성공");
		}else {
			System.out.println("삭제 실패");
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
