<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags"%>
<!DOCTYPE html>
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
   <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
	<!-- csrf meta tag -->
	<meta name="_csrf" content="${_csrf.token}"/>
	<meta name="_csrf_header" content="${_csrf.headerName}"/>
   
    <style>
     
      a{color: rgb(110, 70, 18);}
      a:hover{color: rgb(110, 70, 18);font-weight: bold;}

    </style>
       
   <script type="text/javascript">
		//csrf
		var token = $("meta[name='_csrf']").attr("content");
		var header = $("meta[name='_csrf_header']").attr("content");
		
		//Ajax spring security header..
		$(document).ajaxSend(function(e, xhr, options){
			xhr.setRequestHeader(header, token);
		});
		
	
		$(document).ready(function(){
			
			
			// 상품 상세 팝업 띄우기
			$(".orderDetail").on("click", function(event){
				event.preventDefault();
				
				let popURL = $(this).attr("href");
				console.log("popURL : " + popURL);
				
				let popUp = window.open(popURL, 'orderDetail',
						'top=20, left=300, width=800px, height=700px, scrollbars=yes');
				
				
				
			});
	   
		}); //end ready()
	
	</script>
</head>
<body>

        <div class="container pt-5">
            <h2 class="pb-3" style="font-weight: bold;"> 주문 내역 </h2>
       		     <table class="table table-bordered">
		              <thead>
		                <tr>
		                  <th scope="col-sm" id="table_number">주문번호</th>
		                  <th scope="col-sm" id="table_img">주문일자</th>
		                  <th scope="col-sm" id="table_name">주문상품</th>
		                  <th scope="col-sm" id="table_percent">결제 금액</th>
		                  <th scope="col-sm" id="table_price">주문상태</th>
		                  <th scope="col-sm" id="table_delivery">상세내역보기</th> 
		                </tr>
		              </thead>
      
		              <c:forEach var="order" items="${orderList}" varStatus="status">
		                <tr>
		                   <td>${order.order_id}</td>
		                   <td>${order.order_date}</td>
		                   <c:forEach var="details" items="${order.orderDetails}" varStatus="status">
		                     <c:if test="${status.first}">
		                       <c:forEach var="products" items="${details.products}" varStatus="vars">      
		                         <c:if test="${vars.last}">
		                           <c:set var="product_name" value="${products.name}"/>
		                           <c:set var="num" value="${vars.count - 1}"/>
		                           <td>
		                             <c:out value="${product_name}"></c:out>  
		                             <c:if test="${num > 0}">
		                                외 <c:out value="${num}"></c:out>개
		                             </c:if>		
		                           </td>
		                         </c:if>	            		
		                       </c:forEach>
		                     </c:if>
			            </c:forEach>           
            
				            <td>${order.amount}</td>
				            <td>${order.status}</td>
				             <td>
				 <a class="orderDetail" href="${pageContext.request.contextPath}/user/orderDetail/${order.order_id}">상세 내역보기</a>
			</td>                                         
         </tr>
      </c:forEach>

   </table>

	<!-- 여기서 << 1 2 3 4 5 >> 이거 만드는 거임 -->
	<c:if test="${pageMaker.pre}">
		<a href="${pageContext.request.contextPath}/user/orderhistory${pageMaker.makeQuery(pageMaker.startPage - 1) }">«</a>
	</c:if>

	<!-- 링크를 걸어준다 1-10페이지까지 페이지를 만들어주는것  -->
	<c:forEach var="idx" begin="${pageMaker.startPage }"
		end="${pageMaker.endPage }">
		<a href="${pageContext.request.contextPath}/user/orderhistory${pageMaker.makeQuery(idx)}">${idx}</a>
	</c:forEach>

	<c:if test="${pageMaker.next && pageMaker.endPage > 0}">
		<a href="${pageContext.request.contextPath}/user/orderhistory${pageMaker.makeQuery(pageMaker.endPage +1) }"> » </a>
	</c:if>
</body>
</html>