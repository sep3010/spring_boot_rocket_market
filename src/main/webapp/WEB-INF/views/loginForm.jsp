<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
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


    <title>로그인 페이지</title>
    
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
	<h3>아이디와 비밀번호를 입력해주세요.</h3>
	
	<c:url value="/login" var="loginUrl" />
	
	<form:form name="f" action="${loginUrl}" method="POST">
	    <c:if test="${param.error != null}">
	        <p>아이디와 비밀번호가 잘못되었습니다.</p>
	    </c:if>
	    <c:if test="${param.logout != null}">
	        <p>로그아웃 하였습니다.</p>
	    </c:if>
	    <p>
	        <label for="username">아이디</label>
	        <input type="text" id="username" name="username" />
	    </p>
	    <p>
	        <label for="password">비밀번호</label>
	        <input type="password" id="password" name="password"/>
	    </p>
	    <%-- <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" /> --%>
	    <button type="submit" class="btn">로그인</button>
	    <a href="${pageContext.request.contextPath}/addMemberForm">회원가입</a>
	   
	</form:form>

</body>
</html>
