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
    <script src="https://code.jquery.com/jquery-1.12.4.min.js"></script>
    <link rel="shortcut icon" type="image/x-icon" href="${pageContext.request.contextPath}/imgs/logo.png" />


    
    <style>
     /* ========== 공지사항 작성페이지 ========== */

      /* 공통사항 */
      a {
        text-decoration: none !important;
        color: black;
      }
      a:hover {
        color: orange;
      }
      li {
        list-style-type: none;
      }

      /* 공통사항 끝 */
      .write__container {
      	display: flex;
      	flex-direction: column;
      	align-items: center;
        margin-top: 70px;
        margin-bottom: 70px;
        
      }
      table {
        width: 1000px;
        border-top: 1px solid;
        margin-top: 20px;
      }
      th {
        width: 150px;
        background:rgb(238, 237, 237)
      }
     
      th, td {
        padding: 10px;
      }
      td {
        border-bottom: 1px solid rgb(238, 237, 237);
        box-sizing: border-box;
      }
      .content {
        width: 1000px;
      }
      .buttons {
        display: flex;
        width: 300px;
        justify-content: space-around;
      }
     
      /* ========== ↑공지사항 보기페이지 디폴트 */

      input[name="title"] {
        display: block;
        width: 90%;
        height: 25px;
        border: none;
      }
      input[type="submit"] {
        display: block;
        width: 120px;
        height: 50px;
        background: #fff;
        border: 1px solid lightgray;
        border-radius: 5px;
        font-weight: bold;
        margin-top: 20px;
      }
      input[type="submit"]:hover {
        background: lightgray;
        color: white;
        opacity: .8;
        transition: .3s;
      }

      textarea {
        width: 100%;
        height: 500px;
        padding: 10px;
        overflow: hidden;
        resize: none;
      }



      /* ========== 공지사항 작성페이지 끝 ========== */    
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
        position: relative;
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
      
      /*글작성*/
       main {
            position: relative;
        }
        .customer-navigation {
            position: absolute;
             left: -150px;
            
            
        }
        .customer-navigation a{
            border-bottom: 1px solid lightgray;
            color:rgb(90, 88, 88);
            font-weight: bold;
        }

         main a:hover {
                color: orange;
            }
            a {
                color: gray;
                text-decoration: none !important;
            }
        li {
            list-style-type: none;
        }    
          .customer-navigation a {
              display: block;
              padding: 15px;
          }
          .customer-navigation li{
              width: 130%;
          }
          
          main tr:last-child {
              border-bottom: 1px solid lightgray;
          }
          #title {
              font-size: 30px;
              font-weight: bold;
          }
          .inquiry-container {
              width: 70%;
              position: relative;
          }
          .inquiry {
              display: flex;
              flex-direction: column;
              align-items: center;
          }
        
          




          table {
            width: 100%;
            border-top: 2px solid gray;
            border-bottom: 1px solid lightgray;
          }
          th {
            padding: 20px;
            font-size: 1.2em;
          }
          td {
            padding: 20px;
            font-size: 1em;
          }
          span:first-child {
            font-weight: bold;
          }
          col {
            background-color: rgb(238, 237, 237);
          }
          textarea {
            width: 100%;
            height: 300px;
            border-radius: 5px;
            resize: none;
            border: 1px solid lightgray;
            padding: 10px;
          }
          textarea:nth-child(2) {
            padding: 10px;
          }
          .upload-name {
            width: 80%;
            border: 3px solid lightgray;
            border-radius: 5px;
            padding: 2px;
          }
          label[for="file"] {
            width: 80px;
            text-align: center;
            font-weight: bold;
            border: 3px solid #e6d4b2;
            border-radius: 5px;
            padding: 2px;
            transition: 0.4s;
          }
          label[for="file"]:hover {
            background-color: #e6d4b2;
            color: #fff;
          }
          #file {
            display: none;
          }
          select {
            border: 1px solid lightgray;
            border-radius: 3px;
            padding: 10px;
          }
          input[name="title"] {
            width: 100%;
            border: 1px solid lightgray;
            border-radius: 3px;
            padding: 5px;
            margin-top: 5px;
          }
          input[type="submit"] {
            width: 200px;
            font-weight: bold;
            border: 3px solid #e6d4b2;
            border-radius: 5px;
            padding: 2px;
            transition: 0.2s; 
            background-color: #fff; 
            height: 70px;
            font-size: 20px;
            
          }
          input[type="submit"]:hover {
            background-color: #e6d4b2;
            color: #fff;
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
			  <sec:authentication property="principal.memberVO.name"/>님 환영합니다.&nbsp;&nbsp;
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
      
<!-- 문의사항 작성페이지 -->
  <div class="main__container p-5">
    <div class="container inquiry-container">
      <p id="title">문의 게시판</p>
      <form:form id="write-inquiryWrite-form" action="${pageContext.request.contextPath}/board/user/inquiry_write" method="post">
        <input type="hidden" name="member_id" value="<sec:authentication property="principal.memberVO.id"/>">
          <table class="mb-3">
            <col>
              <tr>
                <th>제목 <br></th>
                  <td>
                    <select name="sort">
                      <optgroup label="문의분류">
                        <option>배송지연</option>
                        <option>반품문의</option>
                        <option>환불문의</option>
                        <option>주문결제문의</option>
                        <option>회원정보문의</option>
                        <option>취소문의</option>
                        <option>교환문의</option>
                        <option>상품정보문의</option>
                        <option>기타문의</option>
                      </optgroup>
                    </select><br>
                    <input type="text" name="title">
                  </td>
              </tr>
                        
              <tr>
                <th>내용</th>
                  <td>
                    <p><span>문의작성 전 확인해주세요!</span></p><br>
                    <p><span>반품/환불</span><br>- 제품 하자 혹은 이상으로 반품(환불)이 필요한 경우 사진과 함께 구체적인 내용을 남겨주세요.</p>
                    <p><span>주문취소</span>
                    <br>- 주문취소는 [배송준비중] 이전까지 주문취소 가능합니다.
                    <br>- 일부 예약상품은 배송 3~4일 전에 취소 가능합니다.
                    <br>- 주문상품의 부분 취소는 불가능합니다. 전체 주문 취소 후 재구매 해주세요.
                    </p>
                    <textarea name="content"></textarea>
                  </td>
               </tr>
               <tr>
                 <th>공개여부</th>
                   <td>
                     <label class="mr-3">
                       <input type="radio" name="scope" value="공개">&nbsp;&nbsp;공개
                     </label>
                     <label>
                       <input type="radio" name="scope" value="비공개">&nbsp;&nbsp;비공개
                     </label>
                   </td>
               </tr>
          </table>
        <div class="text-center d-flex justify-content-center">
          <input type="submit" value="작성완료">
        </div> 
          
        </form:form>
                                        
     </div>
   </div>
            
 <!-- 문의사항 작성페이지 끝 -->      
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