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
   />    <!-- Bootstrap CSS -->
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/css/bootstrap.min.css"
        integrity="sha384-zCbKRCUGaJDkqS1kPbPd7TveP5iyJE0EjAuZQTgFLD2ylzuqKfdKlfG/eSrtxUkn" crossorigin="anonymous" />
    <!-- jQuery -->
    <script src="https://code.jquery.com/jquery-1.12.4.min.js"></script>
   <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>

	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
	
    <title>Rocket Market :: 신속배송</title>
   <link rel="shortcut icon" type="image/x-icon" 
   href="${pageContext.request.contextPath}/imgs/logo.png" />

    <!-- 폰트 -->
    <link rel="preconnect" href="https://fonts.googleapis.com">
   <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
   <link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR&display=swap" rel="stylesheet">

   <!-- Bootstrap CSS -->
   <link
     rel="stylesheet"
     href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/css/bootstrap.min.css"
     integrity="sha384-zCbKRCUGaJDkqS1kPbPd7TveP5iyJE0EjAuZQTgFLD2ylzuqKfdKlfG/eSrtxUkn"
     crossorigin="anonymous"
   />


   <link rel="stylesheet" href="${pageContext.request.contextPath}/css/font.css" />
   <link rel="stylesheet" href="${pageContext.request.contextPath}/css/chatbot-ui.css" />
   
   <style>
      /* 공통사항 */
        .body__container {
            font-size: 16px;
            font-family: 'Noto Sans KR', sans-serif;
        }

        a {
            text-decoration: none !important;
            color: black;
        }

        li {
            list-style-type: none;
        }
        
        .product-title {
            font-weight: 700;
        }
        .condition a {
            padding: 10px;
        }
        #product img {
            border-radius: 10px;
        }
        #image-title{
            position: relative;
            display: block;
        }
        #discount-badge {
            color: red;
            border: 1px solid tomato;
            padding: 3px;
            border-radius: 5px;
            background: #fff;
            position: absolute;
            top: 4px;
            left: 4px;
            font-weight: bold;
        }
        .counter button {
            width: 40px;
            height: 40px;
            font-weight: bold;
            font-size: 24px;
            border: none;
            background: darkviolet;
            color: white;
            border-radius: 5px;
        }
        .counter input {
            display: block;
            border: none;
            width: 50px;
            height: 40px;
            
            
        }
        .buttons .btn {
            font-weight: bold;
            width: 48%;
            
        }
        .modal-wrapper {
            position: fixed;
            top: 0px;
            left: 0px;
            background: rgba(0, 0, 0, 0.5);
            width: 100%;
            height: 100%;
            display: flex;
            justify-content: center;
            align-items: center;
        }
        .cart-modal {
            background: white;
            width: 400px;
            padding: 24px 16px;
            border-radius: 5px;
        }
        .modal-buttons {
            display: flex;
            justify-content: space-around
        }
        .modal-buttons .btn {
            width: 48%;
            height: 60px;
        }
   
      #productImage {
         width:200px;
         height:200px;
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

      /* 페이징 스타일 */
      .paging__container {
          display: flex;
          justify-content: center;

      }
      #pre, #next, #page_number {
          display: flex;
          justify-content: center;
          align-items: center;
          width: 35px;
          height: 35px;
          border: 1px solid lightgray;
          font-size: 20px;
          color: dodgerblue;
      }
      #pre:hover, #next:hover, #page_number:hover {
          background: dodgerblue;
          color: #fff;
          transition: .3s;
      }
      #pre {
          border-top-left-radius: 3px;
          border-bottom-left-radius: 3px;
      }
      #next {
        border-left: none;
        border-top-right-radius: 3px;
        border-bottom-right-radius: 3px;
      }
      #page_number {
        border-left: none;

      }
      
   </style>
   
<script type="text/javascript">       
   /*페이지 상단 이동*/
   function clickme() {
       window.scrollTo({ top: 0, left: 0, behavior: "smooth" });
   }  

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
      <div>
        <nav class="navbar" id="topbanner">
          <a class="navbar-brand" href="#" style="color: rgb(90, 69, 42)"
            >배너 이벤트</a
          >
        </nav>
      </div>

      <div class="container pb-2">
        <nav class="navbar navbar-expand-md navbar-light">
          <button
            class="navbar-toggler"
            type="button"
            data-toggle="collapse"
            data-target="#navbarNavAltMarkup"
            aria-controls="navbarNavAltMarkup"
            aria-expanded="false"
            aria-label="Toggle navigation"
          >
            <span class="navbar-toggler-icon"></span>
          </button>
          <div
            class="collapse navbar-collapse d-flex justify-content-between"
            id="navbarNavAltMarkup"
          >
            <div class="navbar-nav" id="topmenu_left">
              <a class="nav-link" href="${pageContext.request.contextPath}/board/noticeHome">공지사항</a>
              <a class="nav-link" href="${pageContext.request.contextPath}/board/inquiryHome">문의</a>
              <a class="nav-link" href="#">이벤트</a>
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
          <a class="btn btn-light" href="${pageContext.request.contextPath}/newProduct" role="button" id="categorybtn"
            >신상품</a
          >
          <a class="btn btn-light" href="${pageContext.request.contextPath}/bestProduct" role="button" id="categorybtn"
            >베스트상품</a
          >
          <a class="btn btn-light" href="${pageContext.request.contextPath}/saleProduct" role="button" id="categorybtn"
            >특가상품</a
          >
          <a class="btn btn-light" href="${pageContext.request.contextPath}/subscribeProduct" role="button" id="categorybtn"
            >정기배송상품</a
          >
        </div>
      </div>
    </div>

    <!-- ======================== 여기까지 헤더 (동일)=========================== -->
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
			  <c:forEach var="cart" items="${cartProductList}" >
		        <a href="${pageContext.request.contextPath}/product/productView/${cart.product_id}">
		        <img class="pt-1" src="${cart.path}" id="sideimg"/></a>			
			  </c:forEach>
			</sec:authorize>            

          </div>
        </div>
        <!-- ==================== 챗봇버튼 ======================== -->
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

          <div class="text-center mt-2" id="pagebox">
            <input
              id="pagebtn"
              type="button"
              alt=""
              value="Top ↑"
              onclick="clickme()"
            /><!-- 상단 페이지 버튼 -->
          </div>
        </div>
      </div>
      <!-- 사이드바 -->

   <br><br>
   <!-- ==================================== 상품 네비게이션 ====================================== -->
    <div class="body__container">
      <main>
        <div class="container product_navigation">
          <div class="row d-flex justify-content-around p-3">
            <nav class="w-100">
              <ul class="d-flex justify-content-around">
                <li>
                  <a href="${pageContext.request.contextPath}/categoryProduct/vegetable"  
                  class="d-flex flex-column justify-content-center align-items-center">
                    <img src="/img/logo/logo_vegi.png" alt="" width="64px" height="64px">
                    <caption>채소&과일</caption>
                  </a>
                </li>
                <li>
                  <a href="${pageContext.request.contextPath}/categoryProduct/side"
                  class="d-flex flex-column justify-content-center align-items-center">
                    <img src="/img/logo/logo_soup.png" alt="" width="64px" height="64px">
                    <caption>국&반찬</caption>
                  </a>
                </li>
                <li>
                  <a href="${pageContext.request.contextPath}/categoryProduct/meat" 
                  class="d-flex flex-column justify-content-center align-items-center">
                    <img src="/img/logo/logo_meat.png" alt="" width="64px" height="64px">
                    <caption>육류</caption>
                  </a>
                </li>
                <li>
                  <a href="${pageContext.request.contextPath}/categoryProduct/snack" 
                  class="d-flex flex-column justify-content-center align-items-center">
                    <img src="/img/logo/logo_snack.png" alt="" width="64px" height="64px">
                    <caption>간식&과자</caption>
                  </a>
                </li>
                <li>
                  <a href="${pageContext.request.contextPath}/categoryProduct/dairy" 
                  class="d-flex flex-column justify-content-center align-items-center">
                    <img src="/img/logo/logo_dairy.png" alt="" width="64px" height="64px">
                    <caption>유제품</caption>
                  </a>
                </li>
                <li>
                  <a href="${pageContext.request.contextPath}/categoryProduct/instant" 
                  class="d-flex flex-column justify-content-center align-items-center">
                    <img src="/img/logo/logo_instant.png" alt="" width="64px" height="64px">
                    <caption>즉석식품</caption>
                  </a>
                </li>          
              </ul>
            </nav>
          </div>
        </div> <!-- container product_navigation 끝 -->
        
        <!-- ======================== 상품 카테고리 이름 및 정렬 =========================== -->
        <div class="container">
          <h2 class="product-title text-center mt-5 border-bottom pb-4"> ${name} </h2>
          
          <div class="row conditions d-flex justify-content-between">
            <div class="quantity"><h5>총 ${productTotal} 개</h5></div>
              <div class="condition">
                <nav>
                  <ul class="d-flex justify-content-center">
                    <li><a href="">전체보기</a></li>
                    <li><a href="">신상품순</a></li>
                    <li><a href="">베스트</a></li>
                    <li><a href="">낮은가격순</a></li>
                    <li><a href="">높은가격순</a></li>
                  </ul>
                </nav>
              </div>
            </div>
          </div>
                    
          <!-- ============================== 상품카드 ================================= -->         
          <div class="container product__container mt-5">
            <div class="row mb-5">
              <c:forEach var="product" items="${productList}">
                 
                 <!-- 상품카드 정보 -->
                <div id="product" class="col-sm-6 col-md-4 col-lg-3">
                  <a href="${pageContext.request.contextPath}/product/productView/${product.id}" id="image-title"><!-- 상품번호 넣어서 상품 상세 페이지로 이동 -->
                    <c:choose>
                 <c:when test="${not empty product.productImages}">
                  <c:forEach var="main" items="${product.productImages}">
                    <c:set var="discount" value="${product.discount}" scope="session"/>
                    <c:choose>
                      <c:when test="${discount == 0}"/>
                      <c:otherwise>
                        <span id="discount-badge" class="">할인/특가</span>
                      </c:otherwise>
                    </c:choose>
                    <img id="productImage" src="${main.path}" class="w-100">
                    <h5 class="product_name">[${product.brand}] ${product.name}</h5>
                  </c:forEach>
                 </c:when>
                 <c:otherwise>
                   대표 이미지 없음
                 </c:otherwise>
                </c:choose>
                  </a>
                
                  <div class="product-information">
                     <c:set var="price" value="${product.price}"/>
                    <c:set var="discountPercent" value="${product.discount}" scope="session"/>
                    <c:set var="discountPrice" value="${price * (1 - (discountPercent/100))}" scope="session"/>
               <c:choose>
                 <c:when test="${discountPercent == 0}"> <!-- 할인 하지 않는 제품일때 원가만 표시 -->
                        <h3><fmt:formatNumber value="${product.price}" pattern="#,###"/>원</h3>                   
                 </c:when>
                 <c:otherwise> <!-- 할인 하는 제품일때 원가,퍼센트,할인가표시 -->
                        <p class="cost text-muted" style="text-decoration: line-through">
                          <fmt:formatNumber value="${product.price}" pattern="#,###"/>원
                        </p>
                        <h3>
                   <span class="text-danger">${product.discount}%</span>
                   <fmt:formatNumber value="${discountPrice}" pattern="#,###"/>원
                   </h3> 
                 </c:otherwise>
                </c:choose>                  
                  </div><!-- product-information 끝 -->
                
                  <div class="buttons d-flex justify-content-around">
                  <div class="btn btn-outline-success opener" >찜하기</div>
                    <div class="btn btn-outline-success opener">장바구니</div>
                  </div>
                </div>     
              </c:forEach>                    
            </div>                
          </div> <!-- container product__container (상품카드) 끝 -->

        </main>
        
      <!-- 페이징번호 -->
      <div class="paging__container mb-5">
          <c:if test="${pageMaker.pre}">
            <a href="${pageContext.request.contextPath}/${pageName}${pageMaker.makeQuery(pageMaker.startPage - 1) }" id="pre">
            «</a>
          </c:if>
          <c:forEach var="idx" begin="${pageMaker.startPage }" end="${pageMaker.endPage }">
            <a href="${pageContext.request.contextPath}/${pageName}${pageMaker.makeQuery(idx)}" id="page_number">${idx}</a>
          </c:forEach>
          <c:if test="${pageMaker.next && pageMaker.endPage > 0}">
            <a href="${pageContext.request.contextPath}/${pageName}${pageMaker.makeQuery(pageMaker.endPage +1) }" id="next">
            »</a>
          </c:if>
      </div> 
      
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
        <!-- container -->
        <!-- Optional JavaScript; choose one of the two! -->
        <!-- Option 1: jQuery and Bootstrap Bundle (includes Popper) -->
        <script src="https://cdn.jsdelivr.net/npm/jquery@3.5.1/dist/jquery.slim.min.js"
            integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj" crossorigin="anonymous">
        </script>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/js/bootstrap.bundle.min.js"
            integrity="sha384-fQybjgWLrvvRgtW6bFlB7jaZrFsaBXjsOMm/tB9LTS58ONXgqbR9W8oWht/amnpF" crossorigin="anonymous">
        </script>
        <!-- Option 2: Separate Popper and Bootstrap JS -->
        <!--
            <script src="https://cdn.jsdelivr.net/npm/jquery@3.5.1/dist/jquery.slim.min.js" integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj" crossorigin="anonymous"></script>
            <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js" integrity="sha384-9/reFTGAW83EW2RDu2S0VKaIzap3H66lZH81PoYlFhbGU+6BZp6G7niu735Sk7lN" crossorigin="anonymous"></script>
            <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/js/bootstrap.min.js" integrity="sha384-VHvPCCyXqtD5DqJeNxl2dtTyhF78xXNXdkwX1CZeRusQfRKp+tA7hAShOK/B/fQ2" crossorigin="anonymous"></script>
            -->
    </div> <!-- container 끝 -->
    <hr class="m-0" />

</body>
</html>