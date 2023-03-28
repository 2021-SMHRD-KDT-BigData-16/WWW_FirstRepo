<!-- ArrayList import  -->
<%@page import="com.smhrd.model.communityDTO"%>
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
<title>Search_result</title>
	<link rel="stylesheet" type="text/css" href="./styles/search_result.css">
	<link rel="stylesheet" type="text/css" href="./styles/main.css">
	<link rel="stylesheet" href="./styles/footer,header.css">
	<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet"
        integrity="sha384-rbsA2VBKQhggwzxH7pPCaAqO46MgnOM80zW1RWuH61DGLwZJEdK2Kadq2F9CUG65" crossorigin="anonymous">
        
        	<link rel="stylesheet" type="text/css" href="./styles/scroll.css">
	<link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
    <script src="https://code.jquery.com/jquery-1.12.4.js"></script>
    <script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
    <script src="./Js/footer,header_auto_search.js"></script>
        
    <!-- 검색창용 -->
    <link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
    <script src="https://code.jquery.com/jquery-1.12.4.js"></script>
    <script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
    <script src="./Js/footer,header_auto_search.js"></script>
</head>
<body>

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
                            href="main.jsp">홈</a>
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
	<%
	ArrayList<contentDTO> contents = (ArrayList) session.getAttribute("contents"); // contents(영화전체)
	ArrayList<communityDTO> c_list = (ArrayList) session.getAttribute("community"); // contents(커뮤전체)
	String result = (String) session.getAttribute("search_result"); 
	%>
	<br>
	<br>
	<br>
	<br>
	<br>
	<br>
	<br>

	<h2 style="color:white">"<%= result %>"에 대한 검색 결과</h2>
<hr id="line">
<h2 class ="search_title">영화</h2>
	<% boolean isResult = false; %>
	<% for(int i=0; i<contents.size(); i++) {%>
			<%if(contents.get(i).getV_title().equals(result)) {%>	
			<div class="search_movie_poster">
				<a href="detailContent?data=<%=contents.get(i).getV_title() %>">						
						<img src="./netflix_img/<%=contents.get(i).getV_title()%>.jpg" />
					</a>
					<br>
					
				<a href="detailContent?data=<%=contents.get(i).getV_title()%>" style="text-decoration: none">						
						<p class ="result_title" style="font-size: 1.2em"> <%=contents.get(i).getV_title()%> </p>
					</a>
					</div>
					<%isResult = true; %>
		<%} %>
<%} %>	
<hr id="line">
<h2 class ="search_title">커뮤니티</h2>
	<% boolean isCommResult = false; %>
		<div class = "none">
			<span>
				<ul class = "scroll_serach">
		<% int cnt = 0; %>
		
	<%for(int i=0; i<c_list.size(); i++){ %>
		<%if(c_list.get(i).getC_content().contains(result)) {%>
			<%String[] comm =  c_list.get(i).getC_content().split(",");%>
			<%isCommResult = true; %>
			<%if(cnt<3) {%>
					<%cnt++; %>
					<%int j = 0; %>
							<li>
								<div class='contain'>
									<a href ="#">
										<br>
										<img class="a" src = "./netflix_img/<%=comm[j+1]%>.jpg" alt="<%=comm[j+1]%>"/>
										<img class="b" src = "./netflix_img/<%=comm[j]%>.jpg" alt="<%=comm[j]%>"/>
										<img class="c" src = "./netflix_img/<%=comm[j+2]%>.jpg" alt="<%=comm[j+2]%>"/>
									</a>
									 <p class="p"><%=c_list.get(i).getUser_id()%>의 플레이 리스트</p>
									 <p><%=c_list.get(i).getC_hashtag()%> ❤ : <%=c_list.get(i).getC_likes() %></p>
	                    			<br>
								</div>
							</li>
			<%}else{%>
					</ul>
				</span>
			</div>
			<div class = "list_cont">
				<span>
					<ul class = "animatable">
					<%int j = 0; %>
							<li>
								<div class='contain'>
									<a href ="#">
										<br>
										<img class="a" src = "./netflix_img/<%=comm[j+1]%>.jpg" alt="<%=comm[j+1]%>"/>
										<img class="b" src = "./netflix_img/<%=comm[j]%>.jpg" alt="<%=comm[j]%>"/>
										<img class="c" src = "./netflix_img/<%=comm[j+2]%>.jpg" alt="<%=comm[j+2]%>"/>
									</a>
									 <p class="p"><%=c_list.get(i).getUser_id()%>의 플레이 리스트</p>
									 <p><%=c_list.get(i).getC_hashtag()%> ❤ : <%=c_list.get(i).getC_likes() %></p>
	                    			<br>
								</div>
							</li>
				<%cnt=1;%>
					<%} %>
				<%} %>
			<%} %>
				</ul>
				</span>
			</div>
	
		
	<%if (isCommResult != true){ %>
		<h2 style="color:white">"<%=result%>" 검색된 결과가 없습니다.</h2>
	<%} %>
	<script type="text/javascript" src="./Js/main.js"></script>
	<script type="text/javascript" src="./Js/CommunityScoll.js"></script><!-- 스크롤기능 js -->
</body>
</html>