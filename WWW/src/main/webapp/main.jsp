<%@page import="java.util.ArrayList"%>
<%@page import="com.smhrd.controller.contentSearch"%>
<%@page import="com.smhrd.model.contentDTO"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@page import="java.util.List"%>
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
				contents안에 담긴 객체(일단 예시)
				content_index: 영화
				title : 영화제목
				genre : 장르
				year : 방송년도
				stove : 시놉시스
				c_score : 평점
				age_class : 방송 연령 등급
				img : 24개 6개씩 4개
			 -->
			 
			<!-- session 안에 
							contents(영화전체)
							actions(액션 영화)
							romance(로맨스 영화)
			 -->
			 		 	<%
	ArrayList<contentDTO> contents = (ArrayList) session.getAttribute("contents");
	ArrayList<contentDTO> horror = (ArrayList) session.getAttribute("horror");
	ArrayList<contentDTO> action = (ArrayList) session.getAttribute("action");
	//String path = "detailContent"
	%>		
		<h3>영화</h3>
			 <div>
	
			 	<%for(int i=0; i<6; i++){%>
			<!-- 먼저 보여줄 리스트 3줄 설정--> 
					<a href="detailContent?data=<%=contents.get(i).getTitle() %>">						
						<img src="./netflix_img/<%=contents.get(i).getTitle()%>.jpg" />
						</a> 
			<% } %>			
			 </div>
			 <h3>액션</h3>
			 <div>
	
			 	<%for(int j=0; j<6; j++){%>
			<!-- 먼저 보여줄 리스트 3줄 설정--> 
					<a href="detailContent?data=<%=action.get(j).getTitle() %>">						
						<img src="./netflix_img/<%=action.get(j).getTitle()%>.jpg" />
						</a> 
			<% } %>			
			 </div>
			 <h3>로맨스</h3>
			 <div>
			 	<%for(int k=0; k<6; k++){%>
			<!-- 먼저 보여줄 리스트 3줄 설정--> 
					<a href="detailContent?data=<%=horror.get(k).getTitle() %>">						
						<img src="./netflix_img/<%=horror.get(k).getTitle()%>.jpg" />
						</a> 
			<% } %>			
			 </div>
</body>
</html>