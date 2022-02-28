<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>



<!DOCTYPE html>
<html lang="ko">
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>

<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css" integrity="sha384-MCw98/SFnGE8fJT3GXwEOngsV7Zt27NXFoaoApmYm81iuXoPkFOJwJ8ERdknLPMO" crossorigin="anonymous">
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.3/umd/popper.min.js" integrity="sha384-ZMP7rVo3mIykV+2+9J3UJ46jBk0WLaUAdn689aCwoqbBJiSnjAK/l8WvCWPIPm49" crossorigin="anonymous"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/js/bootstrap.min.js" integrity="sha384-ChfqqxuZUCnJSK3+MXmPNIyE6ZbWh2IMqE241rYiqJxyMiZ6OW/JmZQ5stwEULTy" crossorigin="anonymous"></script>
<link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.15.4/css/all.css" integrity="sha384-DyZ88mC6Up2uqS4h/KRgHuoeGwBcD4Ng9SiP4dIRy0EXTlnuz47vAwmeGwVChigm" crossorigin="anonymous">

<!-- csrf meta tag -->
<meta name="_csrf" content="${_csrf.token}"/>
<meta name="_csrf_header" content="${_csrf.headerName}"/>


<title>마이페이지</title>
<!-- 마이페이지 조회 -->
	
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
	<!-- 메인으로 가는 버튼 -->
	<h1><a href="${pageContext.request.contextPath}/">Main Home</a></h1>
	<h1>회원 정보 확인</h1>
	
	<form action="<c:url value='/user/modify'/>" method="get">
		<input type="hidden" name="id" value=<sec:authentication property="principal.memberVO.id"/>>
						
			<table width="500 cellpadding=" 0" cellspacing="0" border="1">

				<tr>
					<td>아이디</td>
					<td><sec:authentication property="principal.memberVO.username"/></td>
				</tr>
	
				<tr>
					<td>닉네임</td>
					<td><input type="text" name="name"
						value=<sec:authentication property="principal.memberVO.username"/>></td>
				</tr>
	
				<tr>
					<td>이름</td>
					<td><input type="text" name="name"
						value=<sec:authentication property="principal.memberVO.name"/>></td>
				</tr>
	
				<tr>
					<td>연락처</td>
					<td><input type="text" name="phone"
						value=<sec:authentication property="principal.memberVO.phone"/>></td>
				</tr>
	
				<tr>
					<td>우편 번호</td>
					<td><input type="text" name="postcode"
						value=<sec:authentication property="principal.memberVO.postcode"/>></td>
				</tr>
	
				<tr>
					<td>주소</td>
					<td><input type="text" name="address"
						value=<sec:authentication property="principal.memberVO.address"/>></td>
	
				</tr>
	
				<tr>
					<td>생일</td>
					<td><input type="date" name="birth"
						value=<sec:authentication property="principal.memberVO.birth"/>></td>
				</tr>
	
				<tr>
					<td>이메일 주소</td>
					<td><input type="email" name="email"
						value=<sec:authentication property="principal.memberVO.email"/>></td>
				</tr>


			</table>

			<div>
				<br>
				<input type="submit" id="btn-update" class="btn btn-primary" value="회원정보 수정">
				<a href="delete?id=${memberInfo_view.id}">회원 탈퇴</a>
				<a href="${pageContext.request.contextPath}/admin/memberList">목록</a>
						
			</div>

			</form>

	</body>
</html>
