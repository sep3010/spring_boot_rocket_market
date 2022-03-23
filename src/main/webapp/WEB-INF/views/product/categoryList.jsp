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
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />
    <!-- Bootstrap CSS -->
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/css/bootstrap.min.css"
        integrity="sha384-zCbKRCUGaJDkqS1kPbPd7TveP5iyJE0EjAuZQTgFLD2ylzuqKfdKlfG/eSrtxUkn" crossorigin="anonymous" />
    <!-- jQuery -->
    <script src="https://code.jquery.com/jquery-1.12.4.min.js"></script>
	<!-- iamport.payment.js -->
	<script type="text/javascript" src="https://cdn.iamport.kr/js/iamport.payment-1.1.8.js"></script>


	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
	
    <title>Rocket Market :: 신속배송</title>
    <link rel="shortcut icon" type="image/x-icon" href="logo.png" />

    <!-- 폰트 -->
    <link rel="preconnect" href="https://fonts.googleapis.com">
	<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
	<link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR&display=swap" rel="stylesheet">

 
    
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
	
</head>


<body>
	<h1><a href="${pageContext.request.contextPath}/">Main Home</a></h1>

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
            <div class="quantity">총 ${productTotal} 개</div>
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
		<c:if test="${pageMaker.pre}">
		  <a href="${pageContext.request.contextPath}/${pageName}${pageMaker.makeQuery(pageMaker.startPage - 1) }">
		  «</a>
		</c:if>

		<c:forEach var="idx" begin="${pageMaker.startPage }" end="${pageMaker.endPage }">
		  <a href="${pageContext.request.contextPath}/${pageName}${pageMaker.makeQuery(idx)}">${idx}</a>
		</c:forEach>

		<c:if test="${pageMaker.next && pageMaker.endPage > 0}">
		  <a href="${pageContext.request.contextPath}/${pageName}${pageMaker.makeQuery(pageMaker.endPage +1) }">
		  »</a>
		</c:if>	
		
        <footer>
        </footer>
        <!-- container -->
        <!-- Optional JavaScript; choose one of the two! -->
        <!-- Option 1: jQuery and Bootstrap Bundle (includes Popper) -->
        <script src="https://cdn.jsdelivr.net/npm/jquery@3.5.1/dist/jquery.min.js"
            integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj" crossorigin="anonymous">
        </script>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/js/bootstrap.bundle.min.js"
            integrity="sha384-fQybjgWLrvvRgtW6bFlB7jaZrFsaBXjsOMm/tB9LTS58ONXgqbR9W8oWht/amnpF" crossorigin="anonymous">
        </script>
        <!-- Option 2: Separate Popper and Bootstrap JS -->
        <!--
            <script src="https://cdn.jsdelivr.net/npm/jquery@3.5.1/dist/jquery.min.js" integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj" crossorigin="anonymous"></script>
            <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js" integrity="sha384-9/reFTGAW83EW2RDu2S0VKaIzap3H66lZH81PoYlFhbGU+6BZp6G7niu735Sk7lN" crossorigin="anonymous"></script>
            -->
    </div> <!-- container 끝 -->

</body>
</html>