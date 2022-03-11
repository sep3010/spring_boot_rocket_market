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
    />
    <!-- Bootstrap CSS -->
    <link
      rel="stylesheet"
      href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/css/bootstrap.min.css"
      integrity="sha384-zCbKRCUGaJDkqS1kPbPd7TveP5iyJE0EjAuZQTgFLD2ylzuqKfdKlfG/eSrtxUkn"
      crossorigin="anonymous"
    />
    <link rel="stylesheet" href="./css/chatbot-ui.css" />
    <link rel="stylesheet" href="./css/font.css" />

    <title>ROCKET MARKET :: 신속배송</title>
    <script src="https://code.jquery.com/jquery-1.12.4.min.js"></script>
    <link rel="shortcut icon" type="image/x-icon" href="./imgs/logo.png" />

	<style>
		#productImage {
			width:200px;
			height:200px;
		}
		
		
	</style>
</head>
<body>
	<h1>${name}목록</h1>
	
	<p><a href="${pageContext.request.contextPath}/">메인</a></p>
	
     <!-- ======================== 메인페이지 상품표시 =========================== -->
     <div class="container pt-5">
        <div class="card-deck pb-5">
			<c:forEach var="product" items="${productList}">
          	<div class="card">
            	<a href=""><!-- 상품번호 넣어서 상품 상세 페이지로 이동 -->
            	<c:choose>
					<c:when test="${not empty product.productImages}">
						<c:forEach var="main" items="${product.productImages}">
							<img id="productImage" src="${main.path}" class="card-img-top">
						</c:forEach>
					</c:when>
					<c:otherwise>
					대표 이미지 없음
					</c:otherwise>
				</c:choose>
            	</a>
            	<div class="card-body pl-1" style="border: none;">
              		<h6 class="card-title">[${product.brand}] ${product.name}</h6>
              		<p class="card-text">
              		<div class="price"><fmt:formatNumber value="${product.price}" pattern="#,###"/>원
              		</div>
              		</p>
            	</div><!-- card-body -->
          	</div><!-- card -->
          	</c:forEach>
         </div> <!-- card-deck -->
     </div>
			
	<!-- 페이징번호 -->
	<c:if test="${pageMaker.pre}">
		<a href="${pageContext.request.contextPath}/${pageName}${pageMaker.makeQuery(pageMaker.startPage - 1) }">
		«</a>
	</c:if>

	<c:forEach var="idx" begin="${pageMaker.startPage }"
		end="${pageMaker.endPage }">
		<a href="${pageContext.request.contextPath}/${pageName}${pageMaker.makeQuery(idx)}">${idx}</a>
	</c:forEach>

	<c:if test="${pageMaker.next && pageMaker.endPage > 0}">
		<a href="${pageContext.request.contextPath}/${pageName}${pageMaker.makeQuery(pageMaker.endPage +1) }">
		»</a>
	</c:if>	

</body>
</html>