package com.smhrd.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.smhrd.model.contentDAO;
import com.smhrd.model.contentDTO;

@WebServlet("/contentSearch")
public class contentSearch extends HttpServlet {
	private static final long serialVersionUID = 1L;
	

	protected void service(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// 1. 한글 인코딩 잡아주기
		request.setCharacterEncoding("UTF-8");
		ArrayList<contentDTO> horror_list = new ArrayList<contentDTO>();
		ArrayList<contentDTO> action_list = new ArrayList<contentDTO>();
		contentDTO dto = new contentDTO();
		contentDAO dao = new contentDAO();
		ArrayList<contentDTO> content_list = dao.search();
		// 공포 영화 -> contentDTO
		// action 장르만 담을 변수 지정
		if (content_list != null) {
			HttpSession session = request.getSession();
			// 전체 데이터 넣고
			session.setAttribute("contents", content_list);
			for (int i = 0; i < content_list.size(); i++) {
				if (content_list.get(i).getGenre().contains("공포") == true) {
					horror_list.add(content_list.get(i));
					session.setAttribute("horror", horror_list);
				}
			}
			for (int i = 0; i < content_list.size(); i++) {
				if (content_list.get(i).getGenre().contains("액션") == true) {
					action_list.add(content_list.get(i));
					session.setAttribute("action", action_list);
				}
			}
			response.sendRedirect("main.jsp");
		}
	}
}
