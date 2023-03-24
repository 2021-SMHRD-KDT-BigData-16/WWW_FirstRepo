<!-- ArrayList import  -->
<%@page import="java.util.ArrayList"%>
<!-- contentSearch import-->
<%@page import="com.smhrd.controller.contentSearch"%>
<!-- contentDTO 자료형 import-->
<%@page import="com.smhrd.model.contentDTO"%>
<!-- jstl import-->
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
		<!-- 	
				Session 안에 들어있는 "contents","horror","action"이름에 저장되어있는 데이터는 ArrayList<contentDTO> 타입이다.
				contents안에 담긴 객체(일단 예시)
				content_index: 영화
				title : 영화제목
				genre : 장르
				year : 방송년도
				stove : 시놉시스
				c_score : 평점
				age_class : 방송 연령 등급
		-->
			 

			 		 	<%
	ArrayList<contentDTO> contents = (ArrayList) session.getAttribute("contents"); // contents(영화전체)
	ArrayList<contentDTO> horror = (ArrayList) session.getAttribute("horror"); // horror(공포 영화)
	ArrayList<contentDTO> action = (ArrayList) session.getAttribute("action"); // actions(액션 영화)
	//String path = "detailContent"
	%>		
		<h3>영화</h3>
				<!-- 예시로 이미지 6개 씩만 보여주기 -->
			 <div>
			 	<%for(int i=0; i<6; i++){%>
			<!-- 
				a태그를 클릭했을 때 영화 상세 페이지로 이동해야하고, 영화의 제목을 가지고 넘겨줘야하므로 contents.get(i).getTitle()을 
				a태그 속성 href 뒤에 "페이지명(url매핑값)?data=(넘겨줄 값)"
				img태그 src 속성에는 경로명 + 제목 + .jpg
			-->
				 
					<a href="detailContent?data=<%=contents.get(i).getTitle() %>">						
						<img src="./netflix_img/<%=contents.get(i).getTitle()%>.jpg" />
						</a> 
			<% } %>			
			 </div>
			 <h3>액션</h3>
			 <div>
	
			 	<%for(int j=0; j<6; j++){%>
			<!-- 
				a태그를 클릭했을 때 영화 상세 페이지로 이동해야하고, 영화의 제목을 가지고 넘겨줘야하므로 contents.get(i).getTitle()을 
				a태그 속성 href 뒤에 "페이지명(url매핑값)?data=(넘겨줄 값)"
				img태그 src 속성에는 경로명 + 제목 + .jpg
			--> 
					<a href="detailContent?data=<%=action.get(j).getTitle() %>">						
						<img src="./netflix_img/<%=action.get(j).getTitle()%>.jpg" />
						</a> 
			<% } %>			
			 </div>
			 <h3>로맨스</h3>
			 <div>
			 	<%for(int k=0; k<6; k++){%>
			<!-- 
				a태그를 클릭했을 때 영화 상세 페이지로 이동해야하고, 영화의 제목을 가지고 넘겨줘야하므로 contents.get(i).getTitle()을 
				a태그 속성 href 뒤에 "페이지명(url매핑값)?data=(넘겨줄 값)"
				img태그 src 속성에는 경로명 + 제목 + .jpg
			--> 
					<a href="detailContent?data=<%=horror.get(k).getTitle() %>">						
						<img src="./netflix_img/<%=horror.get(k).getTitle()%>.jpg" />
						</a> 
			<% } %>			
			 </div>
</body>
</html>