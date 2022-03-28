<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
    <!-- Required meta tags -->
    <meta charset="utf-8" />
    <meta
      name="viewport"
      content="width=device-width, initial-scale=1, shrink-to-fit=no"
    />

<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>

<!-- fontawesome -->
<script src="https://kit.fontawesome.com/b7ee8a4337.js" crossorigin="anonymous"></script>

<!-- Bootstrap CSS -->
<link
  rel="stylesheet"
  href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/css/bootstrap.min.css"
  integrity="sha384-zCbKRCUGaJDkqS1kPbPd7TveP5iyJE0EjAuZQTgFLD2ylzuqKfdKlfG/eSrtxUkn"
  crossorigin="anonymous"
/>
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/chatbot-ui.css" />
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/font.css" />
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/adminpage.css" />
          
<title>ROCKET MARKET :: 관리자페이지</title>
<script src="https://code.jquery.com/jquery-1.12.4.min.js"></script>
<link rel="shortcut icon" type="image/x-icon" href="${pageContext.request.contextPath}/imgs/logo.png" />

<style>

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
      
    </style>
</head>
<body>

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
            

            <div class="navbar-nav" id="topmenu_right">
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

    <div class="pt-5 pb-5 mr-5 ml-5">
      <img src="${pageContext.request.contextPath}/imgs/admin.png" style="width: 50px;">
      <h1 style="font-weight: bold;"> <a href="${pageContext.request.contextPath}/admin/adminHome"> 관리자 페이지 </a></h1> 
      <br>
      <div class="d-flex justify-content-start align-items-center">
      <h2 style="font-weight: bold;"> 쿠폰관리 </h2>&nbsp;&nbsp;&nbsp;
      <h5><a href="${pageContext.request.contextPath}/admin/productManagement">상품목록</a></h5>&nbsp;&nbsp;&nbsp;
      <h5><a href="${pageContext.request.contextPath}/admin/memberList">회원 리스트</a></h5>
      <h5><a href="${pageContext.request.contextPath}/admin/adminHome">매출관리</a></h5>
      </div>
      
      
      <div class="coupon_div">
        <table class="table table-bordered text-center pt-5"  id="admin_coupon_table">
          <thead>
            <tr>
              <th scope="col-sm" id="table_coupon_num">쿠폰번호</th>
              <th scope="col-sm" id="table_coupon_name">쿠폰명</th>
              <th scope="col-sm" id="table_coupon_percent">할인율</th>
            </tr>
          </thead>
          <tbody>
			
	  <c:forEach var="coupon" items="${couponList}">
		<tr>
		  <td>${coupon.coupon_id}</td>
		  <td>${coupon.coupon_name}</td>
		  <td>${coupon.coupon_discount} %</td>	
		</tr>	
	  </c:forEach>

	</table>
	</div> <!-- coupon_div -->
	
	<p><a class="btn btn-outline-dark" href="${pageContext.request.contextPath}/admin/addCoupon"> 쿠폰등록하기 </a></p>
	
	</div>
	

	<br><br><br>

    <!-- ======================== 하단 메뉴 (푸터 동일) =========================== -->
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