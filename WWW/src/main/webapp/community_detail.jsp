<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
 
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>


    <link rel="canonical" href="https://getbootstrap.com/docs/5.3/examples/footers/">
    <link rel="stylesheet" href="./styles/footer,header.css">
    <link rel="stylesheet" href="./styles/community_detail.css">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/css/bootstrap.min.css" rel="stylesheet"
        integrity="sha384-GLhlTQ8iRABdZLl6O3oVMWSktQOp6b7In1Zl3/Jr59b6EGGoI1aFkw7cmDA6j6gD" crossorigin="anonymous">


    <!-- header꺼 -->
    <link rel="canonical" href="https://getbootstrap.kr/docs/5.2/examples/navbar-fixed/">

    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet"
        integrity="sha384-rbsA2VBKQhggwzxH7pPCaAqO46MgnOM80zW1RWuH61DGLwZJEdK2Kadq2F9CUG65" crossorigin="anonymous">

    <!-- 검색창용 -->
	<link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
	<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
	<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
	<script src="./Js/footer,header_auto_search.js"></script>
    
    <!-- 드래그 앤 드랍용 검색창 -->
    <script src="./Js/dragndrop.js"></script>


    <!-- 메인꺼 -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet"
        integrity="sha384-rbsA2VBKQhggwzxH7pPCaAqO46MgnOM80zW1RWuH61DGLwZJEdK2Kadq2F9CUG65" crossorigin="anonymous">
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"
        integrity="sha384-kenU1KFdBIe4zVF0s0G1M5b4hcpxyD9F7jL+jjXkk+Q2h455rYXK/7HAuoJl+0I4"
        crossorigin="anonymous"></script>


    <!-- js쓸라고 -->
    <!-- 체크박스에 쓴 아이들 -->
    <script src="./Js/community_detail.js"></script>
    
    
    
</head>
<body>

    <!-- 헤더 시작 -->
    <nav class="navbar navbar-expand-md navbar-dark fixed-top bg-dark" style="z-index: 1 !important;">
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
                        <a class="nav-link active" style="font-size : 13pt" aria-current="page" href="main.jsp">홈</a>
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


                <form class="d-flex" role="search" align="center" action="">
                    <input id="searchInput" style="margin-right: 10px; width: 400px; z-index: 2;" name="search"
                        placeholder=" 검색어를 입력해주세요.">
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




    <!-- main -->

    <main>
        <div class="wrapper">
            <!--상단 이미지-->
            <section id="top_img">
                <div class="background">
                    <img src="http://placehold.it/1500X300/" alt="">
                </div>
            </section>


            <div class=contents_wrap>

                <div id="title">
                    <!-- 체크박스에서 넣은 결과 출력해주는 공간 -->
                    <h3 style="color:white">
                        <div id="hash_result"></div>
                    </h3>
                </div>
                <!-- 체크박스에서 넣은 결과 출력해주는 공간 -->


                <!-- 버튼 정렬때문에 테이블 안으로 넣음 -->
                <table class="hash_tb">
                    <td>
                        <tr>
                            <div class="hashtag">
                                <form action="" name="hashtag_form">
                                    <div class="accordion" id="accordionExample">
                                        <div class="accordion-item">
                                            <h2 class="accordion-header" id="headingOne">
                                                <button class="accordion-button" type="button" data-bs-toggle="collapse"
                                                    data-bs-target="#collapseOne" aria-expanded="true"
                                                    aria-controls="collapseOne">
                                                    <strong>장르</strong>
                                                </button>
                                            </h2>


                                            <div id="collapseOne" class="accordion-collapse collapse show"
                                                aria-labelledby="headingOne" data-bs-parent="#accordionExample">
                                                <div class="accordion-body">

                                                    <!-- getCheckboxValue()가 체크박스 클릭했을때 위로 보내주는 JS임! -->
                                                    <input class="hash_check" type="checkbox" name="hash_name"
                                                        value="코미디" onclick='getCheckboxValue(),checkStr()'> 코미디
                                                    <input class="hash_check" type="checkbox" name="hash_name"
                                                        value="액션" onclick='getCheckboxValue(),checkStr()'> 액션
                                                    <input class="hash_check" type="checkbox" name="hash_name"
                                                        value="가족" onclick='getCheckboxValue(),checkStr()'> 가족
                                                    <input class="hash_check" type="checkbox" name="hash_name"
                                                        value="SF" onclick='getCheckboxValue(),checkStr()'> SF
                                                    <input class="hash_check" type="checkbox" name="hash_name"
                                                        value="공포" onclick='getCheckboxValue(),checkStr()'> 공포
                                                    <input class="hash_check" type="checkbox" name="hash_name"
                                                        value="범죄" onclick='getCheckboxValue(),checkStr()'> 범죄
                                                    <input class="hash_check" type="checkbox" name="hash_name"
                                                        value="로맨스코미디" onclick='getCheckboxValue(),checkStr()'> 로맨스코미디
                                                    <input class="hash_check" type="checkbox" name="hash_name"
                                                        value="미스터리" onclick='getCheckboxValue(),checkStr()'> 미스터리


                                                </div>
                                            </div>


                                        </div>
                                        <div class="accordion-item">
                                            <h2 class="accordion-header" id="headingTwo">
                                                <button class="accordion-button collapsed"
                                                    style="background-color: black;color: white; " type="button"
                                                    data-bs-toggle="collapse" data-bs-target="#collapseTwo"
                                                    aria-expanded="false" aria-controls="collapseTwo">
                                                    <strong>감정</strong>
                                                </button>
                                            </h2>
                                            <div id="collapseTwo" class="accordion-collapse collapse"
                                                aria-labelledby="headingTwo" data-bs-parent="#accordionExample">
                                                <div class="accordion-body">
                                                    <input class="hash_check" type="checkbox" name="hash_name"
                                                        value="슬픔" onclick='getCheckboxValue(),checkStr()'> 슬픔
                                                    <input class="hash_check" type="checkbox" name="hash_name"
                                                        value="재미" onclick='getCheckboxValue(),checkStr()'> 재미
                                                    <input class="hash_check" type="checkbox" name="hash_name"
                                                        value="통쾌" onclick='getCheckboxValue(),checkStr()'> 통쾌
                                                    <input class="hash_check" type="checkbox" name="hash_name"
                                                        value="사랑" onclick='getCheckboxValue(),checkStr()'> 사랑
                                                    <input class="hash_check" type="checkbox" name="hash_name"
                                                        value="그리움" onclick='getCheckboxValue(),checkStr()'>
                                                    그리움

                                                </div>
                                            </div>
                                        </div>
                                        <div class="accordion-item">
                                            <h2 class="accordion-header" id="headingThree">
                                                <button class="accordion-button collapsed"
                                                    style="background-color:#ff7600 ; color: white; " type="button"
                                                    data-bs-toggle="collapse" data-bs-target="#collapseThree"
                                                    aria-expanded="false" aria-controls="collapseThree">
                                                    <strong>연령</strong>
                                                </button>
                                            </h2>
                                            <div id="collapseThree" class="accordion-collapse collapse"
                                                aria-labelledby="headingThree" data-bs-parent="#accordionExample">
                                                <div class="accordion-body">
                                                    <input class="hash_check" type="checkbox" name="hash_name"
                                                        value="성인" onclick='getCheckboxValue(),checkStr()'> 성인
                                                    <input class="hash_check" type="checkbox" name="hash_name"
                                                        value="학생" onclick='getCheckboxValue(),checkStr()'> 학생
                                                    <input class="hash_check" type="checkbox" name="hash_name"
                                                        value="어린이" onclick='getCheckboxValue(),checkStr()'> 어린이
                                                    <input class="hash_check" type="checkbox" name="hash_name"
                                                        value="2030" onclick='getCheckboxValue(),checkStr()'> 2030
                                                    <input class="hash_check" type="checkbox" name="hash_name"
                                                        value="7080" onclick='getCheckboxValue(),checkStr()'> 7080

                                                </div>
                                            </div>
                                        </div>
                                    </div>

                        </tr>
                    </td>

                    <!-- 버튼만 모아두는 행 -->
                    <tr>
                        <td>

                            <!-- 체크박스 값 보내기 -->
                            <button class="btn btn-primary" type="submit"
                                style="background-color : #ff7600; border:none">SUBMIT</button>

                            </form>
                            <!-- 전체 리셋 버튼 -->
                            <button class="btn btn-prsimary" type="button" onclick='reset()'
                                style="background-color : #ff7600; color:white ">ALLRESET</button>
                        </td>
                    </tr>

                </table>









                <div class="dd_container" >
                <br>
                    <div class="d_container" >
                        <button class="draggable" draggable="true"><img src="http://placehold.it/160X230" />
                        </button>
                        <button class="draggable" draggable="true"><img src="http://placehold.it/160X230" /></button>
                    </div>
                    <div class="d_container" style = "height : 350px" >


                        <form class="d-flex" role="search" align="left" action="">
                            <input id="searchInput_2" style="margin-right: 10px; width: 400px; z-index: 2;"
                                name="search" placeholder=" 검색어를 입력해주세요.">
                            <button type="submit" class="btn btn-outline-warning">
                                검색
                            </button>
                        </form>



                        <button class="draggable" draggable="true"><img src="http://placehold.it/160X230" /></button>
                        <button class="draggable" draggable="true"><img src="http://placehold.it/160X230" /></button>
                    </div>
                </div>








      
      
      
        <!-- 발바닥 -->
  <div class="container">
    <footer>
      <svg xmlns="http://www.w3.org/2000/svg" style="display: none;">
        <symbol id="bootstrap" viewBox="0 0 118 94">
          <title>Bootstrap</title>
          <path fill-rule="evenodd" clip-rule="evenodd"
            d="M24.509 0c-6.733 0-11.715 5.893-11.492 12.284.214 6.14-.064 14.092-2.066 20.577C8.943 39.365 5.547 43.485 0 44.014v5.972c5.547.529 8.943 4.649 10.951 11.153 2.002 6.485 2.28 14.437 2.066 20.577C12.794 88.106 17.776 94 24.51 94H93.5c6.733 0 11.714-5.893 11.491-12.284-.214-6.14.064-14.092 2.066-20.577 2.009-6.504 5.396-10.624 10.943-11.153v-5.972c-5.547-.529-8.934-4.649-10.943-11.153-2.002-6.484-2.28-14.437-2.066-20.577C105.214 5.894 100.233 0 93.5 0H24.508zM80 57.863C80 66.663 73.436 72 62.543 72H44a2 2 0 01-2-2V24a2 2 0 012-2h18.437c9.083 0 15.044 4.92 15.044 12.474 0 5.302-4.01 10.049-9.119 10.88v.277C75.317 46.394 80 51.21 80 57.863zM60.521 28.34H49.948v14.934h8.905c6.884 0 10.68-2.772 10.68-7.727 0-4.643-3.264-7.207-9.012-7.207zM49.948 49.2v16.458H60.91c7.167 0 10.964-2.876 10.964-8.281 0-5.406-3.903-8.178-11.425-8.178H49.948z">
          </path>
        </symbol>
        <symbol id="facebook" viewBox="0 0 16 16">
          <path
            d="M16 8.049c0-4.446-3.582-8.05-8-8.05C3.58 0-.002 3.603-.002 8.05c0 4.017 2.926 7.347 6.75 7.951v-5.625h-2.03V8.05H6.75V6.275c0-2.017 1.195-3.131 3.022-3.131.876 0 1.791.157 1.791.157v1.98h-1.009c-.993 0-1.303.621-1.303 1.258v1.51h2.218l-.354 2.326H9.25V16c3.824-.604 6.75-3.934 6.75-7.951z" />
        </symbol>
        <symbol id="instagram" viewBox="0 0 16 16">
          <path
            d="M8 0C5.829 0 5.556.01 4.703.048 3.85.088 3.269.222 2.76.42a3.917 3.917 0 0 0-1.417.923A3.927 3.927 0 0 0 .42 2.76C.222 3.268.087 3.85.048 4.7.01 5.555 0 5.827 0 8.001c0 2.172.01 2.444.048 3.297.04.852.174 1.433.372 1.942.205.526.478.972.923 1.417.444.445.89.719 1.416.923.51.198 1.09.333 1.942.372C5.555 15.99 5.827 16 8 16s2.444-.01 3.298-.048c.851-.04 1.434-.174 1.943-.372a3.916 3.916 0 0 0 1.416-.923c.445-.445.718-.891.923-1.417.197-.509.332-1.09.372-1.942C15.99 10.445 16 10.173 16 8s-.01-2.445-.048-3.299c-.04-.851-.175-1.433-.372-1.941a3.926 3.926 0 0 0-.923-1.417A3.911 3.911 0 0 0 13.24.42c-.51-.198-1.092-.333-1.943-.372C10.443.01 10.172 0 7.998 0h.003zm-.717 1.442h.718c2.136 0 2.389.007 3.232.046.78.035 1.204.166 1.486.275.373.145.64.319.92.599.28.28.453.546.598.92.11.281.24.705.275 1.485.039.843.047 1.096.047 3.231s-.008 2.389-.047 3.232c-.035.78-.166 1.203-.275 1.485a2.47 2.47 0 0 1-.599.919c-.28.28-.546.453-.92.598-.28.11-.704.24-1.485.276-.843.038-1.096.047-3.232.047s-2.39-.009-3.233-.047c-.78-.036-1.203-.166-1.485-.276a2.478 2.478 0 0 1-.92-.598 2.48 2.48 0 0 1-.6-.92c-.109-.281-.24-.705-.275-1.485-.038-.843-.046-1.096-.046-3.233 0-2.136.008-2.388.046-3.231.036-.78.166-1.204.276-1.486.145-.373.319-.64.599-.92.28-.28.546-.453.92-.598.282-.11.705-.24 1.485-.276.738-.034 1.024-.044 2.515-.045v.002zm4.988 1.328a.96.96 0 1 0 0 1.92.96.96 0 0 0 0-1.92zm-4.27 1.122a4.109 4.109 0 1 0 0 8.217 4.109 4.109 0 0 0 0-8.217zm0 1.441a2.667 2.667 0 1 1 0 5.334 2.667 2.667 0 0 1 0-5.334z" />
        </symbol>
        <symbol id="twitter" viewBox="0 0 16 16">
          <path
            d="M5.026 15c6.038 0 9.341-5.003 9.341-9.334 0-.14 0-.282-.006-.422A6.685 6.685 0 0 0 16 3.542a6.658 6.658 0 0 1-1.889.518 3.301 3.301 0 0 0 1.447-1.817 6.533 6.533 0 0 1-2.087.793A3.286 3.286 0 0 0 7.875 6.03a9.325 9.325 0 0 1-6.767-3.429 3.289 3.289 0 0 0 1.018 4.382A3.323 3.323 0 0 1 .64 6.575v.045a3.288 3.288 0 0 0 2.632 3.218 3.203 3.203 0 0 1-.865.115 3.23 3.23 0 0 1-.614-.057 3.283 3.283 0 0 0 3.067 2.277A6.588 6.588 0 0 1 .78 13.58a6.32 6.32 0 0 1-.78-.045A9.344 9.344 0 0 0 5.026 15z" />
        </symbol>
      </svg>
    </footer>





    <footer class="d-flex flex-wrap justify-content-between align-items-center py-3 my-4 border-top">
      <div class="col-md-4 d-flex align-items-center">
        <a href="/" class="mb-3 me-2 mb-md-0 text-muted text-decoration-none lh-1">
          <svg class="bi" width="30" height="24">
            <use xlink:href="#bootstrap" />
          </svg>
        </a>
        <span class="mb-3 mb-md-0 text-muted">&copy; 스마트인재개발원</span>
      </div>

      <ul class="nav col-md-4 justify-content-end list-unstyled d-flex">
        <li class="ms-3"><a class="text-muted" href="#"><svg class="bi" width="24" height="24">
              <use xlink:href="#twitter" />
            </svg></a></li>
        <li class="ms-3"><a class="text-muted" href="#"><svg class="bi" width="24" height="24">
              <use xlink:href="#instagram" />
            </svg></a></li>
        <li class="ms-3"><a class="text-muted" href="#"><svg class="bi" width="24" height="24">
              <use xlink:href="#facebook" />
            </svg></a></li>
      </ul>
    </footer>
    <!-- 발바닥 끝 -->

  </div>
      
      
   <script type="text/javascript"> 


   const draggables = document.querySelectorAll(".draggable");
   const containers = document.querySelectorAll(".d_container");

   draggables.forEach(draggable => {
       draggable.addEventListener("dragstart", () => {
           draggable.classList.add("dragging");
       });

       draggable.addEventListener("dragend", () => {
           draggable.classList.remove("dragging");
       });
   });

   containers.forEach(container => {
       container.addEventListener("dragover", e => {
           e.preventDefault();
           const afterElement = getDragAfterElement(container, e.clientX);
           const draggable = document.querySelector(".dragging");
           if (afterElement === undefined) {
               container.appendChild(draggable);
           } else {
               container.insertBefore(draggable, afterElement);
           }
       });
   });

   function getDragAfterElement(container, x) {
       const draggableElements = [
           ...container.querySelectorAll(".draggable:not(.dragging)"),
       ];

       return draggableElements.reduce(
           (closest, child) => {
               const box = child.getBoundingClientRect();
               const offset = x - box.left - box.width / 2;
               // console.log(offset);
               if (offset < 0 && offset > closest.offset) {
                   return { offset: offset, element: child };
               } else {
                   return closest;
               }
           },
           { offset: Number.NEGATIVE_INFINITY}
       ).element;
   }
   
   
	
	
	// ----------체크박스-----------------
	
	// 체크박스 선택하면 위에 표시해주돌갷주는 친구
	function getCheckboxValue() {
	    // 선택된 목록 가져오기
	    const query = 'input[name="hash_name"]:checked';
	    const selectedEls =
	        document.querySelectorAll(query);
	
	    // 선택된 목록에서 value 찾기
	    let result = '';
	    selectedEls.forEach((el) => {
	        result += el.value + ' ';
	    });
	
	    // 출력
	    document.getElementById('hash_result').innerText
	        = result;
	}
	
	
	
	// 일정 숫자 이상 클릭하면 선택 완료구문 뜨면서 멈추게 하는거
	function checkStr() {
	    var vCnt = 0;
	    let list = [];
	    for (var i = 0; i < document.hashtag_form.elements.length; i++) {
	        if (document.hashtag_form.elements[i].name == 'hash_name') {
	            if (document.hashtag_form.elements[i].checked == true) {
	                vCnt++;
	                list.push(i);
	            }
	        }
	    }
	
	    if (vCnt > 2) {
	
	        alert(`💥 세개 선택 완료되었습니다 💥`);
	
	        return;
	    }
	}
	
	
	
	
	
	
	
	// 리셋버튼 누르면 실행되는거
	function reset() {
	
	    $(".hash_check").prop("checked", false);
	    alert(`💥 선택이 완료되었습니다. 💥`);
	}
	// ----------체크박스 끝---------------
	
	
	
	
	   
   
   

   </script> 






</body>
</html>