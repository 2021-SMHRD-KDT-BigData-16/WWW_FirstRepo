<!-- ArrayList import  -->
<%@page import="com.smhrd.model.memberDTO"%>
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
<title>Insert title here</title>
	<link rel="stylesheet" type="text/css" href="./styles/header_nick.css">
	<link rel="icon" href="./logo_img/favicon.png">

    <link rel="canonical" href="https://getbootstrap.com/docs/5.3/examples/footers/">

    <link rel="stylesheet" href="./styles/community_page.css">
    <link rel="stylesheet" href="./styles/footer,header.css">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/css/bootstrap.min.css" rel="stylesheet"
        integrity="sha384-GLhlTQ8iRABdZLl6O3oVMWSktQOp6b7In1Zl3/Jr59b6EGGoI1aFkw7cmDA6j6gD" crossorigin="anonymous">


    <!-- header꺼 -->
    <link rel="canonical" href="https://getbootstrap.kr/docs/5.2/examples/navbar-fixed/">

    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet"
        integrity="sha384-rbsA2VBKQhggwzxH7pPCaAqO46MgnOM80zW1RWuH61DGLwZJEdK2Kadq2F9CUG65" crossorigin="anonymous">
    <!-- header꺼 -->


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
            <a class="navbar-brand" href="/ex03_myPage2.html"><img src="./logo_img/작은 로고.png" alt=""
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
                            href="community.jsp">플레이리스트</a>
                    </li>
                </ul>
				
               <form class="d-flex" role="search" align="center" action ="SearchResult" method="get">
                    <input id="searchInput" style="margin-right: 10px; width: 400px; z-index: 2;"  name = "search" placeholder=" 검색어를 입력해주세요.">
                    <button type="submit" class="btn btn-outline-warning" style = "margin-right : 95px">
                        <a class="btn_link" style="color: white !important" href="">검색</a>
                    </button>
                </form>
				<% memberDTO user =(memberDTO)session.getAttribute("user"); %>
				<p class="header_nick"><%=user.getUser_nick() %></p>
					<form action="logoutService" align="center" method = "post">
                    <button type="button" class="btn btn-outline-warning" style="margin-left : 20px ">
                        <a class="btn_link" style="color: white !important" href="logoutService">로그아웃</a>
                    </button>
                	</form>
				
                


            </div>
        </div>
    </nav>
    <!-- 헤더 끝 -->

    <br>
    <br>
    <br>

    <h2 style ="color:white;margin-left : 160px">커뮤니티
    <button class="btn btn-outline-warning" style= " margin-left:1300px">
    <a class="btn_link" style="color: white !important; " href ="community_detail.jsp">
                작성하기</a>
    </button>
    </h2>
      
      
      
      
      <%
      ArrayList<communityDTO> c_list = (ArrayList) session.getAttribute("community"); // contents(커뮤전체)
      ArrayList<memberDTO> u_list = (ArrayList) session.getAttribute("user_list");
      %>   
      <% 
         boolean isUserComm = false;
         int user_idx = 0;
         int cnt=0;
         for (int i=0; i<c_list.size(); i++){
            if(c_list.get(i).getUser_id().equals(user.getUser_id())){
               isUserComm = true;
               
            }
         }
      %>
      <% if(isUserComm){%>
      <hr>
      <h3 style ="color:white;margin-left : 160px">내가 작성한 플레이리스트</h3>
        
        <div class="movie_tag" id="movie2_tag"></div>
            <div class="slide_wrapper" id="movie2">
            <a class="prev">&#10094;</a>
            <a class="next">&#10095;</a>
            <ul class="slides">
            <%for (int i=0; i<c_list.size(); i++){%>
            <%if(c_list.get(i).getUser_id().equals(user.getUser_id())){%>
               <%String[] user_comm = c_list.get(i).getC_content().split(","); %>
               <%int k =0; %>
                  <li>   
                  <a href="detailPlayList?data=<%=c_list.get(i).getC_idx()%>"><div class="contain">
                  <br>
                  <img class="a" src="./netflix_img/<%=user_comm[k+1]%>.jpg" alt="<%=user_comm[k+1]%>">
                  <img class="b" src="./netflix_img/<%=user_comm[k]%>.jpg" alt="<%=user_comm[k]%>">
                  <img class="c" src="./netflix_img/<%=user_comm[k+2]%>.jpg" alt="<%=user_comm[k+2]%>">
               <%for(int j=0; j<u_list.size(); j++) {%>
                  <%if(c_list.get(i).getUser_id().equals(u_list.get(j).getUser_id())) {%>
                  <p class="p"><%=u_list.get(j).getUser_nick()%>의 플레이리스트</p>
                  <%} %>
               <%} %>
                  <p><%=c_list.get(i).getC_hashtag()%> ❤ : <%=c_list.get(i).getC_likes() %></p>
      </div>
      </a>
            </li> 
                  
               <% } %>   
            <% } %> 
         <% } %>

            </ul>
        </div>
        
      
      
      
      
      <!-- 3 -->
      <hr>
   
       <h3 style ="color:white;margin-left : 160px">드라마</h3>            
            <div class="slide_wrapper" id="movie3">
            <a class="prev">&#10094;</a>
            <a class="next">&#10095;</a>
            <ul class="slides">
          <%for(int i=0; i<c_list.size(); i++){ %>
                <%if(c_list.get(i).getC_hashtag().contains("#드라마")){%>
                   <%int j=0;%>
                   <%String[] comm =  c_list.get(i).getC_content().split(",");%>   
               <li>   
                  <a href="detailPlayList?data=<%=c_list.get(i).getC_idx()%>">
                  <div class="contain">
                  <br>
                     <img class="a" src="./netflix_img/<%=comm[j+1]%>.jpg" alt="<%=comm[j+1]%>">
                     <img class="b" src="./netflix_img/<%=comm[j]%>.jpg" alt="<%=comm[j]%>">
                     <img class="c" src="./netflix_img/<%=comm[j+2]%>.jpg" alt="<%=comm[j+2]%>">
                     <%for(int k=0; k<u_list.size(); k++) {%>
                  <%if(c_list.get(i).getUser_id().equals(u_list.get(k).getUser_id())) {%>
                  <p class="p"><%=u_list.get(k).getUser_nick()%>의 플레이리스트</p>
                  <%} %>
               <%} %>
                  <p><%=c_list.get(i).getC_hashtag()%> ❤ : <%=c_list.get(i).getC_likes() %></p>
                  </div>
                  </a>         
               </li>
                <%}%>     
            <%} %>
            </ul>
        </div>
        <!-- 4 -->
        <hr>
        <h3 style ="color:white;margin-left : 160px">액션</h3>
        
        <div class="slide_wrapper" id="movie4">
            <a class="prev">&#10094;</a>
            <a class="next">&#10095;</a>
            <ul class="slides">
          <%for(int i=0; i<c_list.size(); i++){ %>
                <%if(c_list.get(i).getC_hashtag().contains("#액션")){%>
                   <%int j=0;%>
                   <%String[] comm =  c_list.get(i).getC_content().split(",");%>   
               <li>   
                  <a href="detailPlayList?data=<%=c_list.get(i).getC_idx()%>">
                  <div class="contain">
                  <br>
                     <img class="a" src="./netflix_img/<%=comm[j+1]%>.jpg" alt="<%=comm[j+1]%>">
                     <img class="b" src="./netflix_img/<%=comm[j]%>.jpg" alt="<%=comm[j]%>">
                     <img class="c" src="./netflix_img/<%=comm[j+2]%>.jpg" alt="<%=comm[j+2]%>">
                     <%for(int k=0; k<u_list.size(); k++) {%>
                  <%if(c_list.get(i).getUser_id().equals(u_list.get(k).getUser_id())) {%>
                  <p class="p"><%=u_list.get(k).getUser_nick()%>의 플레이리스트</p>
                  <%} %>
               <%} %>
                  <p><%=c_list.get(i).getC_hashtag()%> ❤ : <%=c_list.get(i).getC_likes() %></p>
                  </div>
                  </a>
               </li>
                <%}%>     
            <%} %>
            </ul>
        </div>
        
        <!-- 5 -->
      <hr>
      
        <h3 style ="color:white;margin-left : 160px">판타지</h3>
        
        <div class="movie_tag" id="movie5_tag"></div>
            <div class="slide_wrapper" id="movie5">
            <a class="prev">&#10094;</a>
            <a class="next">&#10095;</a>
            <ul class="slides">
          <%for(int i=0; i<c_list.size(); i++){ %>
                <%if(c_list.get(i).getC_hashtag().contains("#판타지")){%>
                   <%int j=0;%>
                   <%String[] comm =  c_list.get(i).getC_content().split(",");%>   
               <li>   
                  <a href="detailPlayList?data=<%=c_list.get(i).getC_idx()%>">
                  <div class="contain">
                  <br>
                     <img class="a" src="./netflix_img/<%=comm[j+1]%>.jpg" alt="<%=comm[j+1]%>">
                     <img class="b" src="./netflix_img/<%=comm[j]%>.jpg" alt="<%=comm[j]%>">
                     <img class="c" src="./netflix_img/<%=comm[j+2]%>.jpg" alt="<%=comm[j+2]%>">
                     <%for(int k=0; k<u_list.size(); k++) {%>
                  <%if(c_list.get(i).getUser_id().equals(u_list.get(k).getUser_id())) {%>
                  <p class="p"><%=u_list.get(k).getUser_nick()%>의 플레이리스트</p>
                  <%} %>
               <%} %>
                  <p><%=c_list.get(i).getC_hashtag()%> ❤ : <%=c_list.get(i).getC_likes() %></p>
                  </div>
                  </a>
               </li>
                <%}%>     
            <%} %>
            </ul>
        </div>
        
        <!-- 6 -->
        <hr>
       <h3 style ="color:white;margin-left : 160px">공포</h3>        
        <div class="movie_tag" id="movie6_tag"></div>
            <div class="slide_wrapper" id="movie6">
            <a class="prev">&#10094;</a>
            <a class="next">&#10095;</a>
            <ul class="slides">
          <%for(int i=0; i<c_list.size(); i++){ %>
                <%if(c_list.get(i).getC_hashtag().contains("#공포")){%>
                   <%int j=0;%>
                   <%String[] comm =  c_list.get(i).getC_content().split(",");%>   
               <li>   
                  <a href="detailPlayList?data=<%=c_list.get(i).getC_idx()%>">
                  <div class="contain">
                  <br>
                     <img class="a" src="./netflix_img/<%=comm[j+1]%>.jpg" alt="<%=comm[j+1]%>">
                     <img class="b" src="./netflix_img/<%=comm[j]%>.jpg" alt="<%=comm[j]%>">
                     <img class="c" src="./netflix_img/<%=comm[j+2]%>.jpg" alt="<%=comm[j+2]%>">
                     <%for(int k=0; k<u_list.size(); k++) {%>
                  <%if(c_list.get(i).getUser_id().equals(u_list.get(k).getUser_id())) {%>
                  <p class="p"><%=u_list.get(k).getUser_nick()%>의 플레이리스트</p>
                  <%} %>
               <%} %>
                  <p><%=c_list.get(i).getC_hashtag()%> ❤ : <%=c_list.get(i).getC_likes() %></p>
                  </div>
                  </a>
               </li>
                <%}%>     
            <%} %>
            </ul>
        </div>
        
        
        <!-- 7 -->
        <hr>
       <h3 style ="color:white;margin-left : 160px">스릴러</h3>        
        <div class="movie_tag" id="movie7_tag"></div>
            <div class="slide_wrapper" id="movie7">
            <a class="prev">&#10094;</a>
            <a class="next">&#10095;</a>
            <ul class="slides">
          <%for(int i=0; i<c_list.size(); i++){ %>
                <%if(c_list.get(i).getC_hashtag().contains("#스릴러")){%>
                   <%int j=0;%>
                   <%String[] comm =  c_list.get(i).getC_content().split(",");%>   
               <li>   
                  <a href="detailPlayList?data=<%=c_list.get(i).getC_idx()%>">
                  <div class="contain">
                  <br>
                     <img class="a" src="./netflix_img/<%=comm[j+1]%>.jpg" alt="<%=comm[j+1]%>">
                     <img class="b" src="./netflix_img/<%=comm[j]%>.jpg" alt="<%=comm[j]%>">
                     <img class="c" src="./netflix_img/<%=comm[j+2]%>.jpg" alt="<%=comm[j+2]%>">
                     <%for(int k=0; k<u_list.size(); k++) {%>
                  <%if(c_list.get(i).getUser_id().equals(u_list.get(k).getUser_id())) {%>
                  <p class="p"><%=u_list.get(k).getUser_nick()%>의 플레이리스트</p>
                  <%} %>
               <%} %>
                  <p><%=c_list.get(i).getC_hashtag()%> ❤ : <%=c_list.get(i).getC_likes() %></p>
                  </div>
                  </a>
               </li>
                <%}%>     
            <%} %>
            </ul>
        </div>
        <!-- 8 -->
        <hr>
       <h3 style ="color:white;margin-left : 160px">가족</h3>        
        <div class="movie_tag" id="movie8_tag"></div>
            <div class="slide_wrapper" id="movie8">
            <a class="prev">&#10094;</a>
            <a class="next">&#10095;</a>
            <ul class="slides">
          <%for(int i=0; i<c_list.size(); i++){ %>
                <%if(c_list.get(i).getC_hashtag().contains("#가족")){%>
                   <%int j=0;%>
                   <%String[] comm =  c_list.get(i).getC_content().split(",");%>   
               <li>   
                  <a href="detailPlayList?data=<%=c_list.get(i).getC_idx()%>">
                  <div class="contain">
                  <br>
                     <img class="a" src="./netflix_img/<%=comm[j+1]%>.jpg" alt="<%=comm[j+1]%>">
                     <img class="b" src="./netflix_img/<%=comm[j]%>.jpg" alt="<%=comm[j]%>">
                     <img class="c" src="./netflix_img/<%=comm[j+2]%>.jpg" alt="<%=comm[j+2]%>">
                     <%for(int k=0; k<u_list.size(); k++) {%>
                  <%if(c_list.get(i).getUser_id().equals(u_list.get(k).getUser_id())) {%>
                  <p class="p"><%=u_list.get(k).getUser_nick()%>의 플레이리스트</p>
                  <%} %>
               <%} %>
                  <p><%=c_list.get(i).getC_hashtag()%> ❤ : <%=c_list.get(i).getC_likes() %></p>
                  </div>
                  </a>
               </li>
                <%}%>     
            <%} %>
            </ul>
        </div>

    </div>










	<!-- 커뮤니티 페이지 -->
	<script src="./Js/community_page.js"></script>


</body>
</html>