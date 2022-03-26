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

<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>

<script type="text/javascript">

//csrf
var token = $("meta[name='_csrf']").attr("content");
var header = $("meta[name='_csrf_header']").attr("content");

//Ajax spring security header..
$(document).ajaxSend(function(e, xhr, options){
	xhr.setRequestHeader(header, token);
});

 	$(document).ready(function(){
		$("#updateSubmit").click(function(event){
			event.preventDefault();
			
			const id = <sec:authentication property="principal.memberVO.id"/>;
			let username = $("#username").val();
			let nickname = $("#nickname").val();
			let name = $("#name").val();
			let phone = $("#phone").val();
			let postcode = $("#postcode").val();
			let address = $("#address").val();
			let birth = $("#birth").val();
			let email = $("#email").val();
					
			
			let param = {
					id: id,
					username:username,
					nickname: nickname,
					name: name,
					phone: phone,
					postcode: postcode,
					address: address,
					birth: birth,
					email: email
			};
			
			// 유효성 검사
			if(form.name.value.trim()=="" || form.nickname.value.trim()=="" || form.phone.value.trim()=="" || form.postcode.value.trim()=="" || form.address.value.trim()=="" || form.birth.value.trim()=="" || form.email.value.trim()==""){
				alert("입력값에 공백이 있으면 안 됩니다. 필수 입력칸을 입력해 주세요.");
				return false;
			}

			console.log(JSON.stringify(param));
			
		       $.ajax({
		            type:'POST',
		            data: JSON.stringify(param),
		            cache : false,
		            url:"/modify",
		            contentType: "application/json; charset='UTF-8'",
		            success : function(data) {  
		            	if(data == "SUCCESS"){
		            		alert("수정되었습니다");
		            		}
		            },
		            error: function(jqXHR, textStatus, errorThrown) {
		                alert("ERROR : " + textStatus + " : " + errorThrown);
		            }
			}); //end ajax
		}); //end click()
	}); // end ready()
	
</script>	

<script>

	
</script>
</head>


<body>    
	<!-- 메인으로 가는 버튼 -->
	<h1><a href="${pageContext.request.contextPath}/">Main Home</a></h1>
	<h1>회원 정보 확인</h1>
	
	<c:url value="/modify" var="modifyUrl"/>
	
	<form:form name="/modifyForm" action="${modifyUrl}" method="POST" id="form">
		<input type="hidden" id="username" name="username" value="<sec:authentication property="principal.memberVO.username"/>">
		
			<table width="500 cellpadding=" 0" cellspacing="0" border="1">
				
				<tr>
					<td><label for="username">아이디</label></td>
					<td><label><sec:authentication property="principal.memberVO.username"/></label></td>
				</tr>
			 
				<tr>
					<td><label for="name">이름</label></td>
					<td> <input type="text" id="name" name="name" value=<sec:authentication property="principal.memberVO.name"/>></td>
				</tr>
			        
				<tr>
					<td><label for="nickname">닉네임</label></td>
					<td> <input type="text" id="nickname" name="nickname" value=<sec:authentication property="principal.memberVO.nickname"/>></td>
				</tr>
	
				<tr>
					<td><label for="phone">연락처</label></td>
					<td> <input type="text" id="phone" name="phone" value=<sec:authentication property="principal.memberVO.phone"/>></td>
				</tr>
	
				<tr>
					<td><label for="postcode">우편번호</label></td>
					<td> <input type="text" id="postcode" name="postcode" value=<sec:authentication property="principal.memberVO.postcode"/>></td>
				</tr>
	
				<tr>
					<td><label for="address">주소</label></td>
					<td> <input type="text" id="address" name="address" value=<sec:authentication property="principal.memberVO.address"/>></td>
				</tr>

				<tr>
					<td><label for="birth">생일</label></td>
					<td> <input type="date" id="birth" name="birth" value=<sec:authentication property="principal.memberVO.birth"/>></td>
				</tr>	
				
				<tr>
					<td><label for="email">이메일</label></td>
					<td> <input type="text" id="email" name="email" value=<sec:authentication property="principal.memberVO.email"/>></td>
				</tr>

				
								
			</table>
				<br>
				<button type="submit" id="updateSubmit" class="btn" onclick="check_onclick()">회원정보 수정</button>
			</form:form>

	</body>
</html>
