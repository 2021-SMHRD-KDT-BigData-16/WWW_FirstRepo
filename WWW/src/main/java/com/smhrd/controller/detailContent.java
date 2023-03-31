package com.smhrd.controller;

import java.io.IOException;
import java.util.ArrayList;
import java.util.Iterator;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.smhrd.model.contentDTO;
import com.smhrd.model.reviewDTO;


@WebServlet("/detailContent")
public class detailContent extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		
		// 응답받은 값 인코딩
		request.setCharacterEncoding("UTF-8");
		
		// 영화를 클릭하면 데이터에 영화 제목이 data = "영화 제목"으로 오기때문에 data의 값을 불러준다.
		String data = request.getParameter("data");
		
		// 세션 불러오기
		HttpSession session = request.getSession();
		
		// 세션에 data 이름으로 data의 값  넣어주기
		session.setAttribute("title", data);
		ArrayList<contentDTO> contents = (ArrayList)session.getAttribute("contents");
		int idx=0;
		for(int i=0; i<contents.size(); i++) {
			if(contents.get(i).getV_title().equals(data)) {
				idx =contents.get(i).getV_idx();
				session.setAttribute("idx", idx);
			}
		}
		System.out.println("---------------------------------------------------------------------");
		System.out.println("영화 인덱스 번호 : "+idx);
		System.out.println("데이터 내용 : "+data);
		System.out.println("---------------------------------------------------------------------");
		ArrayList<reviewDTO> reviews = (ArrayList) session.getAttribute("review");
		for(int i=0; i<reviews.size(); i++) {
			if(reviews.get(i).getV_idx()==idx) {
				System.out.println("---------------------------------------------------------------------");
				System.out.println("영화 번호 : " +reviews.get(i).getV_idx());
				System.out.println("작성자 : " +reviews.get(i).getUser_id());
				System.out.println("글 순서 : " +reviews.get(i).getReview_idx());
				System.out.println("작성 내용 : " +reviews.get(i).getReview_content());
				System.out.println("작성 날짜 : " +reviews.get(i).getReview_dt());
				System.out.println("---------------------------------------------------------------------");
			}
		}
		// 넣은 결과창을 보여줘야 하니까 jsp파일로 이동
		response.sendRedirect("movie_detail.jsp");
	}

}
