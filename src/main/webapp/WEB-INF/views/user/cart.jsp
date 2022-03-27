<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
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

<meta name="_csrf" content="${_csrf.token}"/>
<meta name="_csrf_header" content="${_csrf.headerName}"/>

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
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/cart.css" />

<!-- 폰트 -->
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR&display=swap" rel="stylesheet">

<script type="text/javascript">
   // csrf
   var token = $("meta[name='_csrf']").attr("content");
   var header = $("meta[name='_csrf_header']").attr("content");

    //Ajax spring security header..
   $(document).ajaxSend(function(e, xhr, options){
      xhr.setRequestHeader(header, token);
   });
</script> 

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

    </style>


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

      <div class="container mb-3 pt-5">
        <nav id="cart_nav">
          <ul class="d-flex justify-content-end">
            <li><a href=""class="font-weight-bold">01 장바구니&nbsp;&nbsp;></a></li>
            <li><a href="" >02 주문결제&nbsp;&nbsp;></a></li>
            <li><a href="">03 주문완료</a></li>
          </ul>
        </nav>

        <script src="${pageContext.request.contextPath}/js/cart.js"></script>
        <table class="table table-bordered text-center"  id="cart_table">
          <thead>
            <tr>
              
              <th></th>
              <th id="table_cart_data">상품정보</th> <!-- 전체선택cart.js 적용 관련 확인필요 -->
              <th scope="col-sm" id="table_cart_amount">수량</th>
              <th scope="col-sm" id="table_cart_result">금액</th>
              <th scope="col-sm" id="table_cart_close"></th>
    
            </tr>
          </thead>
   
   		  <c:set var="totalPrice" value="0"/>
          <tbody>
		    <form:form class="orderCart" action="${pageContext.request.contextPath}/order/orderPayment" method="POST">  
		    <input type="hidden" name="member_id" value="${member_id}">   
		      <c:forEach var="cart" items="${cartProductList}" >
		        <tr>
		          <td><input type="checkbox" name="selectProduct" class="checkProduct" value="${cart.cart_id}"></td>
		          <td class="text-left"><img src="${cart.path}" style="width: 100px; height: 100px;">
		          <span id="menu_title">[${cart.brand}]${cart.name}</span></td>
		          <td>${cart.quantity}</td>
		          <c:set var="productTotalPrice" value="${(cart.price * (1- (cart.discount/100))) * cart.quantity}"/>
		          <td><fmt:formatNumber value="${productTotalPrice}" pattern="#,###"/>원</td>
		          <input type="hidden" id="eachPrice" value="${productTotalPrice}"/>
		          <c:set var="totalPrice" value="${totalPrice + productTotalPrice }"/>
		          <td>
		            <a 
		               class="productDelete" 
		               href="${pageContext.request.contextPath}/user/cart/${cart.cart_id}">
		            <img class="closeBtn" src="${pageContext.request.contextPath}/imgs/close_img.png" width="25px"></a>
		         </td>
		       </tr>           
		     </c:forEach>
		    
		     <tr>
		       <td><button type="submit" class="btn btn-outline-danger"" id="orderSubmitBtn">주문하기</button></td>
		     </tr>
		    </form:form>
    </table>

        <br>
        <br>
        <table class="table table-bordered text-center" id="result_price_table">
          <tr>
            <td>
        
          <div id="result_price_kor"> 총 주문 금액</div>
  
          <div id="cartPrice"> <h4><fmt:formatNumber value="${totalPrice}" pattern="#,###"/> <span>원</span></h4></div>
        </td>
        </tr>
        </table>
        <br>
        <br>
	
	    <input type="hidden" id="cartPriceOnly" value="${totalPrice}">
	    <input type="hidden" id="cartPrice_value" value="">
	    <p id="cartPriceCheck"><c:set var="totalPrice" value="${totalPrice}"/></p>
	    
    
    
    
      
</body>
<script type="text/javascript">
$(document).ready(function(){
   
   function numberWithCommas(x) {
       return x.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ",");
   }
   
   //상품삭제
   $(".productDelete").click(function(event) {
      event.preventDefault();   
      console.log("ajax 호출 전");      
      
      let trObj = $(this).parent().parent();
      let eachPrice = $(trObj).find("#eachPrice").val();
      let cartPriceOnly = $("#cartPriceOnly").val();
      
      console.log("eachPrice : " + eachPrice);
      console.log("cartPriceOnly : " + cartPriceOnly);
      
      alteredPrice = cartPriceOnly - eachPrice;
      
      var alteredPriceJS = numberWithCommas(alteredPrice);
      
      console.log("alteredPriceJS : " + alteredPriceJS);
   
      $.ajax({
         type: "DELETE",
         url : $(this).attr("href"),
         success : function(result){
            console.log(result);
            if(result == "SUCCESS"){
               $(trObj).remove();   
               $("#cartPriceCheck").empty();
               
               $("#cartPriceOnly").val(alteredPrice);
               
               $("#cartPriceCheck").append("<div><c:set var='totalPrice' value=" + alteredPriceJS + "/></div>");
               
               $("#cartPrice").empty();   
               $("#cartPrice").append("<h4>" + alteredPriceJS +"<span>원</span></h4>");

            }
         },
         error : function(e){
            console.log(e);
            alert("error : " + e);
         }
      }) //end ajax

      
   }); //end .productDelete.click();
   
   
   //주문하기 이동전, 체크하지 않은 상품 장바구니에서 삭제
   $("#orderSubmitBtn").on('click', function(){
      event.preventDefault();   
      console.log("ajax 호출 전");      
      
      //선택한 상품명가져오기
      let productNum = [];
      $('input:checkbox[type=checkbox]').each(function () {
         if($(this).is(":checked")==false){
            productNum.push($(this).val());   
         }
      });
      console.log("productNum : " + productNum);
      
      let list = {
         numList: productNum
      }
      
      console.log(JSON.stringify(list));
      
      $.ajax({         
         type : "POST",
         url : "${pageContext.request.contextPath}/order/exceptProduct",
         cache : false,
         contentType:"application/json; charset='UTF-8'",
         data : JSON.stringify(list),
         success : function (data) {
            $(".orderCart").submit()
         },
         error : function(e) {
            alert("error:" + e);
         }   
      }); //end ajax   

      
   }); //end #orderSubmit.click();
   
   
   
   
}); //end ready()
</script>
</html>