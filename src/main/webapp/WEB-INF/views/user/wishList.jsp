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


</head>
<body>
	<h1>위시리스트</h1>
	<!-- 메인으로 가는 버튼 -->
	<h1><a href="${pageContext.request.contextPath}/">Main Home</a></h1>
	<table width="950" cellpadding="0" cellspacing="0" border="1">
	<tr>
		<td>선택</td>
		<td>장바구니번호</td>
		<td>회원번호</td>
		<td>상품번호</td>		
		<td>상품명</td>
		<td>수량</td>
		<td>가격</td>
		<td>총금액</td>	
		<td>상품삭제</td>

	</tr>	
	
	
	<c:set var="totalPrice" value="0"/>
	
	<input type="hidden" name="member_id" value="${member_id}">	
	<c:forEach var="wishlist" items="${wishProductList}" >
	  <tr>
			<td>${wishlist.wishlist_id}</td>
			<td>${wishlist.member_id}</td>
			<td>${wishlist.product_id}</td>
			<td><img src="${wishlist.path}">[${wishlist.brand}]${wishlist.name}</td>
			<td>${wishlist.price}</td>
			<c:set var="productTotalPrice" value="${(wishlist.price * (1- (wishlist.discount/100))) * cart.quantity}"/>
			<td><fmt:formatNumber value="${productTotalPrice}" pattern="#,###"/>원</td>
			<c:set var="totalPrice" value="${totalPrice + productTotalPrice }"/>
			<td>
				<a 
					class="productDelete" 
					href="${pageContext.request.contextPath}/user/wishList/${wishlist.wishlist_id}">
				<img src="${cart.path}"></a>
			</td>
		</tr>		  	
      </c:forEach>
   </table>

    
    
      
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
					$("#cartPrice").append("<div> 장바구니 총 결제금액 = " + alteredPriceJS +"원 </div>");

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
		
		//ajax 날리는 부분 추가 수정 필요
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