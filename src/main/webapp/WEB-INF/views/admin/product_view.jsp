<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>

<!-- csrf meta tag -->
<meta name="_csrf" content="${_csrf.token}"/>
<meta name="_csrf_header" content="${_csrf.headerName}"/>

<script type="text/javascript">
	//csrf
	var token = $("meta[name='_csrf']").attr("content");
	var header = $("meta[name='_csrf_header']").attr("content");
	
	//Ajax spring security header..
	$(document).ajaxSend(function(e, xhr, options){
		xhr.setRequestHeader(header, token);
	});
	
	// input type=hidden 태그를 만들어주는 함수
	function makeInputHidden(name, value){
		
		let inputTag = '<input type=hidden name=' + name + ' value=' + value + '>';
		
		return inputTag;
	}

	$(document).ready(function(){
		// 페이지 접속시 상품명 입력칸에 커서를 위치시킨다.
		$("#name").focus();
		
		$("#submit").on('click', function(){
			
			// DB에 들어갈 capacity(용량)과 unit(판매단위)를 
			// 하나의 문자로 만들어 주기위한 작업		
			let capacity;
			if($("#capacity_part3").val() == 0){
				capacity = $("#capacity_part1").val() + $("#capacity_part2").val();
			}
			else{
				capacity = $("#capacity_part1").val() + $("#capacity_part2").val() 
							+ " x " + $("#capacity_part3").val() + "개입";  
			}
			
						
			let unit;
			if($("#unit_part2").val() == '기타'){
				unit = $("#unit_part1").val()
			}
			else{
				unit = $("#unit_part1").val() + $("#unit_part2").val();
			}
						
			// 하나의 문자로 만들어준 값으로 바꿔 넣어준 뒤 전달
			//$("#capacity").empty();
			let finalCapacity = makeInputHidden('capacity', capacity);		
			$("#capacity").prepend(finalCapacity);
			
			//$("#unit").empty();
			let finalUnit = makeInputHidden('unit', unit);		
			$("#unit").prepend(finalUnit);
			
			// 처리 완료 후 action 주소로 전달
			document.$(".addProduct").submit();


				
		}); //end submit()	
		
	}); //end ready()
	
</script>

</head>
<!-- 소은 -->
<body>
	<h1>상품상세</h1>
	<!-- 파일 등록을 위해 enctype="multipart/form-data" 설정-->
	<form:form class="modifyProduct" 
		action="${pageContext.request.contextPath}/admin/modifyProduct" 
			enctype="multipart/form-data" method="post">
		<table width="750" cellpadding="0" cellspacing="0" border="1">
			<tr>
				<td>상품번호</td>
				<td>${product.id}</td>
				<td>상품명</td>
				<td>${product.name}</td>
			</tr>
			<tr>
				<td>브랜드</td>
				<td>${product.brand}</td>
				<td>상품종류</td>
				<td>${product.type}</td>
			</tr>
			<tr>
				<td>용량</td>
				<td>${product.capacity}</td>
				<td>판매단위</td>
				<td>${product.unit}</td>
			</tr>
			<tr>
				<td>가격</td>
				<td>${product.price}</td>
				<td>할인율</td>
				<td>${product.discount}</td>
			</tr>
			<tr>
				<td>포장타입</td>
				<td>${product.price}</td>
				<td>배송타입</td>
				<td>${product.discount}</td>
			</tr>
			<tr>
				<td>재고량</td>
				<td>${product.stock}</td>
				<td>판매상태</td>
				<c:choose>
				<c:when test="${product.enabled == 1}">
					<td>판매중</td>
				</c:when>
				<c:otherwise>
					<td>판매종료</td>
				</c:otherwise>
			</c:choose>
			</tr>
			<c:forEach var="image" items="${product.productImages}">
				<c:if test="${image.information_type == 'main'}">
					<tr>
						<td colspan="4">메인/썸네일 이미지</td>
					</tr>
					<tr>	
						<td colspan="4"><img src="${image.path}"></td>
					</tr>
				</c:if>
				<c:if test="${image.information_type == 'info'}">
					<tr>
						<td colspan="4">상품정보 이미지</td>
					</tr>	
					<tr>	
						<td colspan="4"><img src="${image.path}"></td>
					</tr>
				</c:if>
				<c:if test="${image.information_type == 'detail'}">
					<tr>
						<td colspan="4">상품상세 이미지</td>
					</tr>
					<tr>	
						<td colspan="4"><img src="${image.path}"></td>
					</tr>
				</c:if>

			</c:forEach>
			
			
		</table>	
		<button id="modify">수정하기</button>
	</form:form>
	
</body>
</html>