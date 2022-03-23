<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="_csrf" content="${_csrf.token}"/>
<meta name="_csrf_header" content="${_csrf.headerName}"/>
<title>userHome</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
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
	.closeBtn{
		width:100px;
		height:100px;
	}
</style>

</head>
<body>
	<h1>위시리스트</h1>
	<!-- 메인으로 가는 버튼 -->
	<h1><a href="${pageContext.request.contextPath}/">Main Home</a></h1>
	<table width="950" cellpadding="0" cellspacing="0" border="1">
	<tr>	
		<td>상품명</td>
		<td>가격</td>
		<td>상품삭제</td>

	</tr>	
	
	<c:set var="totalPrice" value="0"/>
	
	<c:forEach var="wishlist" items="${wishProductList}" >
	  <tr>
			<td><img src="${wishlist.path}">[${wishlist.brand}]${wishlist.name}</td>
			<c:set var="productTotalPrice" value="${(wishlist.price * (1- (wishlist.discount/100)))}"/>
			<td><fmt:formatNumber value="${productTotalPrice}" pattern="#,###"/>원</td>
			<td>
				<a 
					class="productDelete" 
					href="${pageContext.request.contextPath}/user/wishList/${wishlist.wishlist_id}">
				<img class="closeBtn" src="/imgs/close_img.png"></a>
			</td>
		</tr>		  	
      </c:forEach>
   </table>

    
    
      
</body>
<script type="text/javascript">
$(document).ready(function(){

	//상품삭제
	$(".productDelete").click(function(event) {
		event.preventDefault();	
		console.log("ajax 호출 전");		
		
		let trObj = $(this).parent().parent();
	
		$.ajax({
			type: "DELETE",
			url : $(this).attr("href"),
			success : function(result){
				console.log(result);
				if(result == "SUCCESS"){
					$(trObj).remove();	
				}
			},
			error : function(e){
				console.log(e);
				alert("error : " + e);
			}
		}) //end ajax

		
	}); //end .productDelete.click();
	
	
}); //end ready()
</script>
</html>