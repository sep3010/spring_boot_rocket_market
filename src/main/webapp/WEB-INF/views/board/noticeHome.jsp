<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags"%>
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
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/chatbot-ui.css" />
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/font.css" />

    <title>ROCKET MARKET :: 신속배송</title>
 
    <link rel="shortcut icon" type="image/x-icon" href="${pageContext.request.contextPath}/imgs/logo.png" />

	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
    
    <style>
      main {
      position: relative;
      }
      body {
        min-width: 1400px;
      }
      /* ========== 공지사항홈 ========== */
      /* 공통사항 */
      .center__container a {
        text-decoration: none !important;
        color: black;
      }
      .center__container a:hover {
        color: orange;
        font-weight: bold;
      }

      .center__container li {
        list-style-type: none;
      }
      /* 공통사항 끝*/
      .center {
        margin-top: 70px;
        margin-bottom: 70px;
      }
      #navigation a {
        width: 150px;
        display: flex;
        justify-content: space-between;
        border: 1px solid lightgray;
        padding: 10px;
      }
      .board__container {
        display: flex;
        flex-direction: column;
        align-items: center;
      }
      .board-content {
        font-size: .8em;

      }

     

      /* 테이블 헤더*/
      .board-title {
        border-top: 2px solid gray;
        border-bottom: 1px solid lightgray;
      }
      .title, .writer, .date, .delete-box, .hit {
        padding: 20px;
        display: flex;
        justify-content: center;
        font-weight: bold;
        border-bottom: 1px solid lightgray;
      }
      .title {
        width: 620px;
      }
      .writer {
        width: 150px;
      }
      .date {
        width: 150px;
      }
      .hit {
      	width: 80px;
      }
      .delete-box {
        width: 40px;
      }
      
      
      
      /* 테이블 컨텐츠 */
      
      .content-writer, .content-date, .deleteBtn, .content-hit {
        padding: 20px;
        display: flex;
        justify-content: center;
        align-items: center;
      }
      
      .content-title {
        width: 620px;
        padding: 25px;
      }
      .content-writer {
        width: 150px;
      }
      .content-date {
        width: 150px;
      }
      .content-hit {
      	width: 80px;
      }
      .deleteBtn {
        width: 30px;
      }
      
      


      /* ========== 작업끝 ========== */



      /* 상단 멤버 정보 끝*/


      /* ========== 작업끝 ========== */
    
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
      /* 메인 포지션 렐러티브값 날렸습니다. 사이드바 포지션을 렐러티브로 수정했습니다. */
      .sidebar {
        margin-top: 10px;
        margin-right: 10px;
        width: 100px;
        position: absolute;
        top:10px;
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
        width: 80px;
        height: 80px;
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
      
      /* 페이징 스타일 */
      .paging__container {
          display: flex;
          justify-content: center;

      }
      #pre, #next, .page_number {
          display: flex;
          justify-content: center;
          align-items: center;
          width: 35px;
          height: 35px;
          border: 1px solid lightgray;
          font-size: 20px;
          color: black;
      }
      #pre:hover, #next:hover, .page_number:hover {
          background: #eeddbe;
          color: #fff;
          transition: .3s;
      }
      #pre {
          border-top-left-radius: 3px;
          border-bottom-left-radius: 3px;
      }
      
      #next {
        border-top-right-radius: 3px;
        border-bottom-right-radius: 3px;
      }
      .page_number {
        color: black;
      }
      
      .page_number:hover {
        color: black;
        background-color: #eeddbe;
      }
      
      
    </style>
    
    <!-- csrf meta tag -->
	<meta name="_csrf" content="${_csrf.token}"/>
	<meta name="_csrf_header" content="${_csrf.headerName}"/>

    <script>
    
 	// csrf
    var token = $("meta[name='_csrf']").attr("content");
    var header = $("meta[name='_csrf_header']").attr("content");
    
  	//Ajax spring security header..
	$(document).ajaxSend(function(e, xhr, options){
		xhr.setRequestHeader(header, token);
	});
    
    
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
            .animate({ top: position + currentPosition + "px" }, 900);
        });
		
        
        
        /* 개별 공지사항 삭제 비동기 */
        $('.delete').on('click', function(event){
        	event.preventDefault();
        	
        	
        	//var id = $(this).find('.delete').parent();
        	let trObj = $(this).parent().parent();
        	console.log("주소 : " + $(this).attr("href"));
        	$.ajax({
        		type: "DELETE",
        		url : $(this).attr("href"),
        		beforeSend: function(xhr) {
                    xhr.setRequestHeader("X-CSRF-Token", "${_csrf.token}");
                 },
	        	success : function(data) {
	        		if(data == "SUCCESS"){
	        			alert("삭제완료");
		        		$(trObj).remove();
	        		}
	        		
        	},
        	error : function(e) {
        		console.log(e);
        	}
        	});
        });

        
        
        


      });


    </script>
  </head>
<body>

<header>
	<!-- ======================== 배너 =========================== -->
	<div>
    	<nav class="navbar" id="topbanner">
          <a class="navbar-brand" href="${pageContext.request.contextPath}/basicaddMemberForm" style="color: rgb(90, 69, 42)"> 🤎 회원가입 혜택이 팡팡팡! 🤎 </a>
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
              <a class="nav-link" href="${pageContext.request.contextPath}/board/noticeHome">공지사항</a>
              <a class="nav-link" href="${pageContext.request.contextPath}/board/inquiryHome">문의</a>

            </div>
            
            <!-- 로그인을 안했다면 -->
            <div class="navbar-nav" id="topmenu_right">
            <sec:authorize access="isAnonymous()">
              <a class="nav-link" href="${pageContext.request.contextPath}/loginForm">로그인</a>
              <a class="nav-link" href="${pageContext.request.contextPath}/basicaddMemberForm">회원가입</a>
              <a class="nav-link" href="${pageContext.request.contextPath}/user/userHome">마이페이지</a>
             </sec:authorize>
             
 
            <!-- 로그인을 했다면 -->
			<sec:authorize access="isAuthenticated()">
			<div style="align-self:center">
			  ${userName }님 환영합니다.&nbsp;&nbsp;
			</div>
			  <a 
			  class="nav-link" 
			  type="button"
			  onclick="document.getElementById('logout-form').submit();"
			  >로그아웃</a>
			  <form:form id="logout-form" action="${pageContext.request.contextPath}/logout" method="POST">
				  <input type="hidden"/>
			  </form:form>
			  
			  <!-- 관리자 -->
				<sec:authorize access="hasRole('ROLE_ADMIN')">					
					<a class="nav-link" href="${pageContext.request.contextPath}/admin/adminHome">관리자홈</a>
             		<a class="nav-link" href="${pageContext.request.contextPath}/admin/productManagement">상품관리</a>
              		<a class="nav-link" href="${pageContext.request.contextPath}/admin/memberList">회원관리</a>
                </sec:authorize>				
			  <!-- 회원 -->
			    <sec:authorize access="hasRole('ROLE_USER')">
			    	<a class="nav-link" href="${pageContext.request.contextPath}/user/userHome">마이페이지</a>
              		<a class="nav-link" href="${pageContext.request.contextPath}/user/wishList">위시리스트</a>
              		<a class="nav-link" href="${pageContext.request.contextPath}/user/cart">장바구니</a>
                </sec:authorize>
			</sec:authorize>             
             
            </div><!-- <div class="navbar-nav" id="topmenu_right"> -->
        </div><!-- collapse navbar-collapse -->


		<!-- ======================== 로고 =========================== -->
        <center>
        	<div id="logo" style="width: 12rem">
              <a href="${pageContext.request.contextPath}/"><img src="${pageContext.request.contextPath}/imgs/locketlogo.png" class="card-img-top"/></a>
            </div>
        </center>
	</nav>
  </div><!-- container -->
      
</header>
    
<!-- ======================== 하단 메뉴 =========================== -->
	
	<div class="category shadow">
      <div class="container d-flex justify-content-between">
        <div class="dropdown">
          <div class="text-center">
            <button class="dropbtn d-flex justify-content-start">
              <img
                class="mr-2 mt-1"
                src="${pageContext.request.contextPath}/imgs/category.png"
                alt=""
                style="width: 21px; height: 17px"
              />전체 카테고리
            </button>
          </div>
          <div class="dropdown-content">
            <a class="dropdown-item" href="${pageContext.request.contextPath}/categoryProduct/vegetable"
              ><img
                class="mr-2"
                src="${pageContext.request.contextPath}/imgs/vegetable.png"
                alt=""
                style="width: 21px; height: 21px"
              />채소/과일</a
            >
            <a class="dropdown-item" href="${pageContext.request.contextPath}/categoryProduct/meat"
              ><img
                class="mr-2"
                src="${pageContext.request.contextPath}/imgs/meat.png"
                alt=""
                style="width: 21px; height: 21px"
              />육류</a
            >
            <a class="dropdown-item" href="${pageContext.request.contextPath}/categoryProduct/side"
              ><img
                class="mr-2"
                src="${pageContext.request.contextPath}/imgs/rise.png"
                alt=""
                style="width: 21px; height: 21px"
              />국/반찬</a
            >
            <a class="dropdown-item" href="${pageContext.request.contextPath}/categoryProduct/snack"
              ><img
                class="mr-2"
                src="${pageContext.request.contextPath}/imgs/snack.png"
                alt=""
                style="width: 21px; height: 21px"
              />간식/과자</a
            >
            <a class="dropdown-item" href="${pageContext.request.contextPath}/categoryProduct/dairy"
              ><img
                class="mr-2"
                src="${pageContext.request.contextPath}/imgs/cheese.png"
                alt=""
                style="width: 21px; height: 21px"
              />유제품</a
            >
            <a class="dropdown-item" href="${pageContext.request.contextPath}/categoryProduct/instant"
              ><img
                class="mr-2"
                src="${pageContext.request.contextPath}/imgs/instant.png"
                alt=""
                style="width: 21px; height: 21px"
              />즉석식품</a
            >
          </div>
        </div>
        <div id="categorymenu">
          <a class="btn btn-light" href="${pageContext.request.contextPath}/newProduct" role="button" id="categorybtn">신상품</a>
          <a class="btn btn-light" href="${pageContext.request.contextPath}/bestProduct" role="button" id="categorybtn">베스트상품</a>
          <a class="btn btn-light" href="${pageContext.request.contextPath}/saleProduct" role="button" id="categorybtn">특가상품</a>
          <a class="btn btn-light" href="${pageContext.request.contextPath}/subscribeProduct" role="button" id="categorybtn">정기배송상품</a>
        </div>
      </div>
    </div>
    <!-- ======================== 여기까지 헤더 (동일)=========================== -->

	<!-- ======================== 캐러셀 =========================== -->
    <div
      id="carouselExampleInterval"
      class="carousel slide"
      data-ride="carousel"
    >
      <div class="carousel-inner">
        <div class="carousel-item active" data-interval="10000">
          <a href=""><img src="${pageContext.request.contextPath}/imgs/slide1.png" class="d-block w-100"/></a>
        </div>
        <div class="carousel-item" data-interval="2000">
          <a href=""><img src="${pageContext.request.contextPath}/imgs/slide2.png" class="d-block w-100"/></a>
        </div>
        <div class="carousel-item">
          <a href=""><img src="${pageContext.request.contextPath}/imgs/slide3.png" class="d-block w-100"/></a>
        </div>
        <div class="carousel-item">
          <a href=""><img src="${pageContext.request.contextPath}/imgs/slide4.png" class="d-block w-100"/></a>
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
            <a href="${pageContext.request.contextPath}/user/cart" title="장바구니 이동">장바구니</a>
          </div>
          <div class="text-center pt-0 pb-3" id="sidecontent">
          
          <!-- 장바구니에 있는 상품 표시 -->
            <sec:authorize access="isAnonymous()"><!-- 비로그인시 -->
				로그인 후 사용 가능합니다.
            </sec:authorize>
   
			<sec:authorize access="isAuthenticated()"><!-- 로그인시 -->
			  <c:forEach var="cart" items="${cartProductList}" varStatus="status" begin="0" end="2">
		        <a href="${pageContext.request.contextPath}/product/productView/${cart.product_id}">
		        <img class="pt-1" src="${cart.path}" id="sideimg"/></a>			
			  </c:forEach>
			</sec:authorize>            

          </div>
        </div>
        
        <!-- ======= 챗봇 ======= -->
        <div class="text-center mt-3 mb-3" id="chatbox">
          <div id="chat-container">
            <script src="${pageContext.request.contextPath}/js/chatbot-ui.js"></script>
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
      
      
      
      <!-- ========== 공지사항 홈 ========== -->
      <div class="center">
        <div class="center__container d-flex justify-content-center">
          <nav id="navigation" class="pt-2">
            <ul>
              <p style="font-size: 20px; font-weight: bold;">고객센터</p>
              <li><a href="${pageContext.request.contextPath}/board/noticeHome" class="font-weight-bold">공지사항<span>></span></a></li>
              <li><a href="${pageContext.request.contextPath}/board/inquiryHome" class="border-top-0">문의사항<span>></span></a></li>
              
            </ul>
          </nav>
          <div class="board__container ml-5">
            <div class="board mb-5">
              <div class="d-flex justify-content-between">
              	<p style="font-size: 30px; font-weight: bold;">공지사항</p>
              <sec:authorize access="hasRole('ROLE_ADMIN')"><!-- 관리자 로그인시 -->
			    <div class="text-center">
			    	<a href="${pageContext.request.contextPath}/board/admin/notice_write_view" class="btn btn-outline-secondary mt-3">공지작성</a>
			    </div>
			  </sec:authorize>
              </div> 
              <div class="board-title d-flex">
                <div class="title">제목</div>
                <div class="writer">작성자</div>
                <div class="date">작성일</div>
                <div class="hit">조회</div>
	            <sec:authorize access="hasRole('ROLE_ADMIN')"><!-- 관리자 로그인시 -->
                	<div class="delete-box"></div>
                </sec:authorize>
              </div>
              <c:forEach var="notice" items="${BoardPaging}">
              
              <div class="board-content d-flex">
                <div class="content-title">
                	<a href="${pageContext.request.contextPath}/board/notice_content_view/${notice.id}">${notice.title}</a>
                </div>
                <div class="content-writer">RocketMarket</div>
                <div class="content-date">${notice.board_date}</div>
                <div class="content-hit">${notice.hit}</div>
   	            <sec:authorize access="hasRole('ROLE_ADMIN')"><!-- 관리자 로그인시 -->
	                <div class="deleteBtn">
	                	<a href="${pageContext.request.contextPath}/board/admin/delete_notice/${notice.id}" class="delete">
	                	<img src="${pageContext.request.contextPath}/imgs/close_img.png" width="30px"/>
	                	</a>
	                </div>
	            </sec:authorize>
              </div>
              </c:forEach>
              
              
              
              <div class="board-footer border-bottom"></div>
                 
            </div>
            <div class="paging__container d-flex">
              <c:if test="${pageMaker.pre}">
<%-- 				<a href="${pageContext.request.contextPath}/board/noticeHome${pageMaker.makeQuery(pageMaker.startPage - 1) }" id="pre">«</a> --%>
			  </c:if>
	
		<!-- 링크를 걸어준다 1-10페이지까지 페이지를 만들어주는것  -->
			  <c:forEach var="idx" begin="${pageMaker.startPage }"
			    	end="${pageMaker.endPage }">
				  <a href="${pageContext.request.contextPath}/board/noticeHome${pageMaker.makeQuery(idx)}" class="page_number">${idx}</a>
			  </c:forEach>
	
			<c:if test="${pageMaker.next && pageMaker.endPage > 0}">
				<a href="${pageContext.request.contextPath}/board/noticeHome${pageMaker.makeQuery(pageMaker.endPage +1) }" id="next"> » </a>
			</c:if>
            </div>
        </div>
      </div>            
  </div>
          
      <!-- 공지사항 끝 -->	    
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
      src="https://cdn.jsdelivr.net/npm/jquery@3.5.1/dist/jquery.min.js"
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