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
<title>영화</title>
<!-- 메인 css -->
<link rel="stylesheet" href="./styles/main.css">

<!-- 헤더, 푸터 css -->
<link rel="stylesheet" href="./styles/footer,header.css">

<!-- 네비게이션 바(부트스트랩) -->
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet"
        integrity="sha384-rbsA2VBKQhggwzxH7pPCaAqO46MgnOM80zW1RWuH61DGLwZJEdK2Kadq2F9CUG65" crossorigin="anonymous">
        
<!-- 스크롤 애니메이션 효과 -->
<link rel="stylesheet" type="text/css" href="./styles/scroll.css">

<!-- 검색창용 -->
<link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">

<!-- 제이 쿼리 -->
    <script src="https://code.jquery.com/jquery-1.12.4.js"></script>
    <script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
    
<!-- 자동완성  -->
    <script src="./Js/footer,header_auto_search.js"></script>
</head>
<body>
<!-- 헤더 시작 -->
    <nav class="navbar navbar-expand-md navbar-dark fixed-top bg-dark" style="z-index: 9 !important;">
        <div class="container-fluid">
            <a class="navbar-brand" href="main.jsp"><img src="./logo_img/작은 로고.png" alt=""
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
                    <!-- 커뮤니티 페이지 연결해주기!!!! -->
                        <a class="nav-link active" style="font-size : 13pt" aria-current="page"
                            href="https://www.naver.com">커뮤니티</a>
                    </li>
                </ul>

               <form class="d-flex" role="search" align="center" action ="SearchResult" method="get">
                    <input id="searchInput" style="margin-right: 10px; width: 400px; z-index: 2;"  name = "search" placeholder=" 검색어를 입력해주세요.">
                    <button type="submit" class="btn btn-outline-warning">
                        검색
                    </button>
                </form>
				 <!-- 회원가입 페이지 연결해주기!!!! action으로 보내지 않아도됨 a태그로 파일명,url매핑 적어주기 -->
                <form action="" align="center">
                    <button type="button" class="btn btn-outline-warning" style="margin-left : 40px ">
                        <a class="btn_link" style="color: white !important" href="contentSearch">회원가입</a>
                    </button>
                </form>
                <!-- 로그인 페이지 연결해주기!!!! action으로 보내지 않아도됨 a태그로 파일명,url매핑 적어주기 -->
                <form action="" align="center">
                    <button type="button" class="btn btn-outline-warning" style="margin-left : 7px">
                        <a class="btn_link" style="color: white !important" href="contentSearch">로그인</a>
                    </button>
                </form>


            </div>
        </div>
    </nav>
    <!-- 헤더 끝 -->
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
			<a href="#">커뮤니티</a>
		</div>
	</div>
	<!-- contentDTO-> Object down casting 필수 -->
	<%
	List<contentDTO> contents = (List) session.getAttribute("contents");
	//String path = "detailContent"
	%>
	<!-- 컨텐츠 이미지 박스(가장 큰 틀) -->
	<div class="warpper">
		<!-- 이미지 6개씩 한박스에 포장 -->	
		<%for(int i=0; i<(contents.size()/6); i++){%>
			<!-- 먼저 보여줄 리스트 3줄 설정-->
			<% if(i<3) { %>
				<div class="none">
				<!-- 클래스 none에는 애니메이션 효과 x -->
					<span>
					<!-- i는 행단위라고 생각하고 j는 0부터 6전까지 반복 -->	 
					<%for (int j = i*6; j < (i+1)*6; j++) {%> 
						<a href="detailContent?data=<%=contents.get(j).getTitle() %>">						
						
						<img src="./netflix_img/<%=contents.get(j).getTitle()%>.jpg" />
						</a> 
					<% }%>
					</span>
				</div>
			<% } else{%>
			<!-- 나머지 줄은 숨겨서 애니메이션 효과 작용-->
				<div class="list_cont">
				<!-- div 클래스 list_cont에는 애니메이션 효과 o -->
					<span class="animatable"> 
						<!-- span animatalbe에 css 애니메이션 효과 o -->
						<!-- i는 행단위라고 생각하고 j는 6부터 12전까지 반복 -->	
					<%for (int j = i*6; j < (i+1)*6; j++) {%> 
						<a href="detailContent?data=<%=contents.get(j).getTitle()%>">
						<img src="./netflix_img/<%=contents.get(j).getTitle()%>.jpg" />
						</a> 
					<% }%>
					</span>
				</div>
			<% }%>
		<% }%>
		<!--여긴 더미 데이터 (공간 확보 알기위해서) -->
		<div class="list_cont">
					<span class="animatable"> 
					<%for (int j = 6; j < 12; j++) {%> 
						<a href="detailContent?data=<%=contents.get(j).getTitle()%>">
						<img src="./netflix_img/<%=contents.get(j).getTitle()%>.jpg" />
						</a> 
					<% }%>
					</span>
				</div>
					<div class="list_cont">
					<span class="animatable"> 
					<%for (int j = 6; j < 12; j++) {%> 
						<a href="detailContent?data=<%=contents.get(j).getTitle()%>">
						<img src="./netflix_img/<%=contents.get(j).getTitle()%>.jpg" />
						</a> 
					<% }%>
					</span>
				</div>
					<div class="list_cont">
					<span class="animatable"> 
					<%for (int j = 6; j < 12; j++) {%> 
						<a href="detailContent?data=<%=contents.get(j).getTitle()%>">
						<img src="./netflix_img/<%=contents.get(j).getTitle()%>.jpg" />
						</a> 
					<% }%>
					</span>
				</div>
					<div class="list_cont">
					<span class="animatable"> 
					<%for (int j = 6; j < 12; j++) {%> 
						<a href="detailContent?data=<%=contents.get(j).getTitle()%>">
						<img src="./netflix_img/<%=contents.get(j).getTitle()%>.jpg" />
						</a> 
					<% }%>
					</span>
				</div>
					<div class="list_cont">
					<span class="animatable"> 
					<%for (int j = 6; j < 12; j++) {%> 
						<a href="detailContent?data=<%=contents.get(j).getTitle()%>">
						<img src="./netflix_img/<%=contents.get(j).getTitle()%>.jpg" />
						</a> 
					<% }%>
					</span>
				</div>
					<div class="list_cont">
					<span class="animatable"> 
					<%for (int j = 6; j < 12; j++) {%> 
						<a href="detailContent?data=<%=contents.get(j).getTitle()%>">
						<img src="./netflix_img/<%=contents.get(j).getTitle()%>.jpg" />
						</a> 
					<% }%>
					</span>
				</div>
					<div class="list_cont">
					<span class="animatable"> 
					<%for (int j = 6; j < 12; j++) {%> 
						<a href="detailContent?data=<%=contents.get(j).getTitle()%>">
						<img src="./netflix_img/<%=contents.get(j).getTitle()%>.jpg" />
						</a> 
					<% }%>
					</span>
				</div>
					<div class="list_cont">
					<span class="animatable"> 
					<%for (int j = 6; j < 12; j++) {%> 
						<a href="detailContent?data=<%=contents.get(j).getTitle()%>">
						<img src="./netflix_img/<%=contents.get(j).getTitle()%>.jpg" />
						</a> 
					<% }%>
					</span>
				</div>
					<div class="list_cont">
					<span class="animatable"> 
					<%for (int j = 6; j < 12; j++) {%> 
						<a href="detailContent?data=<%=contents.get(j).getTitle()%>">
						<img src="./netflix_img/<%=contents.get(j).getTitle()%>.jpg" />
						</a> 
					<% }%>
					</span>
				</div>
					<div class="list_cont">
					<span class="animatable"> 
					<% for (int j = 6; j < 12; j++) {%> 
						<a href="detailContent?data=<%=contents.get(j).getTitle()%>">
						<img src="./netflix_img/<%=contents.get(j).getTitle()%>.jpg" />
						</a> 
					<% }%>
					</span>
				</div>
					<div class="list_cont">
					<span class="animatable"> 
					<%for (int j = 6; j < 12; j++) {%> 
						<a href="detailContent?data=<%=contents.get(j).getTitle()%>">
						<img src="./netflix_img/<%=contents.get(j).getTitle()%>.jpg" />
						</a> 
					<% }%>
					</span>
				</div>
					<div class="list_cont">
					<span class="animatable"> 
					<%for (int j = 6; j < 12; j++) {%> 
						<a href="detailContent?data=<%=contents.get(j).getTitle()%>">
						<img src="./netflix_img/<%=contents.get(j).getTitle()%>.jpg" />
						</a> 
					<% }%>
					</span>
				</div>
	</div> 
	<!-- 컨텐츠 박스 끝 지우면 애니메이션 효과 x -->
	<script type="text/javascript" src="./Js/contentsScoll.js"></script><!-- 스크롤기능 js -->
		
	<script type="text/javascript" src="./Js/main.js"></script>
</body>
</html>