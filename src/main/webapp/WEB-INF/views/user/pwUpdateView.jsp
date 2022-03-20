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


	
</script>	

<script>
$(document).ready(function(){

	$("#pwUpdate").on("click", function(){
		$.ajax({
			url : "/pwCheck",
			type : "post",
			dataType : "json",
			data : $("#pwUpdateForm").serializeArray(),
			success: function(data){
				
				if(data==0){
					alert("패스워드가 틀렸습니다.");
					return;
					}
				}
			}) // ajax 끝
		}); // onclick 끝
	}) // ready 끝
		
</script>
</head>


<body>    
	<!-- 메인으로 가는 버튼 -->
	<h1><a href="${pageContext.request.contextPath}/">Main Home</a></h1>
	<h1>비밀번호 체크</h1>

  <form action="/pwCheck" method="post" id="pwCheck" name="pwCheck">
                       <input type="hidden" id="username" name="username" value = "<sec:authentication property="principal.memberVO.username"/>">
    <div class="col-sm-8 col-sm-offset-2">
        <div class="panel panel-default panel-margin-10">
            <div class="panel-body panel-body-content text-center">
                <p class="lead">현재 비밀번호를 입력해 주세요.</p>

                <div class="form-group">
                    <input type="text" name="member_id" class="form-control form-control-inline text-center" value = "<sec:authentication property="principal.memberVO.username"/>" readonly="readonly"/>
                </div>
                <div class="form-group">
                    <input type="password" name="memberPw" id="memberPw" class="form-control form-control-inline text-center" placeholder="현재 비밀번호" />
                </div>                

                <button type="button" id="pwUpdate" name="pwUpdate" class="btn btn-primary">입력</button>
				<a href="/user/userHome" class="btn btn-default">취소</a>
            </div>
        </div>
    </div>
    </form>


	</body>
</html>
