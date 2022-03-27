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
    <!-- Bootstrap CSS -->
    
    <link
      rel="stylesheet"
      href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/css/bootstrap.min.css"
      integrity="sha384-zCbKRCUGaJDkqS1kPbPd7TveP5iyJE0EjAuZQTgFLD2ylzuqKfdKlfG/eSrtxUkn"
      crossorigin="anonymous"
    />
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/font.css" />

    <title>ROCKET MARKET :: 신속배송</title>
    <script src="https://code.jquery.com/jquery-1.12.4.min.js"></script>
    <link rel="shortcut icon" type="image/x-icon" href="${pageContext.request.contextPath}/imgs/logo.png" />

  </head>
<body>

        <div class="container pt-5">
          
            <h2 class="pb-3" style="font-weight: bold;"> 주문 상세 내역 </h2>
            <table class="table table-bordered">
            <c:set var="order" value="${orderDetail}"/>
				<tr>
					<td>주문번호</td>
					<td colspan="2">${order.order_id}</td>
					<td>주문일자</td>
					<td>${order.order_date}</td>
					<td>배송상태</td>
					<td td colspan="6">${order.status}</td>
				</tr>
				<c:forEach var="deliveryInfo" items="${order.delivery}">						
					<tr>
						<td>받는 사람</td>
						<td colspan="2">${deliveryInfo.receiver}</td>
						<td>연락처</td>
						<td colspan="8">${delivery.phone}</td>
					</tr>
					<tr>
						<td>우편번호</td>
						<td colspan="2">${delivery.postcode}</td>
						<td>주소</td>
						<td colspan="8">${delivery.address}</td>
					</tr>
					<tr>
						<td>배송 메세지</td>
						<td colspan="2">${deliveryInfo.message}</td>
						<td>운송장번호</td>
						<td colspan="8">${delivery.delivery_number}</td>
					</tr>						
				</c:forEach><%-- <c:forEach var="delivery"> --%>
				<tr>
					<td colspan="3">상품</td>
					<td>할인율</td>
					<td>가격</td>
					<td>수량</td>
           			<td colspan="3">구매 후기</td>
				</tr>
			
				
				<c:forEach var="detail" items="${order.orderDetails}" varStatus="vs">
					<c:forEach var="product" items="${detail.products}">
						<form:form action="${pageContext.request.contextPath}/user/review_write" method="post">
							<tr>
								<c:forEach var="image" items="${product.productImages}">
									<input type="hidden" name="path" value="${image.path}">
									<td><img src="${image.path}"></td>
								</c:forEach>				
								<td colspan="2">[${product.brand}] ${product.name}</td>
								
								<td>${product.discount}%</td>		
								<td>${product.price}</td>
								<td>${detail.quantity}</td>
								<c:if test="${not empty boardIds}">
								<c:forEach var="board" items="${boardIds}" varStatus="status" begin="0" end="0">	
									<c:choose>
										 <c:when test="${orderDetail.orderDetails[vs.index].order_detail_id == boardIds[vs.index].order_detail_id}">
										 	<td>
												<a href="${pageContext.request.contextPath}/user/review_content/${boardIds[vs.index].board_id}">후기 보기</a>
											</td>
										 </c:when>
										<c:otherwise>
											<td>
												<input type="hidden" name="order_detail_id" value="${detail.order_detail_id}">
												<input type="hidden" name="order_id" value="${detail.order_id}">
												<input type="hidden" name="name" value="${product.name}">
												<input type="hidden" name="brand" value="${product.brand}">	
												<input class="btn btn-outline-dark" type="submit" value="후기 작성">
											</td>
										</c:otherwise>
									</c:choose>
								</c:forEach>
								</c:if>
								<c:if test="${empty boardIds}">
									<td>
										<input type="hidden" name="order_detail_id" value="${detail.order_detail_id}">
										<input type="hidden" name="order_id" value="${detail.order_id}">
										<input type="hidden" name="name" value="${product.name}">
										<input type="hidden" name="brand" value="${product.brand}">	
										<input class="btn btn-outline-dark" type="submit" value="후기 작성">
									</td>
								</c:if>		
							</tr>	
						</form:form>				
					</c:forEach><%-- <c:forEach var="product"> --%>
				</c:forEach><%-- <c:forEach var="detail"> --%>
				<c:if test="${vs.last}">
					<tr>
						<td>총 가격</td>
						<td td colspan="8"><fmt:formatNumber value="${order.amount}" pattern="#,###"/></td>
					</tr>
				</c:if><%-- <c:if test="${vs.last}"> --%>
			
            </table>

        </div><!-- container -->
        

    
      


    <!-- Optional JavaScript; choose one of the two! -->

    <!-- Option 1: jQuery and Bootstrap Bundle (includes Popper) -->
    <script
      src="https://cdn.jsdelivr.net/npm/jquery@3.5.1/dist/jquery.slim.min.js"
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
    <script src="https://cdn.jsdelivr.net/npm/jquery@3.5.1/dist/jquery.slim.min.js" integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj" crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js" integrity="sha384-9/reFTGAW83EW2RDu2S0VKaIzap3H66lZH81PoYlFhbGU+6BZp6G7niu735Sk7lN" crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/js/bootstrap.min.js" integrity="sha384-VHvPCCyXqtD5DqJeNxl2dtTyhF78xXNXdkwX1CZeRusQfRKp+tA7hAShOK/B/fQ2" crossorigin="anonymous"></script>
    -->
  </body>
</html>