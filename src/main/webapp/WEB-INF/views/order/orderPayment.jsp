<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html lang="kr">
<head>
    <!-- Required meta tags -->
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no"/>

    <!-- Bootstrap CSS -->
    <link
      rel="stylesheet"
      href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/css/bootstrap.min.css"
      integrity="sha384-zCbKRCUGaJDkqS1kPbPd7TveP5iyJE0EjAuZQTgFLD2ylzuqKfdKlfG/eSrtxUkn"
      crossorigin="anonymous"
    />
    
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/font.css" />
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/chatbot-ui.css" />

    <title>ROCKET MARKET :: 신속배송</title>
    <script src="https://code.jquery.com/jquery-1.12.4.min.js"></script>
<link rel="shortcut icon" type="image/x-icon" 
href="${pageContext.request.contextPath}/imgs/logo.png" />

   <!-- jQuery -->
   <script type="text/javascript" src="https://code.jquery.com/jquery-1.12.4.min.js" ></script>
   <!-- iamport.payment.js -->
   <script type="text/javascript" src="https://cdn.iamport.kr/js/iamport.payment-1.1.8.js"></script>
   
   <!-- csrf meta tag -->
   <meta name="_csrf" content="${_csrf.token}"/>
   <meta name="_csrf_header" content="${_csrf.headerName}"/>
    
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
        background:tomato;
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
            .animate({ top: position + currentPosition + "px" }, 900);
        });
        
        
        
        // 쿠폰 및 적립금 적용 자바스크립트
        $(document).ready(function(){

           $("#applyPoint").click(function(event){
              event.preventDefault();     
              
                 let deliveryFee = $('#delivery-fee').text(); // 배송비 
                 let coupon_point= $("select[name='coupon']").val(); // 쿠폰 할인 퍼센트
                 let input_point = $("#inputPoint").val(); // 적립금 사용 포인트
                 let userPoint = "<sec:authentication property="principal.memberVO.point"/>"; // 사용자 보유 포인트
	             let discount_price = $('#productDiscountAcount').text(); // 할인 후 총 금액
	             let productDiscountPrice = $('#productDiscountPriceHidden').val(); // 상품 할인 금액
	             
	             let productOriginalPrice = $("#productTotalAcount").text(); // 할인 전 총 금액
	             let couponDiscountFee = Number(productOriginalPrice) * Number(coupon_point) * 0.01
	             
	              pointProductPrice = Number(productDiscountPrice) + Number(input_point) + Number(couponDiscountFee); // 상품 할인가 + 사용 적립금 + 쿠폰 할인가
                  productPointTotalprice = Number(discount_price) - Number(input_point) - Number(couponDiscountFee);
                  
      			  $("#productDiscountPrice").text(pointProductPrice);
                  $("#productDiscountAcount").text(productPointTotalprice);
                  alert("총 " + pointProductPrice + "원의 할인이 적용됩니다.");
                  
                  
              	  
               
           });
        }); //end click()
        
/*                 // 쿠폰 적용 초기화
             $("#applyReset").click(function(event){
                discountFee = 0;
                
                  $("#discount_price").text(discountFee);
                 $("#discount_Amount").text(discountAmount);                   
               }); */
        

        }); // end ready()

      
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
                style="width: 21px; height: 21px"
              />채소/과일</a
            >
            <a class="dropdown-item" href="${pageContext.request.contextPath}/categoryProduct/meat"
              ><img
                class="mr-2"
                src="${pageContext.request.contextPath}/imgs/meat.png"
                style="width: 21px; height: 21px"
              />육류</a
            >
            <a class="dropdown-item" href="${pageContext.request.contextPath}/categoryProduct/side"
              ><img
                class="mr-2"
                src="${pageContext.request.contextPath}/imgs/rise.png"
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
                style="width: 21px; height: 21px"
              />유제품</a
            >
            <a class="dropdown-item" href="${pageContext.request.contextPath}/categoryProduct/instant"
              ><img
                class="mr-2"
                src="${pageContext.request.contextPath}/imgs/instant.png"
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

   <main>

     <!-- ======= 장바구니 ======= -->
      <div class="sidebar">

        <!-- ======= 상단 페이지 이동버튼 ======= -->
          <div class="text-center mt-2" id="pagebox">
            <input
              id="pagebtn"
              type="button"
              value="Top ↑"
              onclick="clickme()"
            />
          </div>
        </div>
      </div>


        <!-- 주문/결제페이지 작업중 -->
        
        <div class="order-payment__container mt-5 mb-5">
          <nav>
            <ul class="d-flex justify-content-end">
              <li><a href="">01 장바구니&nbsp;&nbsp;></a></li>
              <li><a href="" class="font-weight-bold">02 주문결제&nbsp;&nbsp;></a></li>
              <li><a href="">03 주문완료</a></li>
            </ul>
          </nav>



          <div class="container mb-5  border-dark border-bottom">
            <div class="row information-delivery mb-3">
              <div class="col-md-6 col-sm-12 d-flex flex-column">
                <p style="font-weight: bold; font-size:20px">배송정보(회원정보)</p>
                
		<c:url value="/completePayment" var="completePaymentUrl" />
		
			<form:form name="completePayment" id="completePayment" action="${completePaymentUrl}" method="POST">
                   <div class="recepient mb-4">
                     <p>수령인</p>
                     <input type="text" id="receiver" class="description"></input>
                   </div>
                   <div class="phone">
                     <p>휴대폰</p>
                     <input type="text" id="phone" class="description"></input>
                   </div>
                 </div>
                 <div class="col-md-6 col-sm-12 information-other border-left py-3">
                   <div class="address">
                     <p>우편번호</p>
						<input type="text" id="postcode" class="description"></input>
                   </div>
                   <div class="delivery-site">
                     <p>배송지</p>
						<input type="text" id="address" class="description"></input>
                   </div>
                   <div class="message ">
                     <p>배송메세지</p>
						<input type="text" id="message" class="description"></input>
                   </div>
                 </div>
              </form:form>   
                
                 
              </div>
     
                <p style="font-weight: bold; font-size:20px">주문상품 ${cartCount }건</p>
                <div class="col-12 d-flex order-group pb-3">
					<table class="table text-center" width="950" cellpadding="0" cellspacing="0" border="1" >
					<tr>
						<td>상품번호</td>		
						<td>상품명</td>
						<td>수량</td>
						<td>가격</td>
						<td>총금액</td>	
						<td>총 할인가</td>	
					</tr>
					<c:forEach var="cart" items="${cartProductList}" >	
						<tr>
							<td>${cart.product_id}</td>
							<td class="text-left pl-2"><img src="${cart.path}">[${cart.brand}]${cart.name}</td>
							<td>${cart.quantity}</td>
							<td><fmt:formatNumber value="${cart.price}" pattern="#,###"/>원</td>		
							<c:set var="productTotalPrice" value="${cart.price *  cart.quantity}"/>
							<td><fmt:formatNumber value="${productTotalPrice}" pattern="#,###"/>원</td>							
							<c:set var="productDiscountTotalPrice" value="${(cart.price * (1- (cart.discount/100))) * cart.quantity}"/>
							<td><fmt:formatNumber value="${productDiscountTotalPrice}" pattern="#,###"/>원</td>
							<c:set var="productTotalAcount" value="${productTotalAcount + productTotalPrice}"/>
							<c:set var="productDiscountAcount" value="${productDiscountAcount + productDiscountTotalPrice}"/>
							<c:set var="productDiscountPrice" value="${productTotalAcount - productDiscountAcount}"/>
							<input type="hidden" id="productDiscountPriceHidden" value="${productTotalAcount - productDiscountAcount}">	
						</tr>
					</c:forEach>		
					</table>		 
	               </div>
	               <hr>
              <div class="row information-payment">
                <div class="col-md-6 col-sm-12">
                  <p style="font-weight: bold; font-size:20px">쿠폰 | 적립금</p>
                  <div class="discount-type">
                      
                        <label><input type="checkbox" id="myCoupon" class="myDiscount" >&nbsp;쿠폰</label>
                        <select name="coupon" id="coupon-group" class = "coupon">
							<c:choose>
								<c:when test="${not empty couponList}">                            
				                    	<optgroup>
				                			<option value="0">쿠폰을 선택해 주세요!</option>
				                	<c:forEach items="${couponList}" var="couponList">
				                        	<option value="${couponList.discount}" >${couponList.coupon_name}, ${couponList.discount} %</option>
				                	</c:forEach>
				                		</optgroup>
								</c:when>
									<c:otherwise>
				                    	<optgroup>
				                        	<option value=""><td>사용 가능 쿠폰 없음</td></option>
				                		</optgroup>		
									</c:otherwise>
							</c:choose>
                        </select><br>
                        <label><input type="checkbox" id="myPoint" class="myDiscount">&nbsp;적립금</label>

                        <input type="number" id="inputPoint" Placeholder="사용할 금액을 입력하세요." value=0 min="0">
						
                        <div class="btn" id="applyPoint" style="height: 28px">적용</div>
<!--                         <div class="btn" id="applyReset">적용 초기화</div> -->
                        
                      
                      <pre>						보유적립금 <sec:authentication property="principal.memberVO.point"/>원</pre>
                    </div>
                  </div>
                  <div class="col-md-6 col-sm-12 border-left">
                    <p style="font-weight: bold; font-size: 20px;">결제</p>
                    <div class="payment-type">
                      <label><input type="radio" name="pay" checked="checked">&nbsp;카드결제</label>
                    </div>
                  </div>
                </div>



 <!-- 금액 부분 -->	
					<c:forEach var="cart" items="${cartProductList}" >	
						<c:set var="productTotalPrice" value="${cart.price *  cart.quantity}"/>
						<c:set var="productDiscountTotalPrice" value="${(cart.price * (1- (cart.discount/100))) * cart.quantity}"/>
						<c:set var="totalDiscountPrice" value="${totalDiscountPrice +  productDiscountTotalPrice}"/>
						<c:set var="productDiscount" value="${totalOriginalPrice - totalDiscountPrice}"/>
						<c:set var="discountPrice" value="${orderPaymentOne.price * ((orderPaymentOne.product_discount * 0.01) + point)}" scope="session"/>
       				   	<c:set var="totalOriginalPrice" value="${totalDiscountPrice -  discountPrice}"/>
  					</c:forEach>
  					
                <div class=" money pt-5 pb-4">
                  <div class="d-flex">
                    <div class="mr-3">상품금액</div>  
                    <div class="price product-price" id="productTotalAcount"><fmt:formatNumber value="${productTotalAcount}" pattern="#,###"/> 원</div>  
                  </div>
                  <div class="ml-1 mr-1">-</div>
                  <div class="d-flex">
                    <div class="mr-3">상품 할인금액</div>  
                    <div class="price discount-fee" id="productDiscountPrice"><fmt:formatNumber value="${productDiscountPrice}" pattern="#,###"/> 원</div>
                  </div>
                  <div class="ml-3 mr-3">+</div>
                  <div class="d-flex">
                    <div class="mr-3">배송비</div>  
                    <div class="price delivery-fee" id="delivery-fee">3,000 원</div>
                  </div>
                  <div class="ml-3 mr-3">=</div>
                  <div class="d-flex">
                    <div class="mr-3">주문금액</div>  
                    <div class="price total-price" id="productDiscountAcount"> <fmt:formatNumber value="${productDiscountAcount + 3000}" pattern="#,###"/> 원</div>  
                  </div>
				</div> <!--container information-delivery-->

      			   	
            </div><!--container information-delivery-->
            <div class="paymentBtn text-center">
              <input type="submit" id="iamportPayment" value="결제하기">
            </div>
          </div>
        </div>
        
       

        <!-- 여기까지 작업중 -->

    
      


    
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
    <script src="https://cdn.jsdelivr.net/npm/jquery@3.5.1/dist/jquery.min.js" integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj" crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js" integrity="sha384-9/reFTGAW83EW2RDu2S0VKaIzap3H66lZH81PoYlFhbGU+6BZp6G7niu735Sk7lN" crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/js/bootstrap.min.js" integrity="sha384-VHvPCCyXqtD5DqJeNxl2dtTyhF78xXNXdkwX1CZeRusQfRKp+tA7hAShOK/B/fQ2" crossorigin="anonymous"></script>
    -->
  </body>
  
  <script>
  		$(document).ready({

  			
  		})
  </script>
  
  
     <script type="text/javascript">

  //csrf
    var token = $("meta[name='_csrf']").attr("content");
    var header = $("meta[name='_csrf_header']").attr("content");
    
    function payment() {

    	// 운송장 번호 난수 발생 함수
    	function createDeliveryNumber(n) {
	  			  let str = ''
	  			  for (let i = 0; i < n; i++) {
	  			    str += Math.floor(Math.random() * 10)
	  			  }
	  			  return str
	  			}
	  			
	  			
        
        <sec:authorize access="isAnonymous()">
           location.href = "/into/loginForm";
        </sec:authorize>   
     
        <sec:authorize access="isAuthenticated()">
           <sec:authentication var="principal" property="principal"/>
           
           let member_name = "${principal.memberVO.name}";
           let email = "${principal.memberVO.email}";
           let phone = "${principal.memberVO.phone}";
           let member_id = "${principal.memberVO.id}";
           let cartCount = "${cartCount }";
           let product_name = "${cartProductList[0].name} 외 ${cartCount - 1} 건"; // 상품명
           let quantity = "${cartCount}"
           
   
           let delivery_number = createDeliveryNumber(6); // 운송장 번호
           
           let discountAmount = $("#productDiscountAcount").text();
           let product_id = "${product.id }";
           let merchantid = new Date().getTime();

           
           let input_point = $("#inputPoint").val(); // 입력 포인트
           let user_point = "${principal.memberVO.point}";
           let coupon_point = $("select[name='coupon']").val();
           let result_Point =  Number(user_point) - Number(input_point);
         

           
           var token = $("meta[name='_csrf']").attr("content");
           var header = $("meta[name='_csrf_header']").attr("content");
           
           IMP.init("imp90434583");
           IMP.request_pay({ 
               pg: "html5_inicis",
               pay_method: "card",
               merchant_uid: merchantid, // 주문 번호
               name: product_name,
               amount: discountAmount,
               buyer_email: email,
               buyer_name: member_name,
               buyer_tel: phone
               
           }, function(rsp) {
              
               // 배송 정보 입력
               let delivery_receiver = $("#receiver").val();
               let delivery_phone = $("#phone").val();
               let delivery_postcode = $("#postcode").val();
               let delivery_address = $("#address").val();
               let delivery_message = $("#message").val();
        	      
                  if(rsp.success) {
                   
                      $.ajax({
                         url: "/completePayment",
                     contentType:"application/json; charset='UTF-8'",
                         type: 'POST',
                         data:JSON.stringify({
                            impuid : rsp.imp_uid, // 결제 번호
                            merchantid: rsp.merchant_uid, // 주문 번호
                            amount: discountAmount,
                            status: rsp.status,
                            productid: product_id,
                            input_point: input_point,
                            user_point: user_point,
                            result_Point: result_Point,
                            member_id: member_id,
                            quantity: quantity,
                            product_name: product_name,
                            delivery_number: delivery_number,
                            delivery_receiver: delivery_receiver,
                            delivery_phone : delivery_phone,
                            delivery_postcode: delivery_postcode,
                            delivery_address: delivery_address,
                            delivery_message: delivery_message
                            
                         }),
                         beforeSend: function(xhr){
                            xhr.setRequestHeader(header, token);
                         }
                      }).done(function(successPayment){
                         alert("결제에 성공하셨습니다.");
                         location.href="/order/orderPaymentView"
                         
                         //orderSucess(payment_data);
                         
                      });
                      
                  }else {
                     alert("결제에 실패하셨습니다." + rsp.error_msg);
                  }
                }
           );
        </sec:authorize>
        
     } // payment() 끝
    

   

       //문서가 준비되면 제일먼저 실행
       $(document).ready(function(){
          $("#iamportPayment").click(function(){
             payment();//버튼 클릭하면 호출
          });
       });
       
    </script>
</html>