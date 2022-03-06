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
<script type="text/javascript">

	$(document).ready(function(){
		
		$(".updateStock").submit(function(event){
			event.preventDefault();
			
			var stock = $(this).find(".stock").val();
			var id = $(this).find(".id").val();
			var name = $(this).find(".name").val();
			
			console.log("< " + name + " > 상품의 재고량 " + stock + "으로 수정");
			
			var form = {
				id:id,
				name:name,
				stock:stock
			};	
			//console.log(JSON.stringify(form));디버깅
			
			$.ajax({
				
				type : "POST",
				url : $(this).attr("action"),
				cache : false,
				contentType:"application/json; charset='UTF-8'",
				data : JSON.stringify(form),
				success : function (data) {
					alert("수정완료");
				},
				error : function(e) {
					console.log(e);
				}	
			}); //end ajax			
		});//end submit()						
	}); //end ready()
	
</script>

</head>
<body>
	<h1>상품목록</h1>
	<p><a href="${pageContext.request.contextPath}/admin/adminHome">이전(관리자홈)</a></p>
	<table width="950" cellpadding="0" cellspacing="0" border="1">
	<tr>
		<td>상품번호</td>
		<td>상품명</td>
		<td>할인율</td>
		<td>가격</td>
		<td>상품종류</td>	
		<td>배송타입</td>	
		<td>재고량</td>
		<td>판매상태(1=활성화,0=비활성화)</td>
	</tr>			
	<c:forEach var="product" items="${productList}">
		<tr>
			<td>${product.id}</td>
			<td>&nbsp;[ ${product.brand} ] 
			<a href="product_view?id=${product.id}">${product.name}</a></td>
			<td>${product.discount} %</td>
			<td><fmt:formatNumber value="${product.price}" pattern="#,###" /></td>
			<td>${product.type}</td>	
			<td>${product.delivery_type}</td>
			<td>
				<form:form class="updateStock" action="${pageContext.request.contextPath}/admin/productManagement/stock">
				  <input type="hidden" class="id" name="id" value="${product.id}">
				  <input type="hidden" class="name" name="name" value="${product.name}">
				  <input type="number" class="stock" name="stock" value="${product.stock}">
				  <input type="submit" value="재고량수정">
				</form:form>
			</td>
			<td>${product.enabled}</td>
		</tr>	

	</c:forEach>
	</table>
	
	<p><a href="${pageContext.request.contextPath}/admin/addProduct">상품등록</a></p>

	<c:if test="${pageMaker.pre}">
		<a href="${pageContext.request.contextPath}/admin/productManagement${pageMaker.makeQuery(pageMaker.startPage - 1) }">
		«</a>
	</c:if>

	<c:forEach var="idx" begin="${pageMaker.startPage }"
		end="${pageMaker.endPage }">
		<a href="${pageContext.request.contextPath}/admin/productManagement${pageMaker.makeQuery(idx)}">${idx}</a>
	</c:forEach>

	<c:if test="${pageMaker.next && pageMaker.endPage > 0}">
		<a href="${pageContext.request.contextPath}/admin/productManagement${pageMaker.makeQuery(pageMaker.endPage +1) }">
		»</a>
	</c:if>	
	
	<!-- 이미지 경로 처리가 잘 됐는지 확인하기 위한 코드 (수정 예정)-->
	<c:forEach var="image" items="${mainImages}">
		<img src="${image.path}${image.name}">
	</c:forEach>	
	

</body>
</html>