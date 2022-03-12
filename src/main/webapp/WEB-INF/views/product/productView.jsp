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

</head>


<body>
	<h1><a href="${pageContext.request.contextPath}/">Main Home</a></h1>

	<h1>상품상세페이지입니다.</h1>
	
	<c:forEach var="productInfo" items="${productInfo}" begin="1" end="1">
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
<%-- 		<p>
		  <c:choose>
			<c:when test="${not empty product.productImages}">
			  <c:forEach var="image" items="${product.productImages}">
			  	<c:set var="main" value="${image.information_type}"/>
			  	<c:if test="${main eq 'main'}"><c:out value="${image.path}"/></c:if>
			  	<c:set var="mainPath" value="${image.path}"/>
				<img src="${mainPath}">
			  </c:forEach>
			</c:when>
	 	    <c:otherwise>
		        대표 이미지 없음
			</c:otherwise>
		  </c:choose>		
		</p> --%>
		<p></p>
	
	
	</c:forEach>	
</body>
</html>