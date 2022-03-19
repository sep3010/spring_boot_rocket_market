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

    <title>Rocket Market :: 신속배송</title>
    <link rel="shortcut icon" type="image/x-icon" href="logo.png" />

    <!-- 폰트 -->
    <link rel="preconnect" href="https://fonts.googleapis.com">
	<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
	<link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR&display=swap" rel="stylesheet">
	<script type="text/javascript">
      $(document).ready(function () {
   	    
    	$(".AnonymousInCart").submit(function(event) {
    	  alert("로그인이 필요한 기능입니다.");
    	})  

        $(".inCart").submit(function() {   	
	      // csrf
       	  var token = $("meta[name='_csrf']").attr("content");
       	  var header = $("meta[name='_csrf_header']").attr("content");       	
          event.preventDefault();
         
         //변경필수
         let productId = $(this).find(".productId").val();
         let productQuantity = $(this).find(".productQuantity").val();
       	 let memberId = $(this).find(".memberId").val();

         var data = {
    	   product_id : productId,
    	   quantity : productQuantity,
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
 
	  });
</script>

</head>


<body>
	<h1><a href="${pageContext.request.contextPath}/">Main Home</a></h1>

	<h1>상품상세페이지입니다.</h1>
	
	<c:forEach var="productInfo" items="${productInfo}">
		<p>${productInfo.name}</p>
		<p>${productInfo.price}</p>
		<p>${productInfo.capacity}</p>
		<p>${productInfo.brand}</p>
		<p>${productInfo.stock}</p>
		<p>${productInfo.unit}</p>
		<p>${productInfo.type}</p>
		<p>${productInfo.packaging}</p>
		<p>${productInfo.discount}</p>
		<p>${productInfo.delivery_type}</p>
		
		<h4>============ 장바구니 버튼 ============</h4>
		<!-- 비로그인 상태 -->
		<sec:authorize access="isAnonymous()">
	    <c:choose>
	      <c:when test="${productInfo.stock > 0}">
	        <form:form id="AnonymousInCart" action="/login" method="post" >
			  <input type="number" class="productQuantity" name="productQuantity" value="1">
			  <input type="submit" class="submit btn" value="장바구니" >
			</form:form>		                	
		  </c:when>
		  <c:otherwise>
		    <p>품절</p>	
		  </c:otherwise>		           		                
	    </c:choose>	
	    </sec:authorize>		
	    
	    <!-- 로그인 상태 -->
		<sec:authorize access="hasAuthority('ROLE_USER')">
	    <c:choose>
	      <c:when test="${productInfo.stock > 0}">
	        <form class="inCart" action="${pageContext.request.contextPath}/user/cart" method="post" >
	          <input type="hidden" class="productId" name="productId" value="${productInfo.id}">	          
	          <input type="hidden" class="memberId" name="memberId" value="<sec:authentication property="principal.memberVO.id"/>">
	          <input type="number" class="productQuantity" name="productQuantity" value="1">
	          <input type="submit" class="submit btn" value="장바구니" >
			</form>		                	
		  </c:when>
		  <c:otherwise>
		    <p>품절</p>	
		  </c:otherwise>		           		                
	    </c:choose>	
	    </sec:authorize>			
		<h4>============ 장바구니 버튼 끝 ============</h4>
		
 		<p>
		  <c:choose>
			<c:when test="${not empty productInfo.productImages}">
			  <c:forEach var="image" items="${productInfo.productImages}">
			  	<c:set var="main" value="${image.information_type}"/>
			  	<c:set var="detail" value="${image.information_type}"/>
			  	<c:set var="info" value="${image.information_type}"/>
			  	<c:choose>
			  	  <c:when test="${main eq 'main'}">
					<p>메인이미지<img src="${image.path}"></p>
			  	  </c:when>
			  	</c:choose>
			  	<c:choose>
			  	  <c:when test="${detail eq 'detail'}">
					<p>상품상세이미지<img src="${image.path}"></p>
			  	  </c:when>
			  	</c:choose>
			  	<c:choose>
			  	  <c:when test="${info eq 'info'}">
					<p>제품설명<img src="${image.path}"></p>
			  	  </c:when>
			  	</c:choose>			  	
			  </c:forEach>
			</c:when>
		  </c:choose>		
		</p> 
	</c:forEach>

		
	


	==========================================================================
	<c:forEach var="recommend" items="${recommendProduct}">
	  <h5 class="product_name">[${recommend.brand}]${recommend.name}</h5>
	  <c:choose>
		<c:when test="${not empty recommend.productImages}">
		  <c:forEach var="thumbnails" items="${recommend.productImages}">
		    <a href="${pageContext.request.contextPath}/product/productView/${recommend.id}" id="image-title">
			  <c:choose>
				<c:when test="${not empty recommend.productImages}">
					<c:forEach var="thumbnail" items="${recommend.productImages}">
						<td><img src="${thumbnail.path}"></td>
					</c:forEach>
				</c:when>
				<c:otherwise>
					<td>대표 이미지 없음</td>
				</c:otherwise>
			  </c:choose>
			</a>			
		  </c:forEach>
		</c:when>
	    <c:otherwise>
		   대표 이미지 없음
	    </c:otherwise>
	  </c:choose>
	</c:forEach>
	
	===================================================================================================
	후기~~!!!!
	<c:forEach var="review" items="${productBoard}">
	  <p>${review.content}</p>
	  <p>${review.board_date}</p>
	  <p>${review.score}</p>
	  <p>${review.nickname}</p>
	</c:forEach>
	
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
</body>
</html>