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

<title>후기 작성</title>

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
		<table width="850" cellpadding="0" cellspacing="0" border="1">
			<tr>
				<c:forEach var="image" items="${product.productImages}" begin="0" end="0">
					<td><img src="${image.path}"></td>
					<td>[${product.brand}] ${product.name}</td>
				</c:forEach>	
			</tr>
			<tr>
				<td>제목</td>
				<td>${review.title}</td>
				<td>별점</td>
				<td>${starPoint}</td>
			</tr>
			<tr>
				<td>작성일</td>
				<td>${review.board_date}</td>
				<td>조회수</td>
				<td>${review.hit}</td>
			</tr>
			<tr>
				<td>내용</td>
				<td>${review.content}</td>
			</tr>
			<tr>
				<td>후기 사진</td>
				<td id="image">
					<c:forEach var="photo" items="${review.boardFiles}">
						<img src="${photo.path}">
					</c:forEach>
				</td>
			</tr>
		</table>

</body>
</html>