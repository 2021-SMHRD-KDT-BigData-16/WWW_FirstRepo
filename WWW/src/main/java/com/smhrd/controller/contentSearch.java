package com.smhrd.controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.smhrd.model.communityDAO;
import com.smhrd.model.communityDTO;
import com.smhrd.model.contentDAO;
import com.smhrd.model.contentDTO;
import com.smhrd.model.reviewDAO;
import com.smhrd.model.reviewDTO;

@WebServlet("/contentSearch")
public class contentSearch extends HttpServlet {
	private static final long serialVersionUID = 1L;
	

	protected void service(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// 한글 인코딩 잡아주기
		request.setCharacterEncoding("UTF-8");
		
		// 공포영화 리스트를 담을 변수 지정
		ArrayList<contentDTO> horror_list = new ArrayList<contentDTO>();
		
		// 액션 영화 리스트를 담을 변수 지정
		ArrayList<contentDTO> action_list = new ArrayList<contentDTO>();
		
		// 커뮤니티 글을 담을 변수 지정
		
		// dao 객체 불러주기
		contentDAO c_dao = new contentDAO();
		communityDAO cm_dao = new communityDAO();
		ArrayList<communityDTO> comm_list = cm_dao.selectAll();
		reviewDAO re_dao = new reviewDAO();
		//dao의 search 메소드를 사용하여 영화 컨텐츠 전부 contentDTO를 담는 배열에 저장
		ArrayList<contentDTO> content_list = c_dao.search();
		ArrayList<reviewDTO> review_list = re_dao.search();
		if (content_list != null) {
			//dao의 search 메소드를 사용하여 결과 값이 반환된 경우
			
			// 세션을 불러오기
			HttpSession session = request.getSession();
			
			// 세션에 contents라는 이름으로 불러온 리스트 들고오기
			session.setAttribute("contents", content_list);
			
			// 컨텐츠의 크기만큼 (0 ~ 컨텐츠 길이까지 반복문) 
			for (int i = 0; i < content_list.size(); i++) {
				if (content_list.get(i).getV_genre().contains("공포") == true) { // 공포 장르 영화 조건 if 문 시작
					// 컨텐츠 리스트 안에 객체에 접근하여 객체가 가지고있는 장르가 공포를 포함하면
					// .contain("문자열") = 문자열이 포함되어있는
					// 우리의 데이터의 장르는 "드라마, 공포, 액션" 이련 형태이므로 contains로 해야한다!! 
					//.equals --> 사용 시 첫번째 글자만 공포만 검색된다.
	
					// 조건문이 참이다--> 장르에 공포가 포함된다
					// horro_list에 추가하려면 contentDTO로 담아야 하므로 
					// content_list.get(i)의 반환 값이 DTO 타입이므로 리스트 명에 .add해준다.
					horror_list.add(content_list.get(i));
					
					//horror_list를 세션에 "horror"라는 이름으로 저장한다.
					session.setAttribute("horror", horror_list);
				}//공포 장르 영화 조건 if 문 끝
			}
			for (int i = 0; i < content_list.size(); i++) {
				if (content_list.get(i).getV_genre().contains("액션") == true) {
					
					// 조건문이 참이다--> 장르에 액션이 포함된다
					// action_list에 추가하려면 contentDTO로 담아야 하므로 
					// action_list.get(i)의 반환 값이 DTO 타입이므로 리스트 명에 .add해준다.
					action_list.add(content_list.get(i));
					
					//action_list를 세션에 "action"라는 이름으로 저장한다.
					session.setAttribute("action", action_list);
				}
			}
			// 반복해서 세션에 데이터를 넘긴 후에 main.jsp로 이동한다.
		}
		//------------------------------------------------커뮤니티 글 ----------------------------------------------//
		if (comm_list != null) {
			//dao의 search 메소드를 사용하여 결과 값이 반환된 경우
			
			// 세션을 불러오기
			HttpSession session = request.getSession();
			
			// 세션에 contents라는 이름으로 불러온 리스트 들고오기
			session.setAttribute("community", comm_list);
			// 반복해서 세션에 데이터를 넘긴 후에 main.jsp로 이동한다.
		}
		//------------------------------------------------리뷰 전체 ----------------------------------------------//
		if (review_list != null) {
			//dao의 search 메소드를 사용하여 결과 값이 반환된 경우
			
			// 세션을 불러오기
			HttpSession session = request.getSession();
			
			// 세션에 contents라는 이름으로 불러온 리스트 들고오기
			session.setAttribute("review", review_list);
			// 반복해서 세션에 데이터를 넘긴 후에 main.jsp로 이동한다.
		}
		response.sendRedirect("main.jsp");
	}
}
