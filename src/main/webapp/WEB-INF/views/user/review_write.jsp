<!-- <%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags"%> -->
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

    <title>ROCKET MARKET :: 신속배송 후기작성</title>
    <script src="https://code.jquery.com/jquery-1.12.4.min.js"></script>
    <link rel="shortcut icon" type="image/x-icon" href="${pageContext.request.contextPath}/imgs/logo.png" />
	<style type="text/css">
		textarea {
			resize: none;
		}
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
		$("#title").focus();
		
		
		$("#submit").on('click', function(event){
			alert("후기가 등록되었습니다.");
			//opener.parent.location.reload();
			//window.close();  
		 	

			
		}); // end $("#submit").on('click')
		
		
				
	}); // end ready()
	
	
</script>

</head>
<body>
	
	<!-- 파일 등록을 위해 enctype="multipart/form-data" 설정-->
	<form:form id="writeReview" 
		action="${pageContext.request.contextPath}/user/insertReview" 
			enctype="multipart/form-data" method="post">
		<input type="hidden" name="order_id" value="${orderDetail.order_id}">
		<input type="hidden" name="order_detail_id" value="${orderDetail.order_detail_id}">
		<input type="hidden" name="user_id" value="<sec:authentication property="principal.memberVO.id"/>">		
		<div class="container pt-5">
         
            <table class="table"style="position: relative;">
              <p style="font-size: 30px; font-weight: bold;">후기 작성</p>
              <tr class="border-bottom">
              </tr>
              <tr>
                <td class="text-center">주문번호</td>
                <td>${orderDetail.order_id}</td>
              </tr>
              <tr>
                <td class="text-center"><img src="${image.path}"></td>
                <td>[${product.brand}] ${product.name}</td>
              </tr>
              <tr>
                <td class="text-center">별점</td>
                <td>
                  <select id="score" name="score">
                    <option value="0">☆☆☆☆☆</option>
                    <option value="1">★☆☆☆☆</option>
                    <option value="2">★★☆☆☆</option>
                    <option value="3">★★★☆☆</option>
                    <option value="4">★★★★☆</option>
                    <option value="5">★★★★★</option>
                  </select>
                </td>
              </tr>
              <tr>
                <td class="text-center">제목</td>
                <td><input type="text" id="title" name="title" style="width: 843px;"></td>
              </tr>
              <tr>
                <td class="text-center">내용</td>
                <td>
                  <textarea name="content" rows="28" cols="100" 
                    placeholder="일반 리뷰 작성시 포인트 300p, 사진 리뷰 작성시 1000p가 지급됩니다.&#13;&#10;다만 상품과 관련없는 사진이나 내용을 올린 것이 확인되면 이후 별도의 공지없이 포인트가 회수될 수 있습니다."></textarea>
                </td>
              </tr>
              <tr>
                <td class="text-center">사진 첨부</td>
                <td id="image">
                  <input type="file" id="reviewImages" name="reviewImages" accept="image/*" multiple>
                </td>
              </tr>
            </table>
            <input class="btn btn-outline-dark mt-4 mb-5" type="submit"  id="submit" value="후기 등록">
          </div>

		<!-- <button id="submit">후기 등록</button> -->
	</form:form>
</body>
</html>