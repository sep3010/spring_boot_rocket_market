<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="sec"
	uri="http://www.springframework.org/security/tags"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<!DOCTYPE html>
<html lang="kr">
<head>
<!-- Required meta tags -->
<meta charset="utf-8" />
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no" />
<!-- Bootstrap CSS -->

<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/css/bootstrap.min.css"
	integrity="sha384-zCbKRCUGaJDkqS1kPbPd7TveP5iyJE0EjAuZQTgFLD2ylzuqKfdKlfG/eSrtxUkn"
	crossorigin="anonymous" />
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/css/font.css" />

<title>ROCKET MARKET :: 신속배송</title>
<script src="https://code.jquery.com/jquery-1.12.4.min.js"></script>
<link rel="shortcut icon" type="image/x-icon"
	href="${pageContext.request.contextPath}/imgs/logo.png" />

<!-- jQuery -->
<script type="text/javascript"
	src="https://code.jquery.com/jquery-1.12.4.min.js"></script>
<!-- iamport.payment.js -->
<script type="text/javascript"
	src="https://cdn.iamport.kr/js/iamport.payment-1.1.8.js"></script>

<!-- csrf meta tag -->
<meta name="_csrf" content="${_csrf.token}" />
<meta name="_csrf_header" content="${_csrf.headerName}" />
</head>
<style>

/* COMMONS */
.order-payment__container {
	width: 70%;
	margin: 0 auto;
}

a {
	text-decoration: none !important;
	color: black;
}

li {
	list-style-type: none;
}

.description {
	border: 1px solid orange;
	width: 80%;
	height: 100px;
}

nav a {
	color: gray;
	display: block;
	padding: 10px;
}

nav a:hover {
	color: orange;
}

.information-delivery {
	border-top: 2px solid gray;
	border-bottom: 1px solid lightgray;
}

.row {
	padding: 16px 0;
}

.order-group img {
	width: 80px;
	height: 80px;
	border-radius: 5px;
}

.money {
	margin: 0 auto;
	display: flex;
	justify-content: space-around;
	font-size: 20px;
	width: 100%;
	padding: 10px;
	border-top: 1px solid lightgray;
}

.price {
	width: 100px;
	border: 1px solid lightgray;
	display: flex;
	justify-content: center;
	border-radius: 50px;
}

input[value="결제하기"] {
	width: 10em;
	height: 60px;
	font-size: 2em;
	font-weight: bold;
	color: white;
	background: tomato;
	border: none;
	border-radius: 5px;
}

.discount-type input[type="text"] {
	border: 1px solid lightgray;
	border-radius: 5px;
}

.btn {
	border: 1px solid tomato;
	width: 120px;
	height: 25px;
	box-sizing: border-box;
	line-height: 12px;
	font-weight: bold;
}

.btn:hover {
	background: tomato;
	color: #fff;
	transition: .3s;
}

pre {
	font-family: "Pretendard-Regular";
}

.order-group {
	display: flex;
	justify-content: space-around;
	align-items: center;
}

.product {
	width: 50%;
	font-size: 20px;
	display: flex;
	justify-content: space-between;
}

.product p {
	font-size: 24px;
	font-weight: bold;
	line-height: 80px;
}

.order {
	width: 30%;
	font-size: 20px;
}

.order p {
	width: 24px;
	font-weight: bold;
}

.information-other {
	display: flex;
	flex-direction: column;
	justify-content: center;
}

#coupon-group {
	border: 1px solid lightgray;
	width: 200px;
	height: 30px;
	border-radius: 5px;
}

#topmenu_left, #topmenu_right {
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
	top: 10px;
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

.card {
	border: none;
}

.card-body {
	font-weight: bold;
}
</style>
<header>


	<!-- ======================== 상단 메뉴 =========================== -->
	<div class="container pb-2">
		<nav class="navbar navbar-expand-md navbar-light">
			<button class="navbar-toggler" type="button" data-toggle="collapse"
				data-target="#navbarNavAltMarkup" aria-controls="navbarNavAltMarkup"
				aria-expanded="false" aria-label="Toggle navigation">
				<span class="navbar-toggler-icon"></span>
			</button>

			<div class="collapse navbar-collapse d-flex justify-content-between"
				id="navbarNavAltMarkup">
				<div class="navbar-nav" id="topmenu_left">
					<a class="nav-link"
						href="${pageContext.request.contextPath}/board/noticeHome">공지사항</a>
					<a class="nav-link"
						href="${pageContext.request.contextPath}/board/inquiryHome">문의</a>

				</div>

				<!-- 로그인을 안했다면 -->
				<div class="navbar-nav" id="topmenu_right">
					<sec:authorize access="isAnonymous()">
						<a class="nav-link"
							href="${pageContext.request.contextPath}/loginForm">로그인</a>
						<a class="nav-link"
							href="${pageContext.request.contextPath}/basicaddMemberForm">회원가입</a>
						<a class="nav-link"
							href="${pageContext.request.contextPath}/user/userHome">마이페이지</a>
					</sec:authorize>


					<!-- 로그인을 했다면 -->
					<sec:authorize access="isAuthenticated()">
						<div style="align-self: center"><sec:authentication property="principal.memberVO.nickname"/>님
							환영합니다.&nbsp;&nbsp;</div>
						<a class="nav-link" type="button"
							onclick="document.getElementById('logout-form').submit();">로그아웃</a>
						<form:form id="logout-form"
							action="${pageContext.request.contextPath}/logout" method="POST">
							<input type="hidden" />
						</form:form>

						<!-- 관리자 -->
						<sec:authorize access="hasRole('ROLE_ADMIN')">
							<a class="nav-link"
								href="${pageContext.request.contextPath}/admin/adminHome">관리자홈</a>
							<a class="nav-link"
								href="${pageContext.request.contextPath}/admin/productManagement">상품관리</a>
							<a class="nav-link"
								href="${pageContext.request.contextPath}/admin/memberList">회원관리</a>
						</sec:authorize>
						<!-- 회원 -->
						<sec:authorize access="hasRole('ROLE_USER')">
							<a class="nav-link"
								href="${pageContext.request.contextPath}/user/userHome">마이페이지</a>
							<a class="nav-link"
								href="${pageContext.request.contextPath}/user/wishList">위시리스트</a>
							<a class="nav-link"
								href="${pageContext.request.contextPath}/user/cart">장바구니</a>
						</sec:authorize>
					</sec:authorize>

				</div>
				<!-- <div class="navbar-nav" id="topmenu_right"> -->
			</div>
			<!-- collapse navbar-collapse -->


			<!-- ======================== 로고 =========================== -->
			<center>
				<div id="logo" style="width: 12rem">
					<a href="${pageContext.request.contextPath}/"><img
						src="${pageContext.request.contextPath}/imgs/locketlogo.png"
						class="card-img-top" /></a>
				</div>
			</center>
		</nav>
	</div>
	<!-- container -->

</header>


<!-- ======================== 하단 메뉴 =========================== -->

<div class="category shadow">
	<div class="container d-flex justify-content-between">
		<div class="dropdown">
			<div class="text-center">
				<button class="dropbtn d-flex justify-content-start">
					<img class="mr-2 mt-1"
						src="${pageContext.request.contextPath}/imgs/category.png" alt=""
						style="width: 21px; height: 17px" />전체 카테고리
				</button>
			</div>
			<div class="dropdown-content">
				<a class="dropdown-item"
					href="${pageContext.request.contextPath}/categoryProduct/vegetable"><img
					class="mr-2"
					src="${pageContext.request.contextPath}/imgs/vegetable.png"
					style="width: 21px; height: 21px" />채소/과일</a> <a
					class="dropdown-item"
					href="${pageContext.request.contextPath}/categoryProduct/meat"><img
					class="mr-2" src="${pageContext.request.contextPath}/imgs/meat.png"
					style="width: 21px; height: 21px" />육류</a> <a
					class="dropdown-item"
					href="${pageContext.request.contextPath}/categoryProduct/side"><img
					class="mr-2" src="${pageContext.request.contextPath}/imgs/rise.png"
					style="width: 21px; height: 21px" />국/반찬</a> <a
					class="dropdown-item"
					href="${pageContext.request.contextPath}/categoryProduct/snack"><img
					class="mr-2"
					src="${pageContext.request.contextPath}/imgs/snack.png" alt=""
					style="width: 21px; height: 21px" />간식/과자</a> <a
					class="dropdown-item"
					href="${pageContext.request.contextPath}/categoryProduct/dairy"><img
					class="mr-2"
					src="${pageContext.request.contextPath}/imgs/cheese.png"
					style="width: 21px; height: 21px" />유제품</a> <a
					class="dropdown-item"
					href="${pageContext.request.contextPath}/categoryProduct/instant"><img
					class="mr-2"
					src="${pageContext.request.contextPath}/imgs/instant.png"
					style="width: 21px; height: 21px" />즉석식품</a>
			</div>
		</div>
		<div id="categorymenu">
			<a class="btn btn-light"
				href="${pageContext.request.contextPath}/newProduct" role="button"
				id="categorybtn">신상품</a> <a class="btn btn-light"
				href="${pageContext.request.contextPath}/bestProduct" role="button"
				id="categorybtn">베스트상품</a> <a class="btn btn-light"
				href="${pageContext.request.contextPath}/saleProduct" role="button"
				id="categorybtn">특가상품</a> <a class="btn btn-light"
				href="${pageContext.request.contextPath}/subscribeProduct"
				role="button" id="categorybtn">정기배송상품</a>
		</div>
	</div>
</div>
<!-- ======================== 여기까지 헤더 (동일)=========================== -->


<div class="text-center pt-5 pb-5">

	<h2 class="pb-3" style="font-weight: bold;">주문 완료</h2>

	<img
		src="${pageContext.request.contextPath}/resources/order-image/box.png"
		style="width: 15rem;">

	<p class="pt-3">
	<h5 style="font-weight: bold;">
		<sec:authentication property="principal.memberVO.name" />
		님의 주문이 완료되었습니다!
	</h5>
	</p>
	<p>
	<h5 class="pb-3" style="font-weight: bold;">로켓타고 달려갈게요 🚀</h5>
	</p>


	<table class="table"
		style="width: 30rem; margin: 0px; display: inline; border: 0px;">
		<tr>
			<td class="text-left" style="font-weight: bold;">🤎 구매내역</td>
			<td class="text-left"><%=session.getAttribute("product_name")%></td>
		</tr>

		<tr>
			<td class="text-left" style="font-weight: bold;">🤎 사용 적립금</td>
			<td class="text-left"><%=session.getAttribute("input_point")%>
				원</td>
		</tr>

		<tr>
			<td class="text-left" style="font-weight: bold;">🤎 주문 번호</td>
			<td class="text-left"><%=session.getAttribute("merchantid")%></td>
		</tr>

		<tr>
			<td class="text-left" style="font-weight: bold;">🤎 운송장 번호</td>
			<td class="text-left"><%=session.getAttribute("delivery_number")%></td>
		</tr>

		<tr
			style="font-size: 1.2rem; font-weight: bold; color: rgb(139, 96, 43);">
			<td class="text-left" style="font-weight: bold;">🤎 총 결제 금액</td>
			<td class="text-left"><%=session.getAttribute("amount")%> 원</td>
		</tr>

	</table>


	<div class="pt-3">
		<!-- 버튼 -->
		<a class="btn btn-outline-dark"
			href="${pageContext.request.contextPath}/">홈으로 가기</a> <a
			class="btn btn-outline-dark"
			href="${pageContext.request.contextPath}/user/orderhistory">주문 내역
			확인</a>
	</div>


</div>
<!-- div class="text-center pt-5 pb-5" -->

</div>
<!-- container -->






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
    <script src="https://cdn.jsdelivr.net/npm/jquery@3.5.1/dist/jquery.min.js" integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj" crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js" integrity="sha384-9/reFTGAW83EW2RDu2S0VKaIzap3H66lZH81PoYlFhbGU+6BZp6G7niu735Sk7lN" crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/js/bootstrap.min.js" integrity="sha384-VHvPCCyXqtD5DqJeNxl2dtTyhF78xXNXdkwX1CZeRusQfRKp+tA7hAShOK/B/fQ2" crossorigin="anonymous"></script>
    -->
  </body>
</body>
</html>