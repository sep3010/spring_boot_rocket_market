<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>

<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css" integrity="sha384-MCw98/SFnGE8fJT3GXwEOngsV7Zt27NXFoaoApmYm81iuXoPkFOJwJ8ERdknLPMO" crossorigin="anonymous">
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.3/umd/popper.min.js" integrity="sha384-ZMP7rVo3mIykV+2+9J3UJ46jBk0WLaUAdn689aCwoqbBJiSnjAK/l8WvCWPIPm49" crossorigin="anonymous"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/js/bootstrap.min.js" integrity="sha384-ChfqqxuZUCnJSK3+MXmPNIyE6ZbWh2IMqE241rYiqJxyMiZ6OW/JmZQ5stwEULTy" crossorigin="anonymous"></script>
<link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.15.4/css/all.css" integrity="sha384-DyZ88mC6Up2uqS4h/KRgHuoeGwBcD4Ng9SiP4dIRy0EXTlnuz47vAwmeGwVChigm" crossorigin="anonymous">
<link rel="stylesheet" href="./css/font.css" />
<link rel="stylesheet" href="./css/login.css" />

<!-- csrf meta tag -->
<meta name="_csrf" content="${_csrf.token}"/>
<meta name="_csrf_header" content="${_csrf.headerName}"/>


<title>ROCKET MARKET 로그인</title>
<script src="https://code.jquery.com/jquery-1.12.4.min.js"></script>
<link rel="shortcut icon" type="image/x-icon" href="./imgs/logo.png" />
    
    
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
</style>


<script type="text/javascript">
	// csrf
   var token = $("meta[name='_csrf']").attr("content");
   var header = $("meta[name='_csrf_header']").attr("content");
   
 	//Ajax spring security header..
	$(document).ajaxSend(function(e, xhr, options){
		xhr.setRequestHeader(header, token);
	});

</script> 

<script>
	window.onload = () => {
		let loginForm = document.getElementById("loginForm")
		
		loginForm.onsubmit = () => {
			if(document.getElementById("username").value == ""){
				alert("아이디를 입력하세요");
				return false;
			}
			else if(document.getElementById("password").value == ""){
				alert("비밀번호를 입력하세요");
				return false;
			}
			else{
				alert("로그인 성공");
				return true;
			}
		} //end onsubmit()
	}//end window.onload

</script>	
 	
</head>

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
            <!-- <sec:authorize access="isAnonymous()"> -->
              <a class="nav-link" href="${pageContext.request.contextPath}/loginForm">로그인</a>
              <a class="nav-link" href="${pageContext.request.contextPath}/addMemberForm">회원가입</a>
              <a class="nav-link" href="${pageContext.request.contextPath}/user/userHome">마이페이지</a>
             <!-- </sec:authorize> -->
       
             
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
                src="./imgs/category.png"
                alt=""
                style="width: 21px; height: 17px" text
              />전체 카테고리
            </button>
          </div>
          <div class="dropdown-content">
            <a class="dropdown-item" href="#"
              ><img
                class="mr-2"
                src="./imgs/vegetable.png"
                style="width: 21px; height: 21px"
              />채소/과일</a
            >
            <a class="dropdown-item" href="#"
              ><img
                class="mr-2"
                src="./imgs/meat.png"
                style="width: 21px; height: 21px"
              />육류</a
            >
            <a class="dropdown-item" href="#"
              ><img
                class="mr-2"
                src="./imgs/rise.png"
                style="width: 21px; height: 21px"
              />국/반찬</a
            >
            <a class="dropdown-item" href="#"
              ><img
                class="mr-2"
                src="./imgs/snack.png"
                alt=""
                style="width: 21px; height: 21px"
              />간식/과자</a
            >
            <a class="dropdown-item" href="#"
              ><img
                class="mr-2"
                src="./imgs/cheese.png"
                style="width: 21px; height: 21px"
              />유제품</a
            >
            <a class="dropdown-item" href="#"
              ><img
                class="mr-2"
                src="./imgs/instant.png"
                style="width: 21px; height: 21px"
              />즉석식품</a
            >
          </div>
        </div>
        <div id="categorymenu">
          <a class="btn btn-light" href="#" role="button" id="categorybtn">신상품</a>
          <a class="btn btn-light" href="#" role="button" id="categorybtn">베스트상품</a>
          <a class="btn btn-light" href="#" role="button" id="categorybtn">특가상품</a>
          <a class="btn btn-light" href="#" role="button" id="categorybtn">정기배송상품</a>
        </div>
      </div>
    </div>


<body>   	

	
	    <!-- 여기서 부터 로그인 -->

      <div class="container">
      
      <div class="d-flex justify-content-center h-100" id="loginbox">
      <c:url value="/login" var="loginUrl" />
	  <form:form id="loginForm" action="${loginUrl}" method="POST">

      <div class="card">
      
	   <c:if test="${param.error != null}">
	        <p class="text-center mb-0">아이디와 비밀번호가 잘못되었습니다.</p>
	    </c:if>
	    <%-- <c:if test="${param.logout != null}">
	        <p class="text-center mb-0">로그아웃 되었습니다.</p>
	    </c:if> --%>
	    
        <div id="social_login">
          <a href="${kakaoLoginURL}"><img src="./icon/kakao_icon_color.png" onmouseover="this.src='./icon/kakao_icon.png'" onmouseout="this.src='./icon/kakao_icon_color.png'" alt="" id="kakao"></a>
          <a href=""><img src="./icon/naver_icon_color.png" onmouseover="this.src='./icon/naver_icon.png'" onmouseout="this.src='./icon/naver_icon_color.png'" alt="" id="naver"></a>
          <a href=""><img src="./icon/google_icon_color.png" onmouseover="this.src='./icon/google_icon.png'" onmouseout="this.src='./icon/google_icon_color.png'" alt="" id="google"></a>
        </div>
        
        <div class="card-header" style="color: white;">
          <h3>로그인</h3>
		</div>
		
        <div class="card-body">
         
            <div class="input-group form-group">
              <div class="input-group-prepend">
                <span class="input-group-text">
                  <img src="./icon/id_icon.png" alt="" style="width: 20px; height: 20px;">
                 </span>
              </div><!-- input-group-prepend -->
              <input type="text" id="username" name="username" class="form-control" placeholder="ID" />
            </div><!-- input-group form-group -->
            <div class="input-group form-group">
              <div class="input-group-prepend">
                <span class="input-group-text">
                  <img src="./icon/pw_icon.png" alt="" style="width: 25px; height: 25px;">
                  </span>
              </div>
              <input type="password" id="password" name="password" class="form-control" placeholder="PW" />
            </div><!-- input-group form-group -->
            <!--<div class="row align-items-center remember">
              <input type="checkbox" />Remember Me
            </div>  기억하는거-->
            <div class="form-group">
              <input
                type="submit"
                value="Login"
                class="btn float-right login_btn"
              />
            </div>
      
        </div>
        <div class="card-footer">
          <small style="color: white;"><SPAN>아직 가입을 안하셨다면 👉 <a href="${pageContext.request.contextPath}">회원가입</a></SPAN></small>
        </div>

      </div>  
      </div><!-- loginbox -->

      	</form:form>
    </div><!-- container -->

</body>
</html>
