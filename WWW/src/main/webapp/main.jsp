<%@page import="com.smhrd.controller.contentSearch"%>
<%@page import="com.smhrd.model.contentDTO"%>
<%@page import = "java.util.List" %>
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
	
			 -->
			<!-- contentDTO-> Object down casting 필수 -->
			<% List<contentDTO> contents= (List<contentDTO>)session.getAttribute("contents"); %>
			<% for (int i=0; i<contents.size(); i++) {%>
				<img src="./netflix_img/<%=contents.get(i).getTitle()%>.jpg"/>
				<h2><%=contents.get(i).getTitle()%></h2>
				<h2><%=contents.get(i).getC_score()%></h2>
				<h2><%=contents.get(i).getGenre()%></h2>
				<h2><%=contents.get(i).getYear()%></h2>
				<h2><%=contents.get(i).getContent_index()%></h2>
				
			<%}; %>
</body>
</html>