<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<!-- csrf meta tag -->
<meta name="_csrf" content="${_csrf.token}"/>
<meta name="_csrf_header" content="${_csrf.headerName}"/>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>

<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css" integrity="sha384-MCw98/SFnGE8fJT3GXwEOngsV7Zt27NXFoaoApmYm81iuXoPkFOJwJ8ERdknLPMO" crossorigin="anonymous">
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.3/umd/popper.min.js" integrity="sha384-ZMP7rVo3mIykV+2+9J3UJ46jBk0WLaUAdn689aCwoqbBJiSnjAK/l8WvCWPIPm49" crossorigin="anonymous"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/js/bootstrap.min.js" integrity="sha384-ChfqqxuZUCnJSK3+MXmPNIyE6ZbWh2IMqE241rYiqJxyMiZ6OW/JmZQ5stwEULTy" crossorigin="anonymous"></script>
<link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.15.4/css/all.css" integrity="sha384-DyZ88mC6Up2uqS4h/KRgHuoeGwBcD4Ng9SiP4dIRy0EXTlnuz47vAwmeGwVChigm" crossorigin="anonymous">
<link rel="stylesheet" href="./css/font.css" />
<link rel="stylesheet" href="./css/sign_up.css" />

<title>ROCKET MARKET 회원가입</title>

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
</style>


</script> 
<script type="text/javascript">
	//csrf
	var token = $("meta[name='_csrf']").attr("content");
	var header = $("meta[name='_csrf_header']").attr("content");

	//Ajax spring security header..
	$(document).ajaxSend(function(e, xhr, options){
		xhr.setRequestHeader(header, token);
	});


	let idCheck = 0;
	
	$(document).ready(function(){
		
		$("#idCheck").click(function() {
			const regExp = /[!?@#$%^&*():;+-=~{}<>\_\[\]\|\\\"\'\,\.\/\`\₩]/g;

			let userId = $("#username").val();
			
			if(userId == '' || userId == ' '){
				alert("아이디를 입력해주세요.");
			}
			else if (userId.search(/\s/) !== -1) {
				alert("공백입력이 있습니다.");
			}
			else if (regExp.test(userId)) {
				alert("아이디는 영문과 숫자입력만 가능합니다.");
			}
			else {

				let data = {
						username : userId
				};
				
						
				console.log(JSON.stringify(data));
				
				$.ajax({
					type: "POST",
					url : "${pageContext.request.contextPath}/addMemberForm/idCheck",
					cache : false,
					contentType:"application/json; charset='UTF-8'",
					data : JSON.stringify(data),
					success : function(jsonData){
						if(jsonData.idCount > 0){
							alert("아이디가 존재합니다! 다른 아이디를 입력해주세요");
							$("#username").focus();
						}
						else{
							alert("사용가능한 아이디입니다.");
							$("#password").focus();
							idCheck = 1;
						}
					},
					error : function(e){
						console.log(e);
						alert("error : " + e);
					}
		
				}) //end ajax
				
			} // end else
			
			
			
		}); //end #idCheck.click();
		
		
		$("#submit").click(function(event){
			
			// 숫자
			const pattern1 = /[0-9]/; 
			// 문자  
	        const pattern2 = /[a-zA-Z]/; 
	    	// 특수문자 
	        const pattern3 = /[!@#$^&*]/; 
	        
	    	let password = $("#password").val();
			
			if(password != $("#passwordcheck").val()){
				event.preventDefault();
				alert("비밀번호 입력이 다릅니다. 다시 입력해주세요.");
			}
			else if (password.search(/\s/) !== -1) {
				event.preventDefault();
				alert("비밀번호에 공백이 있습니다. 다시 입력해주세요.");
			}
			else if (!pattern1.test(password) || !pattern2.test(password) || !pattern3.test(password) || password.length < 8) {
				event.preventDefault();
				alert("비밀번호는 8자리 이상 문자, 숫자, 특수문자(!@#$^&*)로 구성하여야 합니다.");
			}
			else if (!pattern1.test(password) || !pattern2.test(password) || !pattern3.test(password) || password.length < 8) {
				event.preventDefault();
				alert("비밀번호는 8자리 이상 문자, 숫자, 특수문자(!@#$^&*)로 구성하여야 합니다.");
			}
			
			
			
			
		}); // end #submit.click()
		
		
	}); //end ready()


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
              <a class="nav-link" href="#">이벤트</a>
            </div>
            
            <!-- 로그인을 안했다면 -->
            <div class="navbar-nav" id="topmenu_right">
            <!-- <sec:authorize access="isAnonymous()"> -->
              <a class="nav-link" href="${pageContext.request.contextPath}/loginForm">로그인</a>
              <a class="nav-link" href="${pageContext.request.contextPath}/basicaddMemberForm">회원가입</a>
              <a class="nav-link" href="${pageContext.request.contextPath}/user/userHome">마이페이지</a>
             <!-- </sec:authorize> -->
       
             
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



<!-- ======================== 제품 메뉴 =========================== -->
	<div class="category shadow">
      <div class="container d-flex justify-content-between">
        <div class="dropdown">
          <div class="text-center">
            <button class="dropbtn d-flex justify-content-start">
              <img
                class="mr-2 mt-1"
                src="./imgs/category.png"
                alt=""
                style="width: 21px; height: 17px"
              />전체 카테고리
            </button>
          </div>
          <div class="dropdown-content">
            <a class="dropdown-item" href="#"
              ><img
                class="mr-2"
                src="${pageContext.request.contextPath}/imgs/vegetable.png"
                style="width: 21px; height: 21px"
              />채소/과일</a
            >
            <a class="dropdown-item" href="#"
              ><img
                class="mr-2"
                src="${pageContext.request.contextPath}/imgs/meat.png"
                style="width: 21px; height: 21px"
              />육류</a
            >
            <a class="dropdown-item" href="#"
              ><img
                class="mr-2"
                src="${pageContext.request.contextPath}/imgs/rise.png"
                style="width: 21px; height: 21px"
              />국/반찬</a
            >
            <a class="dropdown-item" href="#"
              ><img
                class="mr-2"
                src="${pageContext.request.contextPath}/imgs/snack.png"
                alt=""
                style="width: 21px; height: 21px"
              />간식/과자</a
            >
            <a class="dropdown-item" href="#"
              ><img
                class="mr-2"
                src="${pageContext.request.contextPath}/imgs/cheese.png"
                style="width: 21px; height: 21px"
              />유제품</a
            >
            <a class="dropdown-item" href="#"
              ><img
                class="mr-2"
                src="${pageContext.request.contextPath}/imgs/instant.png"
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


<!-- ======================== 여기서부터 회원가입 =========================== -->


<div class="container">

   <div class="d-flex justify-content-center h-100" id="signup_box">
	<c:url value="/addMember" var="addUMemberUrl" />
	<form:form name="addForm" action="${addUMemberUrl}" method="POST">
      <div class="card">
        <div class="card-header" style="color: white;">
          <h3 class="title">회원가입</h3>
        </div>
        <div class="card-body">
		<div class="input-group form-group">
		<div class="input-group-prepend">
		<span class="input-group-text"><img src="${pageContext.request.contextPath}/icon/id_icon.png" alt="" style="width: 20px; height: 20px;"></span>
		</div>
		<input type="text" id="username" name="username" class="form-control" placeholder="ID" />
		<input type="button" id="idCheck" value="아이디중복확인"/>
		</div>
		
		<div class="input-group form-group">
		<div class="input-group-prepend">
		<span class="input-group-text"><img src="${pageContext.request.contextPath}/icon/pw_icon.png" alt="" style="width: 25px; height: 25px;"></span>
		</div>
		<input type="password" id="password" name="password" class="form-control" placeholder="비밀번호" />
		</div>
		
		<div class="input-group form-group">
		<div class="input-group-prepend">
		<span class="input-group-text"><img src="${pageContext.request.contextPath}/icon/pw_icon.png" alt="" style="width: 25px; height: 25px;"></span>
		</div>
		<input type="password" id="passwordcheck" name="passwordcheck" class="form-control" placeholder="비밀번호 확인" />
		</div>
   
		<div class="input-group form-group">
		<div class="input-group-prepend">
		<span class="input-group-text"><img src="${pageContext.request.contextPath}/icon/star_icon.png" alt="" style="width: 25px; height: 25px;"></span>
		</div>
		<input type="text" name="nickname" class="form-control" placeholder="닉네임" />
		</div>   
   
   		<div class="input-group form-group">
		<div class="input-group-prepend">
		<span class="input-group-text"><img src="${pageContext.request.contextPath}/icon/name_icon.png" alt="" style="width: 25px; height: 25px;"></span>
		</div>
		<input type="text" id="name" name="name" class="form-control" placeholder="이름" />
		</div>
		
		<div class="input-group form-group">
		<div class="input-group-prepend">
		<span class="input-group-text"><img src="${pageContext.request.contextPath}/icon/day_icon.png" alt="" style="width: 25px; height: 25px;"></span>
		</div>
		<input type="date" name="birth" class="form-control" placeholder="생년월일" />
		</div>
		
		<div class="input-group form-group">
		<div class="input-group-prepend">
		<span class="input-group-text"><img src="${pageContext.request.contextPath}/icon/phone_icon.png" alt="" style="width: 25px; height: 25px;"></span>
		</div>
		<input type="tel" name="phone" class="form-control" placeholder="연락처" />
		</div>
		
		<div class="input-group form-group">
		<div class="input-group-prepend">
		<span class="input-group-text"><img src="${pageContext.request.contextPath}/icon/email_icon.png" alt="" style="width: 25px; height: 25px;"></span>
		</div>
		<input type="email" name="email" class="form-control" placeholder="이메일" />
		</div>
		
		<div class="input-group form-group">
		<div class="input-group-prepend">
		<span class="input-group-text"><img src="${pageContext.request.contextPath}/icon/map_icon.png" alt="" style="width: 25px; height: 25px;"></span>
		</div>
		<input type="text" name="postcode" class="form-control" placeholder="우편번호" />
		</div>
		
		<div class="input-group form-group">
		<div class="input-group-prepend">
		<span class="input-group-text"><img src="${pageContext.request.contextPath}/icon/home_icon.png" alt="" style="width: 25px; height: 25px;"></span>
		</div>
		<input type="text" name="address" class="form-control" placeholder="주소" />
		</div>
	
		<div class="form-group">
        <input
        type="submit"
        value="가입하기"
        id="submit"
        class="btn float-right sign_btn"
        />
        </div>
        
		</form:form>
        </div><!-- card-body -->
        <div class="card-footer">
          <h5 style="color: white;"><SPAN>기존 회원이시라면 👉<a href="${pageContext.request.contextPath}/loginForm">로그인 하기</a></SPAN></h5>
        </div>

      </div><!-- card -->
    
    </div><!-- container -->


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
