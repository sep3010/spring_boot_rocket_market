<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html>
<head>
<!-- Required meta tags -->
<meta charset="utf-8" />
<meta
  name="viewport"
  content="width=device-width, initial-scale=1, shrink-to-fit=no"
/>
<title>ROCKET MARKET :: 신속배송</title>
<script src="https://code.jquery.com/jquery-1.12.4.min.js"></script>
<link rel="shortcut icon" type="image/x-icon" 
href="${pageContext.request.contextPath}/imgs/logo.png" />
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>

<!-- Bootstrap CSS -->
<link
  rel="stylesheet"
  href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/css/bootstrap.min.css"
  integrity="sha384-zCbKRCUGaJDkqS1kPbPd7TveP5iyJE0EjAuZQTgFLD2ylzuqKfdKlfG/eSrtxUkn"
  crossorigin="anonymous"
/>

<!-- jQuery -->
<script src="https://code.jquery.com/jquery-1.12.4.min.js"></script>

   
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/font.css" />
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/chatbot-ui.css" />
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/product_details.css" />

<!-- 폰트 -->
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR&display=swap" rel="stylesheet">

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
        border: 1px solid rgb(0 0 0 / 0%);
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
      
      form { 
      display : inline; 
      margin:0px
      }
      
      
      /*구매하기 버튼 품절 상태에서 길이 어긋남*/
     #cartbtn{
      width: 125px;
     } 
     
     #heart_img{
      padding : 0px;
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
              .animate({ top: position + currentPosition + "px" }, 900);
          });

        // 장바구니 담기
        $(".inCart").submit(function() {   	
	      // csrf
       	  var token = $("meta[name='_csrf']").attr("content");
       	  var header = $("meta[name='_csrf_header']").attr("content");       	
          event.preventDefault();
         
         let productId = $(this).find(".productId").val(); //상품번호        
       	 let memberId = $(this).find(".memberId").val(); //회원번호
       	 let amount_result = $("#amount_result").text(); //선택수량

         var data = {
    	   product_id : productId,
    	   quantity : amount_result,
    	   member_id : memberId
         };
   
         console.log(JSON.stringify(data));                 
       	        
   	     $.ajax({
           type : "POST",
           url : "${pageContext.request.contextPath}/user/inCart",
           cache : false,
           contentType:'application/json; charset="UTF-8"',
           data : JSON.stringify(data),
           beforeSend: function(xhr) {
               xhr.setRequestHeader("X-CSRF-Token", "${_csrf.token}");
           },
           success: function () { 
             console.log("ajax 통신 성공");
             const moveCart = confirm("상품을 카트에 담았습니다. 장바구니로 이동하시겠습니까?");            	 
             if(moveCart == false){  
               console.log("장바구니 이동 안함");            		
             }
             else{
               console.log("장바구니 이동");
               location.assign("${pageContext.request.contextPath}/user/cart");
             }
           },
           error: function (e) {
             console.log(e);
           }         
         }); //end ajax()      
           
        });  // end click()
 
        //=================================================
        // 찜하기 담기
        $(".inWishList").submit(function() {   	
	      // csrf
       	  var token = $("meta[name='_csrf']").attr("content");
       	  var header = $("meta[name='_csrf_header']").attr("content");       	
          event.preventDefault();
         
         let productId = $(this).find(".productId").val(); //상품번호        
       	 let memberId = $(this).find(".memberId").val(); //회원번호

         var data = {
    	   product_id : productId,
    	   member_id : memberId
         };
   
         console.log(JSON.stringify(data));                 
       	        
   	     $.ajax({
           type : "POST",
           url : "${pageContext.request.contextPath}/user/inWishList",
           cache : false,
           contentType:'application/json; charset="UTF-8"',
           data : JSON.stringify(data),
           beforeSend: function(xhr) {
               xhr.setRequestHeader("X-CSRF-Token", "${_csrf.token}");
           },
           success: function () { 
             console.log("ajax 통신 성공");
             const moveCart = confirm("상품을 위시리스트에 담았습니다. 위시리스트로 이동하시겠습니까?");            	 
             if(moveCart == false){  
               console.log("위시리스트 이동 안함");            		
             }
             else{
               console.log("위시리스트 이동");
               location.assign("${pageContext.request.contextPath}/user/wishList");
             }
           },
           error: function (e) {
             console.log(e);
           }         
         }); //end ajax()      
           
        });  // end click()
	  });
</script>

</head>


<body>

    <header>
	<div>
    	<nav class="navbar" id="topbanner">
          <a class="navbar-brand" href="${pageContext.request.contextPath}/basicaddMemberForm" style="color: rgb(90, 69, 42)"> 🤎 회원가입 혜택이 팡팡팡! 🤎 </a>
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
			  <c:forEach var="cart" items="${cartProductList}" varStatus="status" begin="0" end="2" >
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

      <div class="container pt-5">

      <div class="d-flex justify-content-center pt-5 pb-5"id="product_box">
      
		<!-- =================== 왼쪽 메인 ==================== --> 
		<div id="product_leftbox">     
 	    <c:forEach var="productInfo" items="${productInfo}">     
            <div class="card" id="product_big_img">          
            <c:choose>
			  <c:when test="${not empty productInfo.productImages}">
			    <c:forEach var="image" items="${productInfo.productImages}">
			  	  <c:set var="main" value="${image.information_type}"/>
			  	  <c:choose>
			  	    <c:when test="${main eq 'main'}">
					  <img src="${image.path}" class="card-img-top" id="product_img">
			  	    </c:when>
			  	  </c:choose>		  	
			    </c:forEach>
			  </c:when>
		    </c:choose>
              <div class="card-body text-center p-0 pt-1">
                <span id="stargrade"><a href=""><h6 class="p-0 pt-1">★ ${productScore.product_score} (${reviewCount})</h6></a></span>
              </div>
            </div> <!-- card 상품이미지 -->
        
            <!-- ====================추천상품===================== -->
            <div class=pb-0 id="recommendbox">	
              <h6 class="text-center p-0 pt-2"> ♥ [${productBrand}] 추천 상품 ♥</h6>
				<div class=" d-flex justify-content-center">
	          <c:forEach var="recommend" items="${recommendProduct}" end="2">
	            <c:choose>
		      	  <c:when test="${not empty recommend.productImages}">
		            <c:forEach var="thumbnails" items="${recommend.productImages}">
		              <a href="${pageContext.request.contextPath}/product/productView/${recommend.id}" id="image-title">
			          <c:choose>
			      		<c:when test="${not empty recommend.productImages}">
				    	  <c:forEach var="thumbnail" items="${recommend.productImages}">
					        <div class="card-deck" style="height: 120px;">
                              <div class="card pr-3 pl-3">
					            <img src="${thumbnail.path}" class="card-img-top" style="width: 100px; height: 100px;">
						        <div class="card-body p-0 pt-2">
						        <c:set var="TextValue" value="${recommend.name}" />
	  		                      <h6 class="card-title text-center m-0">${fn:substring(TextValue,0,7)}</h6>
	  		                    </div>
                        	  </div>
                      		</div>
						  </c:forEach>
				  		</c:when>
			    	  </c:choose>
			    	  </a>			
		      		</c:forEach><!-- 썸네일찾기 반복문 -->
			  	  </c:when>
	  			</c:choose>
	  	  	  </c:forEach>
	  	  	  </div>
        	</div><!-- recommendbox -->   
    	</c:forEach>
    	
      </div> <!-- product_leftbox -->
 	
 	
      <!-- =================== 오른쪽 메인 ==================== -->    
	  <c:forEach var="productInfo" items="${productInfo}">
      <div id="product_rightbox">
       <div id="tablebox">       
        <div>
          <h3 class="pb-4"><strong> [${productInfo.brand}] ${productInfo.name} </strong></h3>
        </div>

        <div id="product_table">      
        <c:set var="price" value="${productInfo.price}"/>
        <c:set var="discountPercent" value="${productInfo.discount}" scope="session"/>
        <c:set var="discountPrice" value="${price * (1 - (discountPercent/100))}" scope="session"/>
		 <!-- 할인 하는 제품일때 원가,퍼센트,할인가표시 -->
		    <div id="price">
              <dt>가격</dt>
                <dd><fmt:formatNumber value="${productInfo.price}" pattern="#,###"/><span> 원</span></dd>
            </div>
  
            <div class="d-flex align-items-center p-0 pb-3" id="dc_price">
              <dt>할인가</dt>
              <dd><span id="discount"><fmt:formatNumber value="${discountPrice}" pattern="#,###"/></span>
              <span class="dc_text"> 원</span><span class="discount_number">&nbsp;&nbsp;${discountPercent}%</span></dd>
            </div> 
  
          <div id="capacity">
            <dt>용량</dt><dd>${productInfo.capacity}</dd>
          </div>
  
          <div id="pack">
            <dt>포장타입</dt><dd>${productInfo.packaging}</dd>
          </div>
  
          <div id="delivery">
            <dt>배송타입</dt><dd>${productInfo.delivery_type}</dd>
          </div>
  
          <script src="${pageContext.request.contextPath}/js/count.js"></script>
  
          <div class="pt-4 pb-3" id="amount">
            <dt>구매수량</dt>
          </div><!-- amount -->

          <div id="amountbox">
          
            <div id=amount_span>
              <input type="button" onclick='count("minus")' value="-" />
              <span id="amount_result">1</span>
              <input type="button" onclick='count("plus")' value="+" />       
            </div><!-- amount_span -->  
            <div class="price_result"> 
              <span class="result_text"><span>총 상품 금액 :</span> 
              <span id="result_sum"><fmt:formatNumber value="${discountPrice}" pattern="#,###"/></span> <span>원</span> </span> 
            </div><!-- price_result -->
            
          </div> <!-- amountbox --> 
         
        </div> <!-- product_table -->
       </div><!-- tablebox -->
       
       	<!-- =========== 비로그인 상태 ============ -->
		<sec:authorize access="isAnonymous()">
	    <c:choose>
	      <c:when test="${productInfo.stock > 0}">
	        <div clss="d-flex align-items-center" id="cartdiv">     
       		  <div class="btn btn-success btn-lg" id="cartbtn" onclick="location.href='${pageContext.request.contextPath}/order/orderPaymentOne?product_id=${productInfo.id }'">구매하기</div>
       			<a href=""><img src="${pageContext.request.contextPath}/imgs/cart.png" id="cart_img"></a>
	   			<!-- 상단코드 클릭시 장바구니로 넣기 -->
       			<a href=""><img src="${pageContext.request.contextPath}/imgs/heart.png" id="heart_img"></a>
       			<!-- 상단코드 클릭시 위시리스트로 넣기 -->
       			<h5 class="cart_text pt-4"> 지금 구매하기를 누르시면 혜택이 팡팡팡! </h5>
      		</div>	                	
		  </c:when>
		  <c:otherwise>
		    <div clss="d-flex align-items-center" id="cartdiv">     
       		  <div class="btn btn-success btn-lg" id="cartbtn">품절</div>       		       		  
       		  <a href="${pageContext.request.contextPath}/loginForm"><img src="${pageContext.request.contextPath}/imgs/cart.png" id="cart_img"style="width: 50px; margin: 0px;"></a>
       		  <a href="${pageContext.request.contextPath}/loginForm"><img src="${pageContext.request.contextPath}/imgs/heart.png" id="heart_img"style="width: 50px; padding: 0px;"></a>
       		  <h5 class="cart_text pt-4"> 현재 품절인 상품입니다. 재입고예정 : 없음 </h5>
      		</div>	
		  </c:otherwise>		           		                
	    </c:choose>	
	    </sec:authorize>		
	    
	    <!-- =========== 로그인 상태 ============ -->
		<sec:authorize access="hasAuthority('ROLE_USER')">
	    <c:choose>
	      <c:when test="${productInfo.stock > 0}">
	      	<div clss="d-flex align-items-center" id="cartdiv">     
       		  <div class="btn btn-success btn-lg" id="cartbtn" style="width: 125px;" onclick="location.href='${pageContext.request.contextPath}/order/orderPaymentOne?product_id=${productInfo.id }'">구매하기</div>
       		  <!-- 상단코드 클릭시 주문단계로 바로 넘어가기(세윤) --> 

       		  <form class="inCart" action="${pageContext.request.contextPath}/user/cart" method="post" style="width: 50px; margin: 0px;">
 	            <input type="hidden" class="productId" name="productId" value="${productInfo.id}" style="width: 50px; margin: 0px;">	          
	            <input type="hidden" class="memberId" name="memberId" value="<sec:authentication property="principal.memberVO.id" />">
	            <input type="image" class="submit btn" src="${pageContext.request.contextPath}/imgs/cart.png" id="cart_img" value="장바구니" style="width: 50px; padding: 0px;" >      		  		       		  			  
       		  </form>	
       		  <!-- 상단코드 클릭시 장바구니로 넣기 -->
       		  
       		  <form class="inWishList" action="${pageContext.request.contextPath}/user/wishList" method="post" >
 	            <input type="hidden" class="productId" name="productId" value="${productInfo.id}" style="width: 50px;">	          
	            <input type="hidden" class="memberId" name="memberId" value="<sec:authentication property="principal.memberVO.id"/>">
	            <input type="image" class="submit btn" src="${pageContext.request.contextPath}/imgs/heart.png" id="heart_img" value="장바구니" style="width: 50px; padding: 0px;" >      		  		       		  			  
       		  </form>	
			  <!-- 상단코드 클릭시 위시리스트로 넣기 -->
			  
       		  <h5 class="cart_text pt-4"> 지금 구매하기를 누르시면 혜택이 팡팡팡! </h5>
      		</div>	       	
		  </c:when>
		  <c:otherwise>
		    <div clss="d-flex align-items-center" id="cartdiv">     
       		  <div class="btn btn-success btn-lg disabled" id="cartbtn">품절</div>       		       		  
       		  <a href=""><img src="${pageContext.request.contextPath}/imgs/cart.png" alt="" id="cart_img"></a>
			  <!-- 상단코드 클릭시 장바구니로 넣기 -->
       		  <form class="inWishList" action="${pageContext.request.contextPath}/user/wishList" method="post">
 	            <input type="hidden" class="productId" name="productId" value="${productInfo.id}">	          
	            <input type="hidden" class="memberId" name="memberId" value="<sec:authentication property="principal.memberVO.id"/>">
	            <input type="image" class="submit btn" src="${pageContext.request.contextPath}/imgs/heart.png" id="heart_img" value="장바구니" >      		  		       		  			  
       		  </form>			  <!-- 상단코드 클릭시 위시리스트로 넣기 -->
       		  <h5 class="cart_text pt-4"> 현재 품절인 상품입니다. 재입고예정 : 없음 </h5>
      		</div>		
		  </c:otherwise>		           		                
	    </c:choose>	
	    </sec:authorize>

      
	</c:forEach> 
    </div><!-- product_rightbox -->
   </div><!-- product_box --> 
  

       <nav class="navbar navbar-expand-lg navbar-light"id="product_menu_nav">
          <div class="navbar d-flex justify-content-center  p-0" >
            <div class="navbar-nav" id="product_menu">
              <a class="nav-link" href="#pro_information" id="pro_information_menu">상품정보</a>
              <a class="nav-link" href="#pro_details" id="pro_details_menu">상품상세</a>
              <a class="nav-link" href="#pro_epilogue" id="pro_epilogue_menu">상품후기</a>
            </div>
          </div>
        </nav>
		
	  <c:forEach var="productInfo" items="${productInfo}">
	    <c:choose>
		  <c:when test="${not empty productInfo.productImages}">
	        <c:forEach var="image" items="${productInfo.productImages}">
			  <c:set var="main" value="${image.information_type}"/>
			  <c:set var="detail" value="${image.information_type}"/>
			  <c:set var="info" value="${image.information_type}"/>
			  <c:choose>
			    <c:when test="${info eq 'info'}">
        		  <!-- 상품상세 이미지 -->
        		  <div class=text-center id="pro_details">
          		    <img src="${image.path}" alt="">
        		  </div>			    
			  	</c:when>
			  </c:choose>			  
			  <c:choose>
			    <c:when test="${detail eq 'detail'}">
			      <!-- 상품정보 이미지 -->
                  <div class=text-center id="pro_information">
                    <img src="${image.path}" alt="">
                  </div>
			  	</c:when>
			  </c:choose>			  	
			</c:forEach> <!-- image -->
		  </c:when>
		</c:choose>
      </c:forEach> 
       

        <!-- 상품 후기 게시판 -->
        <div class="text-center pt-5 pb-5" id="pro_epilogue">
        <table class="table table-bordered">
          <thead>
            <tr>
              <th scope="col-sm" id="table_contentment">만족도</th>
              <th scope="col-sm" id="table_content">후기내용</th>
              <th scope="col-sm" id="table_writer">작성자</th>
              <th scope="col-sm" id="table_day">작성일</th>
            </tr>
          </thead>
          
          <tbody>
          	<c:forEach var="review" items="${productBoard}">
          	  <tr>
	            <td>${review.score}</td>
	  		    <td>${review.content}</td>
	 		    <td>${review.nickname}</td>
	  		    <td>${review.board_date}</td>
	  		  </tr>
		    </c:forEach>
	   		    
		  <tbody>
			
        </table>
      </div>

		    
		  <!-- 페이징번호 -->
		  <c:if test="${pageMaker.pre}">
	  	   <a href="${pageContext.request.contextPath}/product/productView/${productNum}${pageMaker.makeQuery(pageMaker.startPage - 1) }">
	  		«</a>
		  </c:if>

		  <c:forEach var="idx" begin="${pageMaker.startPage }" end="${pageMaker.endPage }">
	  	    <a href="${pageContext.request.contextPath}/product/productView/${productNum}${pageMaker.makeQuery(idx)}">${idx}</a>
		  </c:forEach>

		  <c:if test="${pageMaker.next && pageMaker.endPage > 0}">
	  	    <a href="${pageContext.request.contextPath}/product/productView/${productNum}${pageMaker.makeQuery(pageMaker.endPage +1) }">
	  	    »</a>
		  </c:if>	
      
      </div><!-- container -->
    </main>


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

</body>
</html>