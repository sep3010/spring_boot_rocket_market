<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
    <!-- Required meta tags -->
    <meta charset="utf-8" />
    <meta
      name="viewport"
      content="width=device-width, initial-scale=1, shrink-to-fit=no"
    />
    <!-- Bootstrap CSS -->
    <link
      rel="stylesheet"
      href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/css/bootstrap.min.css"
      integrity="sha384-zCbKRCUGaJDkqS1kPbPd7TveP5iyJE0EjAuZQTgFLD2ylzuqKfdKlfG/eSrtxUkn"
      crossorigin="anonymous"
    />
    <link rel="stylesheet" href="./css/chatbot-ui.css" />

    <title>ROCKET MARKET :: 신속배송</title>
    <script src="https://code.jquery.com/jquery-1.12.4.min.js"></script>
    <link rel="shortcut icon" type="image/x-icon" href="./imgs/logo.png" />


    
    <style>

      @font-face {
          font-family: 'GmarketSansMedium';
          src: url('https://cdn.jsdelivr.net/gh/projectnoonnu/noonfonts_2001@1.1/GmarketSansMedium.woff') format('woff');
          font-weight: normal;
          font-style: normal;
      }

      @font-face {
          font-family: 'GmarketSansLight';
          src: url('https://cdn.jsdelivr.net/gh/projectnoonnu/noonfonts_2001@1.1/GmarketSansLight.woff') format('woff');
          font-weight: normal;
          font-style: normal;
      }

      @font-face {
      font-family: 'Pretendard-Regular';
      src: url('https://cdn.jsdelivr.net/gh/Project-Noonnu/noonfonts_2107@1.1/Pretendard-Regular.woff') format('woff');
      font-weight: 400;
      font-style: normal;
     } 

     *{
      font-family: 'Pretendard-Regular';
     }
      #topmenu_left,
      #topmenu_right {
        font-weight: bold;
        font-size: 0.9em;
      }

      .navbar {
        display: block;
      }

      #logo {
        justify-content: center;
      }

      #topbanner {
        text-align: center;
        background-color: #d3c5a8;
      }

      #footernavbar {
        font-size: 1em;
      }

      #footernavbar a {
        text-align: center;
        width: 14rem;
      }

      .dropbtn {
        background-color: #ffffff;
        width: 13rem;
        color: rgb(90, 88, 88);
        font-weight: bold;
        padding: 16px;
        font-size: 16px;
        border: none;
        cursor: pointer;
      }

      #categorybtn {
        background-color: #ffffff;
        width: 13.5rem;
        color: rgb(90, 88, 88);
        font-weight: bold;
        text-align: center;
        padding: 16px;
        font-size: 16px;
        border: none;
        cursor: pointer;
      }

      .dropdown {
        display: inline-block;
      }

      .dropdown-content {
        display: none;
        width: 13rem;
        position: absolute;
        background-color: #f9f9f9;
        min-width: 160px;
        box-shadow: 0px 8px 16px 0px rgba(0, 0, 0, 0.2);
        z-index: 2;
      }

      .dropdown-content a {
        color: black;
        padding: 12px 16px;
        text-decoration: none;
        display: block;
      }

      .dropdown-content a:hover {
        background-color: #d8c5a2;
      }

      .dropdown:hover .dropdown-content {
        display: block;
      }

      .dropdown:hover .dropbtn {
        background-color: #d8c5a2;
        color: rgb(90, 88, 88);
      }

      /*카테고리 상단 고정*/
      .category {
        position: sticky;
        top: 0px;
        background: #fff;
        z-index: 1;
      }

      /* 사이드바 */
      main {
        position: relative;
        top: 0px;
      }
      .sidebar {
        margin-top: 10px;
        margin-right: 10px;
        width: 100px;
        position: absolute;
        right: 10px;
        float: right;
        z-index: 3;
      }
      #cartbox {
        width: 100px;
        background-color: #eeddbe;
        border-radius: 10px;
      }

      #sideimg {
        width: 80%;
        height: 80%;
        position: relative;
      }

      /*장바구니 삭제 버튼*/
      #closebtn {
        position: absolute;
        top: 30px;
        right: 10px;
        z-index: 2;
      }

      #sidetitle a {
        text-decoration: none;
        color: black;
      }

      /*상단 페이지 이동*/

      #pagebtn {
        top: 60%;
        left: 80%;
        width: 100px;
        height: 50px;
        background-color: #eeddbe;
        border: 1px solid rgb(255, 255, 255);
        border-radius: 10px;
        top: 20px;
      }

      /*챗봇버튼*/

      .chat-btn {
        cursor: pointer;
        background-color: #ffffff;
        border: #ffffff;
        opacity: 1;
        transition: opacity 0.3s;
      }

      .card{
        border: none;
      }

      .card-body{
        font-weight: bold;
      }
      
    </style>

    <script>
      /*페이지 상단 이동*/
      function clickme() {
        window.scrollTo({ top: 0, left: 0, behavior: "smooth" });
      }

      /*장바구니_사이드바 애니메이션 효과*/
      $(document).ready(function () {
        var currentPosition = parseInt($(".sidebar").css("top"));
        $(window).scroll(function () {
          var position = $(window).scrollTop();
          $(".sidebar")
            .stop()
            .animate({ top: position + currentPosition + "px" }, 1000);
        });
      });


    </script>
  </head>
<body>

<header>
	<!-- ======================== 배너 =========================== -->
	<div>
    	<nav class="navbar" id="topbanner">
          <a class="navbar-brand" href="#" style="color: rgb(90, 69, 42)">배너 이벤트</a>
        </nav>
    </div>

	<!-- ======================== 상단 메뉴 =========================== -->
    <div class="container pb-2">
        <nav class="navbar navbar-expand-md navbar-light">
          <button
            class="navbar-toggler"
            type="button"
            data-toggle="collapse"
            data-target="#navbarNavAltMarkup"
            aria-controls="navbarNavAltMarkup"
            aria-expanded="false"
            aria-label="Toggle navigation">
            <span class="navbar-toggler-icon"></span>
          </button>
          
          <div
            class="collapse navbar-collapse d-flex justify-content-between"
            id="navbarNavAltMarkup">
            <div class="navbar-nav" id="topmenu_left">
              <a class="nav-link" href="#">공지사항</a>
              <a class="nav-link" href="#">문의</a>
              <a class="nav-link" href="#">이벤트</a>
            </div>
            
            <!-- 로그인을 안했다면 -->
            <div class="navbar-nav" id="topmenu_right">
            <sec:authorize access="isAnonymous()">
              <a class="nav-link" href="${pageContext.request.contextPath}/loginForm">로그인</a>
              <a class="nav-link" href="${pageContext.request.contextPath}/addMemberForm">회원가입</a>
              <a class="nav-link" href="${pageContext.request.contextPath}/user/userHome">마이페이지</a>
             </sec:authorize>
 
            <!-- 로그인을 했다면 -->
			<sec:authorize access="isAuthenticated()">
			  <!-- 관리자 -->
				<sec:authorize access="hasRole('ROLE_ADMIN')">
					<sec:authentication property="principal.memberVO.name"/>님 환영합니다.
					<!-- 로그아웃자리 -->
					<a class="nav-link" href="${pageContext.request.contextPath}/admin/adminHome">관리자홈</a>
             		<a class="nav-link" href="${pageContext.request.contextPath}/admin/productManagement">상품관리</a>
              		<a class="nav-link" href="${pageContext.request.contextPath}/admin/memberList">회원관리</a>

                </sec:authorize>				
			  <!-- 회원 -->
			    <sec:authorize access="hasRole('ROLE_USER')">
			    	<sec:authentication property="principal.memberVO.name"/>님 환영합니다.
					<!-- 로그아웃자리 -->
              		<a class="nav-link" href="${pageContext.request.contextPath}/user/userHome">마이페이지</a>
              		<a class="nav-link" href="#">위시리스트</a>
              		<a class="nav-link" href="#">장바구니</a>
                </sec:authorize>
			</sec:authorize>             
             
            </div><!-- <div class="navbar-nav" id="topmenu_right"> -->
        </div><!-- collapse navbar-collapse -->


		<!-- ======================== 로고 =========================== -->
        <center>
        	<div id="logo" style="width: 12rem">
              <img src="./imgs/locketlogo.png" class="card-img-top" alt="..." />
            </div>
        </center>
	</nav>
  </div><!-- container -->
      
</header>


	<!-- ======================== 제품 메뉴 =========================== -->
	<div class="category shadow">
      <div class="container d-flex justify-content-between">
        <div class="dropdown">
          <div class="text-center">
            <button class="dropbtn">
              <img
                class="mr-2"
                src="category.png"
                alt=""
                style="width: 21px; height: 17px"
              />전체 카테고리
            </button>
          </div>
          <div class="dropdown-content">
            <a class="dropdown-item" href="#"
              ><img
                class="mr-2"
                src="vegetable.png"
                alt=""
                style="width: 21px; height: 21px"
              />채소/과일</a
            >
            <a class="dropdown-item" href="#"
              ><img
                class="mr-2"
                src="meat.png"
                alt=""
                style="width: 21px; height: 21px"
              />육류</a
            >
            <a class="dropdown-item" href="#"
              ><img
                class="mr-2"
                src="rise.png"
                alt=""
                style="width: 21px; height: 21px"
              />국/반찬</a
            >
            <a class="dropdown-item" href="#"
              ><img
                class="mr-2"
                src="snack.png"
                alt=""
                style="width: 21px; height: 21px"
              />간식/과자</a
            >
            <a class="dropdown-item" href="#"
              ><img
                class="mr-2"
                src="cheese.png"
                alt=""
                style="width: 21px; height: 21px"
              />유제품</a
            >
            <a class="dropdown-item" href="#"
              ><img
                class="mr-2"
                src="instant.png"
                alt=""
                style="width: 21px; height: 21px"
              />즉석식품</a
            >
          </div>
        </div>
        <div id="categorymenu">
          <a class="btn btn-light" href="#" role="button" id="categorybtn"
            >신상품</a
          >
          <a class="btn btn-light" href="#" role="button" id="categorybtn"
            >베스트상품</a
          >
          <a class="btn btn-light" href="#" role="button" id="categorybtn"
            >특가상품</a
          >
          <a class="btn btn-light" href="#" role="button" id="categorybtn"
            >정기배송상품</a
          >
        </div>
      </div>
    </div>

	<!-- ======================== 캐러셀 =========================== -->
    <div
      id="carouselExampleInterval"
      class="carousel slide"
      data-ride="carousel"
    >
      <div class="carousel-inner">
        <div class="carousel-item active" data-interval="10000">
          <img src="./imgs/슬라이드1.png" class="d-block w-100" alt="..." />
        </div>
        <div class="carousel-item" data-interval="2000">
          <img src="./imgs/슬라이드1.png" class="d-block w-100" alt="..." />
        </div>
        <div class="carousel-item">
          <img src="./imgs/슬라이드1.png" class="d-block w-100" alt="..." />
        </div>
      </div>
      <button
        class="carousel-control-prev"
        type="button"
        data-target="#carouselExampleInterval"
        data-slide="prev"
      >
        <span class="carousel-control-prev-icon" aria-hidden="true"></span>
        <span class="sr-only">Previous</span>
      </button>
      <button
        class="carousel-control-next"
        type="button"
        data-target="#carouselExampleInterval"
        data-slide="next"
      >
        <span class="carousel-control-next-icon" aria-hidden="true"></span>
        <span class="sr-only">Next</span>
      </button>
    </div>
    
    <!-- ======================== 사이드바 =========================== -->
	<main>
	  <!-- ======= 장바구니 ======= -->
      <div class="sidebar">
        <div id="cartbox">
          <div class="text-center pt-2" id="sidetitle">
            <a href="" title="장바구니 이동">장바구니</a>
          </div>

          <div class="text-center pt-0 pb-3" id="sidecontent">
            <button
              type="button"
              class="close"
              aria-label="Close"
              id="closebtn"
            >
              <span aria-hidden="true">&times;</span>
            </button>
            <a href="#"
              ><img class="pt-1" src="고기.png" alt="" id="sideimg"
            /></a>
          </div>
        </div>
        
        <!-- ======= 챗봇 ======= -->
        <div class="text-center mt-3 mb-3" id="chatbox">
          <div id="chat-container">
            <script src="./js/chatbot-ui.js"></script>
            <script>
              createChatBot(
                (host = "http://121.156.99.38:5005/webhooks/rest/webhook"),
                (botLogo = "bot-logo.png"),
                (title = "Prime BOT"),
                (welcomeMessage =
                  "안녕하세요 로켓마켓 챗봇 입니다.\n무엇을 도와드릴까요? (●'∪'●)\n▪ 배송 \n▪ 회원 \n▪ 주문/결제 \n▪ 서비스 \n▪ 취소/교환/환불\n"),
                (inactiveMsg =
                  "서비가 다운되었습니다. 활성화하려면 개발자에게 문의하세요."),
                (theme = "purple")
              );
            </script>
          </div>
		  <!-- ======= 상단 페이지 이동버튼 ======= -->
          <div class="text-center mt-2" id="pagebox">
            <input
              id="pagebtn"
              type="button"
              alt=""
              value="Top ↑"
              onclick="clickme()"
            />
          </div>
        </div>
      </div>
      


	  <!-- ======================== 메인페이지 상품표시 =========================== -->
      <div class="container pt-5">

        <h2 class="text-center pb-3" style="font-weight: bold">오늘의 할인</h2>

        <div class="card-deck pb-5">
          <c:forEach var="discount" items="${discountList}" varStatus="status" begin="0" end="3">
          <div class="card">
          	<a href=""><img src="파스타.jpg" class="card-img-top" alt="..." /></a>
            <div class="card-body pl-1" style="border: none;">
              <h6 class="card-title">[${discount.brand}]${discount.name}</h6>
              <p class="card-text">
              <div class="price"><span class="rate text-danger">${discount.discount}% </span>
              <fmt:formatNumber value="${discount.price}" pattern="#,###"/>원
              </div>
              </p>
            </div><!-- card-body -->
          </div><!-- card -->
          </c:forEach>
          </div> <!-- card-deck -->
          	


        <h2 class="text-center pb-3" style="font-weight: bold">새로 나왔어요!</h2>

        <div class="card-deck pb-5">
          <c:forEach var="newList" items="${newList}" varStatus="status" begin="0" end="3">
          <div class="card">
             <a href=""><img src="파스타.jpg" class="card-img-top" alt="..." /></a>
            <div class="card-body pl-1" style="border: none;">
              <h6 class="card-title">[${newList.brand}] ${newList.name}</h6>
              <p class="card-text">
              <div class="price"><fmt:formatNumber value="${newList.price}" pattern="#,###"/>원
              </div>
              </p>
            </div><!-- card-body -->
          </div><!-- card -->
          </c:forEach>	
          </div> <!-- card-deck -->
         

          <h2 class="text-center pb-3" style="font-weight: bold">Best 인기 상품</h2>

        <div class="card-deck pb-5">
          <c:forEach var="newList" items="${newList}" varStatus="status" begin="0" end="3">
          <div class="card">
             <a href=""><img src="파스타.jpg" class="card-img-top" alt="..." /></a>
            <div class="card-body pl-1" style="border: none;">
              <h6 class="card-title">[${newList.brand}] ${newList.name}</h6>
              <p class="card-text">
              <div class="price"><fmt:formatNumber value="${newList.price}" pattern="#,###"/>원
              </div>
              </p>
            </div><!-- card-body -->
          </div><!-- card -->
          </c:forEach>	
          </div> <!-- card-deck --> 
         </div> <!-- container -->
         
                
    </main>
    
    
    <!-- ======================== 하단 메뉴 =========================== -->
	<hr class="m-0" />
    <div class="container">
      <footer class="pt-0">
        <nav class="navbar navbar-expand-lg navbar-light">
          <div class="navbar d-flex justify-content-center">
            <div class="navbar-nav" id="footernavbar">
              <a class="nav-link" href="#">로켓마켓소개</a>
              <a class="nav-link" href="#">이용약관</a>
              <a class="nav-link" href="#">개인정보처리방침</a>
              <a class="nav-link" href="#">이용안내</a>
              <a class="nav-link" href="#">문의하기</a>
            </div>
          </div>
        </nav>
      </footer>
    </div>
    <!-- container -->
    <hr class="m-0" />

    <!-- Optional JavaScript; choose one of the two! -->

    <!-- Option 1: jQuery and Bootstrap Bundle (includes Popper) -->
    <script
      src="https://cdn.jsdelivr.net/npm/jquery@3.5.1/dist/jquery.slim.min.js"
      integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj"
      crossorigin="anonymous"
    ></script>
    <script
      src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/js/bootstrap.bundle.min.js"
      integrity="sha384-fQybjgWLrvvRgtW6bFlB7jaZrFsaBXjsOMm/tB9LTS58ONXgqbR9W8oWht/amnpF"
      crossorigin="anonymous"
    ></script>

    <!-- Option 2: Separate Popper and Bootstrap JS -->
    <!--
    <script src="https://cdn.jsdelivr.net/npm/jquery@3.5.1/dist/jquery.slim.min.js" integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj" crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js" integrity="sha384-9/reFTGAW83EW2RDu2S0VKaIzap3H66lZH81PoYlFhbGU+6BZp6G7niu735Sk7lN" crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/js/bootstrap.min.js" integrity="sha384-VHvPCCyXqtD5DqJeNxl2dtTyhF78xXNXdkwX1CZeRusQfRKp+tA7hAShOK/B/fQ2" crossorigin="anonymous"></script>
    -->
  </body>
</html>
