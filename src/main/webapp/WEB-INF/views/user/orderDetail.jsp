<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>

<!-- fontawesome -->
<script src="https://kit.fontawesome.com/b7ee8a4337.js" crossorigin="anonymous"></script>

<!-- csrf meta tag -->
<meta name="_csrf" content="${_csrf.token}"/>
<meta name="_csrf_header" content="${_csrf.headerName}"/>

<title>주문 상세 내역</title>

<script type="text/javascript">
	//csrf
	var token = $("meta[name='_csrf']").attr("content");
	var header = $("meta[name='_csrf_header']").attr("content");
	
	//Ajax spring security header..
	$(document).ajaxSend(function(e, xhr, options){
		xhr.setRequestHeader(header, token);
	});
	
	
	$(document).ready(function(){
		
		
		
				
	}); // end ready()
	
	
</script>

</head>
<body>
	<h2>주문 상세</h2>
		<table width="870" cellpadding="0" cellspacing="0" border="1">
			<tr>
				<td>주문번호</td>
				<td></td>
			</tr>
			<tr>
				<td></td>
				<td>상품명</td>
				<td></td>
			</tr>
			<tr>
				<td>별점</td>
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
				<td>제목</td>
				<td><input type="text" id="title" name="title"></td>
			</tr>
			<tr>
				<td>내용</td>
				<td>
					<textarea rows="30" cols="110" 
					placeholder="일반 리뷰 작성시 포인트 300p, 사진 리뷰 작성시 1000p가 지급됩니다.&#13;&#10;다만 상품과 관련없는 사진이나 내용을 올린 것이 확인되면 이후 별도의 공지없이 포인트가 회수될 수 있습니다."></textarea>
				</td>
			</tr>
			<tr>
				<td>사진 첨부</td>
				<td id="image">
					<input type="file" id="reviewImages" name="reviewImages" accept="image/*" multiple>
				</td>
			</tr>
		</table>
		
</body>
</html>