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
	<h1>카트</h1>
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

	<form:form class="orderCart" action="${pageContext.request.contextPath}/order/orderPayment" method="POST">  
	  <input type="hidden" name="member_id" value="${member_id}">	
	  <c:forEach var="cart" items="${cartProductList}" >
		<tr>
			<td><input type="checkbox" name="selectProduct" class="checkProduct" value="${cart.cart_id}"></td>
			<td>${cart.cart_id}</td>
			<td>${cart.member_id}</td>
			<td>${cart.product_id}</td>
			<td><img src="${cart.path}">[${cart.brand}]${cart.name}</td>
			<td>${cart.quantity}</td>
			<td class="eachPrice">${cart.price}</td>
			<c:set var="productTotalPrice" value="${(cart.price * (1- (cart.discount/100))) * cart.quantity}"/>
			<td><fmt:formatNumber value="${productTotalPrice}" pattern="#,###"/>원</td>
			<c:set var="totalPrice" value="${totalPrice + productTotalPrice }"/>
			<td>
				<a 
					class="productDelete" 
					href="${pageContext.request.contextPath}/user/cart/${cart.cart_id}">
				<img src="${cart.path}"></a>
			</td>
		</tr>		  	
      </c:forEach>
    
      <tr>
        <td><button type="submit" class="btn" id="orderSubmitBtn">주문하기</button></td></tr>
     
    </form:form>
     

    </table>

      <h1 id="cartPrice">장바구니 총 결제금액 = <fmt:formatNumber value="${totalPrice}" pattern="#,###"/>원</h1> 
      
    
</body>
<script type="text/javascript">
$(document).ready(function(){
	
	//상품삭제
	$(".productDelete").click(function(event) {
		event.preventDefault();	
		console.log("ajax 호출 전");		
		
		let trObj = $(this).parent().parent();
		let eachPrice = $(this).find(".eachPrice").val();
		
		
		console.log("eachPrice : " + eachPrice);
		
		$.ajax({
			type: "DELETE",
			url : $(this).attr("href"),
			success : function(result){
				console.log(result);
				if(result == "SUCCESS"){
					$(trObj).remove();
					//$("#cartPrice").empty();	
					//$("#cartPrice").append("장바구니 총 결제금액 = <fmt:formatNumber value='${totalPrice}' pattern='#,###'/>원");
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
		$('input:checkbox[type=checkbox]:checked').each(function () {
			productNum.push($(this).val());
		});
		console.log("productNum : " + productNum);
		let list = {
			numList: productNum
		}
		console.log(JSON.stringify(list));
		
		//ajax 날리는 부분 추가 수정 필요
		$.ajax({			
			type : "POST",
			url : $(this).attr("action"),
			cache : false,
			contentType:"application/json; charset='UTF-8'",
			data : JSON.stringify(list),
			success : function (data) {
				$(".orderCart").submit()
			},
			error : function(e) {
				console.log(e);
			}	
		}); //end ajax	
		
		
		//$(".orderCart").submit();
		
	}); //end #orderSubmit.click();
	
	
	
	
}); //end ready()
</script>
</html>