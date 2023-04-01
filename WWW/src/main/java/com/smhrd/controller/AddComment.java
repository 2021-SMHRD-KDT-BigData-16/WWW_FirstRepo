package com.smhrd.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.smhrd.model.commentDAO;
import com.smhrd.model.commentDTO;
import com.smhrd.model.memberDTO;


@WebServlet("/AddComment")
public class AddComment extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
//------------------------------------------------------DB에 추가할 데이터 불러오기--------------------------------------------------//
		request.setCharacterEncoding("UTF-8");
		response.setContentType("text/html; charset=UTF-8");
		PrintWriter out = response.getWriter();
		String content = request.getParameter("content");
		Date date = new Date();
		//로그인 된 닉네임 출력
		SimpleDateFormat df = new SimpleDateFormat("yy-MM-dd");
		String day = df.format(date);
		HttpSession session = request.getSession();
		memberDTO user = (memberDTO) session.getAttribute("user");
		String data = (String) session.getAttribute("playIdx");
		int idx = Integer.parseInt(data);
//------------------------------------------------------데이터 불러온 데이터 확인 작업--------------------------------------------------//
		System.out.println("---------------------------------------------------------------");
		System.out.println(user);
		System.out.println("작성자 :" + user.getUser_nick());
		System.out.println("작성 일자 :" + day);
		System.out.println("작성 글 번호 : "+ idx);
		System.out.println("작성 내용 : " + content);
		System.out.println("---------------------------------------------------------------");
		
//------------------------------------------------------데이터 DB연결시키기--------------------------------------------------//
		commentDTO dto = new commentDTO();
		commentDAO dao = new commentDAO();
		dto.setC_idx(idx);
		dto.setCmt_content(content);
		dto.setCmt_dt(day);
		dto.setUser_id(user.getUser_id());
		int row = dao.addComment(dto);
		if(row>0) {
			System.out.println("댓글 저장 성공");
			ArrayList<commentDTO> cm_list = (ArrayList) dao.selectAll();
			session.setAttribute("comment", cm_list);
			out.println("<script>alert('댓글이 등록완료 되었습니다.'); location.href='community_1.jsp';</script>");
		}else {
			System.out.println("댓글 저장 실패");
		}
		
//		response.sendRedirect("community_1.jsp");
	}

}
