<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>

<!DOCTYPE html>
<html lang="kr">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>주문결제 페이지</title>
    
<!-- jQuery -->
<script type="text/javascript" src="https://code.jquery.com/jquery-1.12.4.min.js" ></script>
<!-- iamport.payment.js -->
<script type="text/javascript" src="https://cdn.iamport.kr/js/iamport.payment-1.1.8.js"></script>

<!-- csrf meta tag -->
<meta name="_csrf" content="${_csrf.token}"/>
<meta name="_csrf_header" content="${_csrf.headerName}"/>


    <script type="text/javascript">

  //csrf
    var token = $("meta[name='_csrf']").attr("content");
    var header = $("meta[name='_csrf_header']").attr("content");
    
    function drivePayment(seller_num, set_price) {
        var seq = getMerchantSeq();
        
        var today = new Date();
        var yyyy = today.getFullYear();
        var mm = today.getMonth()+1;
        var dd = today.getDate();
        if(dd<10) {
            dd='0'+dd;
        } 

        if(mm<10) {
            mm='0'+mm;
        } 
        
        <sec:authorize access="isAnonymous()">
           location.href = "/into/loginForm";
        </sec:authorize>   
     
        <sec:authorize access="isAuthenticated()">
           <sec:authentication var="principal" property="principal"/>
           
           let member_name = "${principal.memberVO.name}";
           let email = "${principal.memberVO.email}";
           let phone = "${principal.memberVO.phone}";
           // 사용자 정보
           
           
           let merchantid = 'merchant_' + new Date().getTime();
           
           var token = $("meta[name='_csrf']").attr("content");
           var header = $("meta[name='_csrf_header']").attr("content");
           
           IMP.init("imp90434583");
           IMP.request_pay({ 
               pg: "html5_inicis",
               pay_method: "card",
               merchant_uid: merchantid,
               name: product_name,
               amount: amount,
               buyer_email: email,
               buyer_name: member_name,
               buyer_tel: phone
               
           }, function(rsp) {   
                  if(rsp.success) {
                   
                      $.ajax({
                         url: "order/completePayment",
                         type: 'POST',
                         dataType: 'json',
                         data: {
                            merchant_uid: merchantid
                         },
                         beforeSend: function(xhr){
                            xhr.setRequestHeader(header, token);
                         }
                      }).done(function(result){
                         if(result.successPayment) {
                            location.href = "/into/paymentComplete?merchant_uid="+merchantid; //결제완료페이지
                         }else {
                            if(result.hasSetPrice) {
                               alerting("결제하신 금액과 판매자가 설정한 금액이 다릅니다.");
                               var reason = "price not equals";
                            }else {
                               alerting("판매자가 구독을 비활성화 했습니다.");
                               var reason = "price null";
                            }
                            
                            (function() {
                               $.ajax({
                                  url: "order/orderPayment", // 이 주소의 컨트롤러로 데이터를 주는 것.
                                  type: 'POST',
                                  dataType: 'json',
                                  data: {
                                     merchant_uid: merchantid
                                  },
                                  beforeSend: function(xhr){
                                     xhr.setRequestHeader(header, token);
                                  }
                               }).done(function(result2){
                                  if(result2.code==0) {
                                     alerting("자동으로 결제가 취소되었습니다.");
                                  }else {
                                     alerting("결제가 취소되지 않았습니다. 관리자에게 문의해주세요.")
                                  }
                               });
                            })();
                         }
                      });
                   
                  }else {
                      alerting("결제에 실패하셨습니다.");
                   }
                }
           );
        </sec:authorize>
        
     }
    
	    //문서가 준비되면 제일먼저 실행
	    $(document).ready(function(){
	       $("#iamportPayment").click(function(){
	          payment();//버튼 클릭하면 호출
	       });
	    });

    </script>

</head>
<body>
    
    <h1>주문결제 페이지</h1>
    <span>01 장바구니 > </span>
    <span style="font-weight: bold; color : red;">02 주문 | 결제 > </span>
    <span>03 주문 완료</span>

	<h1>배송 정보(회원 정보)</h1>
	
      <c:forEach items="${orderpaymentList}" var="orderpayment">
		<div>수령인: ${orderpayment.member_name}</div>
		<div>휴대폰: ${orderpayment.phone}</div>
		<div>우편번호: ${orderpayment.postcode}</div>
		<div>배송지: ${orderpayment.address}</div>
		<div>배송 메시지: ${orderpayment.message}</div>
		<hr>
      </c:forEach>	
      
      <h1>주문 상품</h1>
      
	<table width="1300" cellpadding="0" cellspacing="0" border="1">
	  <tr>
         <td>번호</td>
         <td>썸네일</td>
         <td>상품 정보</td>
         <td>개수</td>
         <td>가격</td>
      </tr>
      
      <c:forEach items="${orderpaymentList}" var="orderPaymentOne">
	      <tr>
	         <td>1</td>
	         
				<c:choose>
					<c:when test="${not empty orderPaymentOne.productImages}">
						<c:forEach var="thumbnail" items="${orderPaymentOne.productImages}">
							<td><img src="${thumbnail.path}"></td>
						</c:forEach>
					</c:when>
					<c:otherwise>
						<td>대표 이미지 없음</td>
					</c:otherwise>
				</c:choose> 
			
	         <td>[ ${orderPaymentOne.brand} ] ${orderPaymentOne.product_name}</td>
	         <td>1</td>
	         <td>${orderPaymentOne.price}</td>
		  </tr>
      </c:forEach>
	</table>
	
	<hr>
	<h1>쿠폰 | 적립금</h1>
	
	      <c:forEach items="${couponList}" var="couponList">
	      <tr>
	         <td>쿠폰</td>
		  </tr>
		  	      
	      <tr>
	         <td>${couponList.coupon_name}</td>
		  </tr>
      </c:forEach>
      
	<div>쿠폰 : </div>
	<div>적립금 : </div> 
	
    <div>
    <br>
          <button style="font-size:40px" id="iamportPayment" type="button">결제테스트</button>
        
    </div>

</body>
</html>