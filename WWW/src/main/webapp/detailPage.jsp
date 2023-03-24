<%@page import="com.smhrd.controller.contentSearch"%>
<%@page import="com.smhrd.model.contentDTO"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
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
		// session에서 꺼내올 때 강제 형변환 해주기
		String data = (String)session.getAttribute("data");
	
		// 세션에 담긴 컨텐츠 항목 불러오기
		ArrayList<contentDTO> contents = (ArrayList) session.getAttribute("contents");%>
		<%for (int i=0; i<contents.size(); i++){%>
		<!-- 컨텐츠 크기만큼 반복해서 입력받은 data와 같은지 비교하기-->
			<%if(contents.get(i).getTitle().equals(data)){%>
				<h2>제목 : <%=contents.get(i).getTitle()%></h2>
				<br>
				<h2>장르 : <%=contents.get(i).getGenre()%></h2>
				<br>
				<h2>방송년도 : <%=contents.get(i).getYear()%></h2>
				<br>
				<h2>시놉시스 : <%=contents.get(i).getStove()%></h2>
				<br>
				<h2>평점 : <%=contents.get(i).getC_score()%></h2>
				<br>
				<h2>연령등급 : <%=contents.get(i).getAge_class()%></h2>
			<%}%>
		<%}%>
	
	
	
	
	
	
</body>
</html>