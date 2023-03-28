<!-- ArrayList import  -->
<%@page import="java.util.ArrayList"%>
<!-- contentSearch import-->
<%@page import="com.smhrd.controller.contentSearch"%>
<!-- contentDTO 자료형 import-->
<%@page import="com.smhrd.model.contentDTO"%>
<%@page import="com.smhrd.model.communityDTO"%>
<!-- jstl import-->
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
	<link rel="stylesheet" type="text/css" href="./styles/main.css">
	<link rel="stylesheet" href="./styles/footer,header.css">
	<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet"
        integrity="sha384-rbsA2VBKQhggwzxH7pPCaAqO46MgnOM80zW1RWuH61DGLwZJEdK2Kadq2F9CUG65" crossorigin="anonymous">
        
    <!-- 검색창용 -->
    <link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
    <script src="https://code.jquery.com/jquery-1.12.4.js"></script>
    <script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
    <script src="./Js/footer,header_auto_search.js"></script>
</head>
<body>


<!-- 헤더 시작 -->
    <nav class="navbar navbar-expand-md navbar-dark fixed-top bg-dark" style="z-index: 9 !important;">
        <div class="container-fluid">
            <a class="navbar-brand" href="/ex03_myPage2.html"><img src="/img/로고.png" alt=""
                    style="width : 80px ; margin-left : 10px"></a>
            <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarCollapse"
                aria-controls="navbarCollapse" aria-expanded="false" aria-label="Toggle navigation">
                <span class="navbar-toggler-icon"></span>
            </button>
            <div class="collapse navbar-collapse" id="navbarCollapse">
                <ul class="navbar-nav me-auto mb-2 mb-md-0">
                    <li class="nav-item">
                        <a class="nav-link active" style="font-size : 13pt" aria-current="page"
                            href="https://main.jsp">홈</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link active" style="font-size : 13pt" aria-current="page"
                            href="moviePage.jsp">영화</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link active" style="font-size : 13pt" aria-current="page"
                            href="community.jsp">커뮤니티</a>
                    </li>
                </ul>

               <form class="d-flex" role="search" align="center" action ="SearchResult" method="get">
                    <input id="searchInput" style="margin-right: 10px; width: 400px; z-index: 2;"  name = "search" placeholder=" 검색어를 입력해주세요.">
                    <button type="submit" class="btn btn-outline-warning">
                        검색
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
	ArrayList<communityDTO> community = (ArrayList) session.getAttribute("community"); // 커뮤니티 글
	//String path = "detailContent"
	%>


        <br>
        <br>
        <br>
        <br>
        <br>
        
        <!-- 영화 -->
        <div class="movie_tag"><h3>영화</h3></div>
        <div class="slide_wrapper" id="movie">
            <button class="prev">prev</button>
            <button class="next">next</button>
            <ul class="slides">
            <%for(int i = 0 ; i < contents.size(); i++){ %>
				<li>	
					<a href="detailContent?data=<%=contents.get(i).getV_title() %>">						
						<img src="./netflix_img/<%=contents.get(i).getV_title()%>.jpg" />
					</a> 
				</li> 
            <%} %>
            </ul>
        </div>
        
        <!-- 장르별 영화 -->
        <div class="movie_tag"><h3>호러</h3></div>
		<div class="slide_wrapper" id="movie1">
            <button class="prev">prev</button>
            <button class="next">next</button>
            <ul class="slides">
            <%for(int i = 0 ; i < horror.size(); i++){ %>
            	<li>	
					<a href="detailContent?data=<%=horror.get(i).getV_title()%>">						
						<img src="./netflix_img/<%=horror.get(i).getV_title()%>.jpg" />
					</a> 
				</li> 
            <%} %>
            </ul>
        </div>
        
        <!-- 장르별 영화 -->
        <div class="movie_tag"><h3>액션</h3></div>
                <div class="slide_wrapper" id="movie2">
            <button class="prev">prev</button>
            <button class="next">next</button>
            <ul class="slides">
            <%for(int i = 0 ; i < action.size(); i++){ %>
				<li>	
					<a href="detailContent?data=<%=action.get(i).getV_title() %>">						
						<img src="./netflix_img/<%=action.get(i).getV_title()%>.jpg" />
					</a> 
				</li> 
            <%} %>
            </ul>
        </div>
        <br>
        <br>
        <br>
        <br>
        <!-- 플레이 리스트 (커뮤니티 ) -->
        <div class="movie3_introduce"><h2>다양한 유저들의 플레이리스트를 즐겨보세요</h2></div>
        <br>
        <br>
        <br>
        <div class="movie_tag" id="movie3_tag"><h3>커뮤니티</h3></div>
            <div class="slide_wrapper" id="movie3">
            <button class="prev">prev</button>
            <button class="next">next</button>
            <ul class="slides">
            <%for(int i=0; i<community.size(); i++){ %>
            	<% String[] content = community.get(i).getC_content().split(",");%>
            	<% for(int j = 0 ; j < 1; j++){%>
            		<li>	
					<a href=""><div class="contain">
					<br>
					<img class="a" src="netflix_img/<%=content[j]%>.jpg" alt="<%=content[j]%>">
					<img class="b" src="netflix_img/<%=content[j+1]%>.jpg" alt="<%=content[j+1]%>">
					<img class="c" src="netflix_img/<%=content[j+2]%>.jpg" alt="<%=content[j+2]%>">
					<p class="p"><%=community.get(i).getUser_id()%>의 플레이리스트</p>
					<p><%=community.get(i).getC_hashtag()%>   <%=community.get(i).getC_likes()%></p>
					<p></p>
					</div></a>
				</li>
            	<% }%>
            <% }%>
            <%for(int i = 0 ; i < 5; i++){ %>
				<li>	
					<a href=""><div class="contain">
					<br>
			<img class="a" src="netflix_img/23 아이덴티티.jpg" alt="">
			<img class="b" src="netflix_img/500일의 썸머.jpg" alt="">
			<img class="c" src="netflix_img/노바디.jpg" alt="">
			<p class="p">ooo의 플레이리스트</p>
			<p>좋아요 80</p>
		</div></a>
				</li> 
            <%} %>
            </ul>
        </div>

		<!-- 	
				Session 안에 들어있는 "contents","horror","action"이름에 저장되어있는 데이터는 ArrayList<contentDTO> 타입이다.
				contents안에 담긴 객체(일단 예시)
				
						contents안에 담긴 객체(일단 예시)
						v_title : 영화 제목
						v_genre : 영화 장르
						v_year : 방송 년도
						v_synopsis : 시놉시스
						rating : 평점
						v_grade : 연령 등급
						v_iframe : 아이프레임
					-->
			 



			 		 			
		
			 <script type="text/javascript" src="./Js/main.js"></script>
			 
</body>
</html>