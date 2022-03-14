<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
<!-- jQuery -->
<script type="text/javascript" src="https://code.jquery.com/jquery-1.12.4.min.js" ></script>
<!-- iamport.payment.js -->
<script type="text/javascript" src="https://cdn.iamport.kr/js/iamport.payment-1.1.8.js"></script>


    <script type="text/javascript">

        //버튼 클릭하면 실행
        function payment(data) {
            //IMP.init('가맹점 식별코드');//아임포트 관리자 콘솔에서 확인한 '가맹점 식별코드' 입력
            IMP.init('imp90434583');// sjsong 개인 가맹점 식별 코드//www.import.kr -> 회원가입 -> 관리자 콘솔 로그인 -> 시스템설정-> 내정보
            IMP.request_pay({// param
                pg: "inicis", //pg사명 or pg사명.CID (잘못 입력할 경우, 기본 PG사가 띄워짐)
                pay_method: "card", //지불 방법
                merchant_uid: "merchant_' + new Date().getTime()", //가맹점 주문번호 (아임포트를 사용하는 가맹점에서 중복되지 않은 임의의 문자열을 입력)
                name: "두부", //결제창에 노출될 상품명
                amount: 10, //금액
                buyer_email : "${memberVO.email}",
                buyer_name : "${memberVO.name}",
                buyer_tel : "${memberVO.phone}",
            }, function (rsp) { // callback
                if (rsp.success) {
                    alert("결제가 완료되었습니다.");
                    // "완료 -> imp_uid : "+rsp.imp_uid+" / merchant_uid(orderKey) : " +rsp.merchant_uid
                    msg += '고유ID : ' + rsp.imp_uid;
                    msg += '상점 거래ID : ' + rsp.merchant_uid;
                    msg += '결제 금액 : ' + rsp.paid_amount;
                    msg += '카드 승인번호 : ' + rsp.apply_num;

                } else {
                    alert("실패 : 코드("+rsp.error_code+") / 메세지(" + rsp.error_msg + ")");
                }
            });
        }
      
      //문서가 준비되면 제일 먼저 실행
      $(document).ready(function(){
         $("#iamportPayment").click(function(){
            payment();//버튼 클릭하면 호출
         });
      });
    </script>

</head>
<body>
    
    <h1>주문결제 결제 페이지</h1>
    <span>01 장바구니 > </span>
    <span style="font-weight: bold; color : red;">02 주문 | 결제 > </span>
    <span>03 주문 완료</span>
    <div>
    	<div>배송정보(회원정보)</div>
    	<div>수령인: </div>
    	<div>휴대폰: </div> 
    </div>
    <div>
          <button style="font-size:40px" id="iamportPayment" type="button">결제테스트</button>
        
    </div>

</body>
</html>