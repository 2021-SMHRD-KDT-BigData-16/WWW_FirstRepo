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
<link rel="stylesheet" href="./styles/main.css">
    <link rel="stylesheet" href="./styles/footer,header.css">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet"
        integrity="sha384-rbsA2VBKQhggwzxH7pPCaAqO46MgnOM80zW1RWuH61DGLwZJEdK2Kadq2F9CUG65" crossorigin="anonymous">

</head>
<body>


<!-- 헤더 시작 -->
    <nav class="navbar navbar-expand-md navbar-dark fixed-top bg-dark">
        <div class="container-fluid">
            <a class="navbar-brand" href="/ex03_myPage2.html"><img src="/img/logo_img/로고.png" alt=""
                    style="width : 80px ; margin-left : 10px"></a>
            <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarCollapse"
                aria-controls="navbarCollapse" aria-expanded="false" aria-label="Toggle navigation">
                <span class="navbar-toggler-icon"></span>
            </button>
            <div class="collapse navbar-collapse" id="navbarCollapse">
                <ul class="navbar-nav me-auto mb-2 mb-md-0">
                    <li class="nav-item">
                        <a class="nav-link active" style="font-size : 13pt" aria-current="page"  href="https://www.naver.com">홈</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link active" style="font-size : 13pt" aria-current="page" href="https://www.naver.com">TV프로그램</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link active" style="font-size : 13pt" aria-current="page" href="https://www.naver.com">커뮤니티</a>
                    </li>
                </ul>
                <form class="d-flex" role="search" align="center">
                    <input class="form-control me-2" type="search" placeholder="검색어를 입력해주세요." aria-label="Search"
                        style="width : 300px">
                    <button type="button" class="btn btn-outline-warning">
                        <a class="btn_link" style="color: white !important" href="contentSearch">검색</a>
                    </button>
                </form>
                <form action="" align="center">
                    <button type="button" class="btn btn-outline-warning" style="margin-left : 40px ">
                        <a class="btn_link" style="color: white !important" href="contentSearch">회원가입</a>
                    </button>
                </form>
                <form action="" align="center">
                    <button type="button" class="btn btn-outline-warning" style="margin-left : 7px">
                        <a class="btn_link" style="color: white !important" href="contentSearch">로그인</a>
                    </button>
                </form>


            </div>
        </div>
    </nav>
    <!-- 헤더 끝 -->

<%
	ArrayList<contentDTO> contents = (ArrayList) session.getAttribute("contents"); // contents(영화전체)
	ArrayList<contentDTO> horror = (ArrayList) session.getAttribute("horror"); // horror(공포 영화)
	ArrayList<contentDTO> action = (ArrayList) session.getAttribute("action"); // actions(액션 영화)
	//String path = "detailContent"
	%>


        <br>
        <br>
        <br>
        <br>
        <br>
        
        <div class="slide_wrapper" id="movie1">
            <button class="prev">prev</button>
            <button class="next">next</button>
            <ul class="slides">
            <%for(int i = 0 ; i < contents.size(); i++){ %>
				<li>	
					<a href="detailContent?data=<%=contents.get(i).getTitle() %>">						
						<img src="./netflix_img/<%=contents.get(i).getTitle()%>.jpg" />
					</a> 
				</li> 
            <%} %>
            </ul>
        </div>
		<div class="slide_wrapper" id="movie2">
            <button class="prev">prev</button>
            <button class="next">next</button>
            <ul class="slides">
            <%for(int i = 0 ; i < horror.size(); i++){ %>
            	<li>	
					<a href="detailContent?data=<%=horror.get(i).getTitle() %>">						
						<img src="./netflix_img/<%=horror.get(i).getTitle()%>.jpg" />
					</a> 
				</li> 
            <%} %>
            </ul>
        </div>
                <div class="slide_wrapper" id="movie">
            <button class="prev">prev</button>
            <button class="next">next</button>
            <ul class="slides">
            <%for(int i = 0 ; i < action.size(); i++){ %>
				<li>	
					<a href="detailContent?data=<%=action.get(i).getTitle() %>">						
						<img src="./netflix_img/<%=action.get(i).getTitle()%>.jpg" />
					</a> 
				</li> 
            <%} %>
            </ul>
        </div>

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
			 



			 		 			
		
			 <script type="text/javascript" src="./Js/main.js"></script>
			 
</body>
</html>