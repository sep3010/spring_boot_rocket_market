<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<html>
<head>
<title>회원 리스트</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<!-- 회원 정보를 볼 수 있는 페이지 -->

<script>
    let msg = '${msg}';
    if(msg === '비밀번호를 다시 확인해 주세요.') {
        alert("비밀번호를 다시 확인해 주세요.");
    }
    
</script>

</head>
<body>
	
	<h1>회원 정보 확인</h1>
	<p><a href="${pageContext.request.contextPath}/admin/adminHome">이전(관리자홈)</a></p>
	
	<form id="form" method="post">
		<input type="hidden" name="id" value="${memberInfo_view.id}">
			<table width="500" cellpadding="0" cellspacing="0" border="1">
		

				<tr>
					<td>유저 번호</td>
					<td>${memberInfo_view.id}</td>
				</tr>
	
				<tr>
					<td>유저 아이디</td>
					<td>${memberInfo_view.username}</td>
				</tr>
	
				<tr>
					<td>닉네임</td>
					<td><input type="text" name="nickname"
						value="${memberInfo_view.nickname}"></td>
				</tr>
	
				<tr>
					<td>이름</td>
					<td><input type="text" name="name"
						value="${memberInfo_view.name}"></td>
				</tr>
	
				<tr>
					<td>연락처</td>
					<td><input type="text" name="phone"
						value="${memberInfo_view.phone}"></td>
				</tr>
	
				<tr>
					<td>우편 번호</td>
					<td><input type="text" name="postcode"
						value="${memberInfo_view.postcode}"></td>
				</tr>
	
				<tr>
					<td>주소</td>
					<td><input type="text" name="address"
						value="${memberInfo_view.address}"></td>
	
				</tr>
	
				<tr>
					<td>생일</td>
					<td><input type="date" name="birth"
						value="${memberInfo_view.birth}"></td>
				</tr>
	
				<tr>
					<td>이메일 주소</td>
					<td><input type="email" name="email"
						value="${memberInfo_view.email}"></td>
				</tr>
	
				<tr>
					<td>적립금</td>
					<td><input type="text" name="point"
						value="${memberInfo_view.point}"></td>
				</tr>
	
				<tr>
					<td>등급</td>
					<td><label><input type="radio" name="grade" value="일반"
							checked>일반</label> <label><input type="radio" name="grade"
							value="로얄">로얄</label> <label><input type="radio"
							name="grade" value="VIP">VIP</label></td>
				</tr>
		</table>

		

		</form>
		
		<div>
			<input type="button" id="btn-update" class="btn btn-primary" value="회원정보수정">
			<a href="delete?id=${memberInfo_view.id}">삭제</a>
			<a href="${pageContext.request.contextPath}/admin/memberList">목록</a>
					
		</div>

		<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
		
		<script type="text/javascript">
        $("#btn-update").on("click", function(){
            let form = $("#form")[0];
            form.action = "/admin/modify_admin";
            form.submit();
        });
		</script>



</body>
</html>