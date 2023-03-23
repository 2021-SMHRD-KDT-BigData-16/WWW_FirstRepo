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
<link rel="stylesheet" href="./styles/test.css">
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

	<div id="movie-content-container">
		<div id="movie-title">영화</div>
		<div id="community-title">
			<a href="communitySerach">커뮤니티</a>
		</div>
	</div>
	<!-- contentDTO-> Object down casting 필수 -->
	<%
	List<contentDTO> contents = (List) session.getAttribute("contents");
	%>
	<div class="warpper">
		
		<%for(int i=0; i<(contents.size()/6); i++){%>
			<% if(i<1) { %>
				<div class="none">
					<span> 
					<%for (int j = i*6; j < (i+1)*6; j++) {%> 
						<a href="#<%=contents.get(j).getTitle()%>>">
						<img src="./netflix_img/<%=contents.get(j).getTitle()%>.jpg" />
						</a> 
					<% }%>
					</span>
				</div>
			<% } else{%>
				<div class="list_cont">
					<span class="animatable"> 
					<%for (int j = i*6; j < (i+1)*6; j++) {%> 
						<a href="#<%=contents.get(j).getTitle()%>>">
						<img src="./netflix_img/<%=contents.get(j).getTitle()%>.jpg" />
						</a> 
					<% }%>
					</span>
				</div>
			<% }%>
		<% }%>
		<div class="list_cont">
					<span class="animatable"> 
					<%for (int j = 6; j < 12; j++) {%> 
						<a href="#<%=contents.get(j).getTitle()%>>">
						<img src="./netflix_img/<%=contents.get(j).getTitle()%>.jpg" />
						</a> 
					<% }%>
					</span>
				</div>
					<div class="list_cont">
					<span class="animatable"> 
					<%for (int j = 6; j < 12; j++) {%> 
						<a href="#<%=contents.get(j).getTitle()%>>">
						<img src="./netflix_img/<%=contents.get(j).getTitle()%>.jpg" />
						</a> 
					<% }%>
					</span>
				</div>
					<div class="list_cont">
					<span class="animatable"> 
					<%for (int j = 6; j < 12; j++) {%> 
						<a href="#<%=contents.get(j).getTitle()%>>">
						<img src="./netflix_img/<%=contents.get(j).getTitle()%>.jpg" />
						</a> 
					<% }%>
					</span>
				</div>
					<div class="list_cont">
					<span class="animatable"> 
					<%for (int j = 6; j < 12; j++) {%> 
						<a href="#<%=contents.get(j).getTitle()%>>">
						<img src="./netflix_img/<%=contents.get(j).getTitle()%>.jpg" />
						</a> 
					<% }%>
					</span>
				</div>
					<div class="list_cont">
					<span class="animatable"> 
					<%for (int j = 6; j < 12; j++) {%> 
						<a href="#<%=contents.get(j).getTitle()%>>">
						<img src="./netflix_img/<%=contents.get(j).getTitle()%>.jpg" />
						</a> 
					<% }%>
					</span>
				</div>
					<div class="list_cont">
					<span class="animatable"> 
					<%for (int j = 6; j < 12; j++) {%> 
						<a href="#<%=contents.get(j).getTitle()%>>">
						<img src="./netflix_img/<%=contents.get(j).getTitle()%>.jpg" />
						</a> 
					<% }%>
					</span>
				</div>
					<div class="list_cont">
					<span class="animatable"> 
					<%for (int j = 6; j < 12; j++) {%> 
						<a href="#<%=contents.get(j).getTitle()%>>">
						<img src="./netflix_img/<%=contents.get(j).getTitle()%>.jpg" />
						</a> 
					<% }%>
					</span>
				</div>
					<div class="list_cont">
					<span class="animatable"> 
					<%for (int j = 6; j < 12; j++) {%> 
						<a href="#<%=contents.get(j).getTitle()%>>">
						<img src="./netflix_img/<%=contents.get(j).getTitle()%>.jpg" />
						</a> 
					<% }%>
					</span>
				</div>
					<div class="list_cont">
					<span class="animatable"> 
					<%for (int j = 6; j < 12; j++) {%> 
						<a href="#<%=contents.get(j).getTitle()%>>">
						<img src="./netflix_img/<%=contents.get(j).getTitle()%>.jpg" />
						</a> 
					<% }%>
					</span>
				</div>
					<div class="list_cont">
					<span class="animatable"> 
					<%for (int j = 6; j < 12; j++) {%> 
						<a href="#<%=contents.get(j).getTitle()%>>">
						<img src="./netflix_img/<%=contents.get(j).getTitle()%>.jpg" />
						</a> 
					<% }%>
					</span>
				</div>
					<div class="list_cont">
					<span class="animatable"> 
					<%for (int j = 6; j < 12; j++) {%> 
						<a href="#<%=contents.get(j).getTitle()%>>">
						<img src="./netflix_img/<%=contents.get(j).getTitle()%>.jpg" />
						</a> 
					<% }%>
					</span>
				</div>
					<div class="list_cont">
					<span class="animatable"> 
					<%for (int j = 6; j < 12; j++) {%> 
						<a href="#<%=contents.get(j).getTitle()%>>">
						<img src="./netflix_img/<%=contents.get(j).getTitle()%>.jpg" />
						</a> 
					<% }%>
					</span>
				</div>
	</div> <!-- 컨텐츠 박스 끝 지우면 애니메이션 효과 x -->


	<script type="text/javascript" src="./Js/contentsScoll.js"></script>
</body>
</html>