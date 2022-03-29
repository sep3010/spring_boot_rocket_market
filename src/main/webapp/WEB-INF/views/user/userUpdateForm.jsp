<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>



<!DOCTYPE html>
<html lang="kr">
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>

<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css" integrity="sha384-MCw98/SFnGE8fJT3GXwEOngsV7Zt27NXFoaoApmYm81iuXoPkFOJwJ8ERdknLPMO" crossorigin="anonymous">
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.3/umd/popper.min.js" integrity="sha384-ZMP7rVo3mIykV+2+9J3UJ46jBk0WLaUAdn689aCwoqbBJiSnjAK/l8WvCWPIPm49" crossorigin="anonymous"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/js/bootstrap.min.js" integrity="sha384-ChfqqxuZUCnJSK3+MXmPNIyE6ZbWh2IMqE241rYiqJxyMiZ6OW/JmZQ5stwEULTy" crossorigin="anonymous"></script>
<link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.15.4/css/all.css" integrity="sha384-DyZ88mC6Up2uqS4h/KRgHuoeGwBcD4Ng9SiP4dIRy0EXTlnuz47vAwmeGwVChigm" crossorigin="anonymous">

<!-- csrf meta tag -->
<meta name="_csrf" content="${_csrf.token}"/>
<meta name="_csrf_header" content="${_csrf.headerName}"/>
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
	
<!-- 마이페이지 조회 -->

<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>

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
      
      #user_Info_table{
      	width: 600px; 
      	margin-top: 70px;
      }
      
    </style>

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
<script type="text/javascript">

//csrf
var token = $("meta[name='_csrf']").attr("content");
var header = $("meta[name='_csrf_header']").attr("content");

//Ajax spring security header..
$(document).ajaxSend(function(e, xhr, options){
	xhr.setRequestHeader(header, token);
});

 	$(document).ready(function(){
 		

		let username = $("#username").val();
		let nickname = $("#nickname").val();
		let name = $("#name").val();
		let phone = $("#phone").val();
		let postcode = $("#postcode").val();
		let address = $("#address").val();
		let birth = $("#birth").val();
		let email = $("#email").val();	



 		if (name == 'null' || phone == 'null' || postcode == 'null' || address == 'null' ||  email == 'null') {
			$("#name").val("");
			$("#phone").val("");
			$("#postcode").val("");
			$("#address").val("");
			$("#email").val("");
		} 
 		
		$("#updateSubmit").click(function(event){
			event.preventDefault();

			const id = <sec:authentication property="principal.memberVO.id"/>;
			let username = $("#username").val();
			let nickname = $("#nickname").val();
			let name = $("#name").val();
			let phone = $("#phone").val();
			let postcode = $("#postcode").val();
			let address = $("#address").val();
			let birth = $("#birth").val();
			let email = $("#email").val();	
			
			let param = {
					id: id,
					username:username,
					nickname: nickname,
					name: name,
					phone: phone,
					postcode: postcode,
					address: address,
					birth: birth,
					email: email
			};
			
			// 유효성 검사
			if(form.name.value.trim()=="" || form.nickname.value.trim()=="" || form.phone.value.trim()=="" || form.postcode.value.trim()=="" || form.address.value.trim()=="" || form.birth.value.trim()=="" || form.email.value.trim()==""){
				alert("입력값에 공백이 있으면 안 됩니다. 모든 정보를 입력해 주세요.");
				return false;
			}

			console.log(JSON.stringify(param));
			
		       $.ajax({
		            type:'POST',
		            data: JSON.stringify(param),
		            cache : false,
		            url:"/modify",
		            contentType: "application/json; charset='UTF-8'",
		            success : function(data) {  
		            	if(data == "SUCCESS"){
		            		alert("수정되었습니다");
		            		}
		            },
		            error: function(jqXHR, textStatus, errorThrown) {
		                alert("ERROR : " + textStatus + " : " + errorThrown);
		            }
			}); //end ajax
		}); //end click()
	}); // end ready()
	
	

	
</script>	

<script>

	
</script>
</head>


<body>    

	
	<c:url value="/modify" var="modifyUrl"/>
	
	<div class="d-flex justify-content-center mt-5">
		<form:form name="/modifyForm" action="${modifyUrl}" method="POST" id="form">
		<input type="hidden" id="username" name="username" value="<sec:authentication property="principal.memberVO.username"/>">
		
			<table class="table table-bordered pt-5"  id="user_Info_table">
				
				<tr>
					<td><label for="username">아이디</label></td>
					<td><label><sec:authentication property="principal.memberVO.username"/></label></td>
				</tr>
			 
				<tr>
					<td><label for="name">이름</label></td>
					<td> <input type="text" id="name" name="name" value=<sec:authentication property="principal.memberVO.name"/>></td>
				</tr>
			        
				<tr>
					<td><label for="nickname">닉네임</label></td>
					<td> <input type="text" id="nickname" name="nickname" value=<sec:authentication property="principal.memberVO.nickname"/>></td>
				</tr>
	
				<tr>
					<td><label for="phone">연락처</label></td>
					<td> <input type="text" id="phone" name="phone" value=<sec:authentication property="principal.memberVO.phone"/>></td>
				</tr>
	
				<tr>
					<td><label for="postcode">우편번호</label></td>
					<td> <input type="text" id="postcode" name="postcode" value=<sec:authentication property="principal.memberVO.postcode"/>></td>
				</tr>
	
				<tr>
					<td><label for="address">주소</label></td>
					<td> <input type="text" id="address" name="address" value=<sec:authentication property="principal.memberVO.address"/>></td>
				</tr>

				<tr>
					<td><label for="birth">생일</label></td>
					<td> <input type="date" id="birth" name="birth" value=<sec:authentication property="principal.memberVO.birth"/>></td>
				</tr>	
				
				<tr>
					<td><label for="email">이메일</label></td>
					<td> <input type="text" id="email" name="email" value=<sec:authentication property="principal.memberVO.email"/>></td>
				</tr>

				
								
			</table>
				<br>
				<button type="submit" id="updateSubmit" class="btn" onclick="check_onclick()">내 정보 수정</button>
			</form:form>
	</div>

	</body>
</html>
