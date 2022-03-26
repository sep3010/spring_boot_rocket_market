<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<!DOCTYPE html>
<html lang="kr">
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
    
<!-- jQuery -->
<script type="text/javascript" src="https://code.jquery.com/jquery-1.12.4.min.js" ></script>
<!-- iamport.payment.js -->
<script type="text/javascript" src="https://cdn.iamport.kr/js/iamport.payment-1.1.8.js"></script>

<!-- csrf meta tag -->
<meta name="_csrf" content="${_csrf.token}"/>
<meta name="_csrf_header" content="${_csrf.headerName}"/>




</head>
      <div class="text-center pt-5 pb-5">

        <h2 class="pb-3" style="font-weight: bold;">주문 완료</h2>
        
        <img src="${pageContext.request.contextPath}/resources/order-image/box.png" style="width: 15rem;">
      
        <p class="pt-3" ><h5 style="font-weight: bold;"><sec:authentication property="principal.memberVO.name"/>님의 주문이 완료되었습니다!</h5></p>
        <p><h5 class="pb-3" style="font-weight: bold;">로켓타고 달려갈게요 🚀 </h5></p>

        
        <table class="table" style="width: 30rem; margin: 0px; display: inline; border: 0px;">
        <tr>
          <td class="text-left" style="font-weight: bold;">🤎　구매내역</td>
          <td class="text-left" ><%= session.getAttribute("product_name") %></td>
        </tr>

         <tr>
          <td class="text-left" style="font-weight: bold;">🤎　사용 적립금</td>
          <td class="text-left"><%= session.getAttribute("input_point") %> 원</td>
         </tr>

         <tr>
          <td class="text-left" style="font-weight: bold;">🤎　주문 번호</td>
          <td class="text-left"><%= session.getAttribute("merchantid") %></td>
        </tr>

        <tr>
          <td class="text-left" style="font-weight: bold;">🤎　운송장 번호</td>
          <td class="text-left"><%= session.getAttribute("delivery_number") %></td>
        </tr>

        <tr style="font-size: 1.2rem; font-weight: bold; color: rgb(139, 96, 43);">
          <td class="text-left" style="font-weight: bold;">🤎　총 결제 금액</td>
          <td class="text-left"><%= session.getAttribute("amount") %> 원</td>
        </tr>

        </table>


          <div class="pt-3"> <!-- 버튼 -->
            <a class="btn btn-outline-dark" href="${pageContext.request.contextPath}/">홈으로 가기</a>
            <a class="btn btn-outline-dark" href="${pageContext.request.contextPath}/user/orderhistory">주문 내역 확인하기</a>
          </div>
          
          
      </div> <!-- div class="text-center pt-5 pb-5" -->
     
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