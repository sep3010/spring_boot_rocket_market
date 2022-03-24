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
<title>ROCKET MARKET :: 신속배송</title>
<script src="https://code.jquery.com/jquery-1.12.4.min.js"></script>
<link rel="shortcut icon" type="image/x-icon" href="./imgs/logo.png" />
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>

<!-- Bootstrap CSS -->
<link
  rel="stylesheet"
  href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/css/bootstrap.min.css"
  integrity="sha384-zCbKRCUGaJDkqS1kPbPd7TveP5iyJE0EjAuZQTgFLD2ylzuqKfdKlfG/eSrtxUkn"
  crossorigin="anonymous"
/>
   
<link rel="stylesheet" href="./font.css" />
<link rel="stylesheet" href="./chatbot-ui.css" />
<link rel="stylesheet" href="./product_details.css" />

<!-- csrf meta tag -->
<meta name="_csrf" content="${_csrf.token}"/>
<meta name="_csrf_header" content="${_csrf.headerName}"/>


    
<script type="text/javascript">
	//csrf
	var token = $("meta[name='_csrf']").attr("content");
	var header = $("meta[name='_csrf_header']").attr("content");
	
	
	//Ajax spring security header..
	$(document).ajaxSend(function(e, xhr, options){
		xhr.setRequestHeader(header, token);
	});


	$(document).ready(function(){
		
		$("#modify").on('click', function(){
			
			// 해당 주소로 이동
			location.href = "${pageContext.request.contextPath}/admin/modifyView/${product.id}";

		}); 
		
	}); //end ready()
	
</script>

</head>
<!-- 소은 -->
<body>

	<h1>상품상세</h1>
	<table width="750" cellpadding="0" cellspacing="0" border="1">
		<tr>
			<td>상품번호</td>
			<td>${product.id}</td>
			<td>상품명</td>
			<td>${product.name}</td>
		</tr>
		<tr>
			<td>브랜드</td>
			<td>${product.brand}</td>
			<td>상품종류</td>
			<td>${product.type}</td>
		</tr>
		<tr>
			<td>용량</td>
			<td>${product.capacity}</td>
			<td>판매단위</td>
			<td>${product.unit}</td>
		</tr>
		<tr>
			<td>가격</td>
			<td>${product.price}</td>
			<td>할인율</td>
			<td>${product.discount}%</td>
		</tr>
		<tr>
			<td>포장타입</td>
			<td>${product.packaging}</td>
			<td>배송타입</td>
			<td>${product.delivery_type}</td>
		</tr>
		<tr>
			<td>재고량</td>
			<td>${product.stock}</td>
			<td>판매상태</td>
			<c:choose>
			<c:when test="${product.enabled == 1}">
				<td>판매중</td>
			</c:when>
			<c:otherwise>
				<td>판매종료</td>
			</c:otherwise>
		</c:choose>
		</tr>
		<c:forEach var="image" items="${product.productImages}">
			<c:if test="${image.information_type == 'main'}">
				<tr>
					<td colspan="4">메인/썸네일 이미지</td>
				</tr>
				<tr>	
					<td colspan="4"><img src="${image.path}"></td>
				</tr>
			</c:if>
			<c:if test="${image.information_type == 'info'}">
				<tr>
					<td colspan="4">상품정보 이미지</td>
				</tr>	
				<tr>	
					<td colspan="4"><img src="${image.path}"></td>
				</tr>
			</c:if>
			<c:if test="${image.information_type == 'detail'}">
				<tr>
					<td colspan="4">상품상세 이미지</td>
				</tr>
				<tr>	
					<td colspan="4"><img src="${image.path}"></td>
				</tr>
			</c:if>

		</c:forEach>
		
		
	</table>	
	<button id="modify">수정하기</button>

	
</body>
</html>