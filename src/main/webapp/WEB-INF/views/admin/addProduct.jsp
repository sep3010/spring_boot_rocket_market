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

<!-- fontawesome -->
<script src="https://kit.fontawesome.com/b7ee8a4337.js" crossorigin="anonymous"></script>

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
	
	function imageDelete(){
			

		$("#mainImage").empty();		
		$("#mainImage").prepend("<input type=file id=main name=main accept=image/* required>");
 

		$("#infoImage").empty();		
		$("#infoImage").prepend("<input type=file id=info name=info accept=image/* required>");
	
	
		$("#detailImage").empty();		
		$("#detailImage").prepend("<input type=file id=detail name=detail accept=image/* required>");
					
			
	}
	
	// 수정 페이지 경로로 접근시 input 태그에 value를 넣어주기 위한 설정
	function makeInputValue(){
		
		// 변수 설정
		let id = '${product.id}';
		let name = '${product.name}';
		let price = '${product.price}';
		let capacity = '${product.capacity}';
		let brand = '${product.brand}';
		let stock = '${product.stock}';
		let unit = '${product.unit}';
		let type = '${product.type}';
		let packaging = '${product.packaging}';
		let discount = '${product.discount}';
		let delivery_type = '${product.delivery_type}';
		let enabled	= '${product.enabled}';
		let main;
		let info;
		let detail;
		<c:forEach var="image" items="${product.productImages}">
			<c:if test="${image.information_type == 'main'}">
				main = '${image.path}';
			</c:if>
			<c:if test="${image.information_type == 'info'}">
				info = '${image.path}';
			</c:if>
			<c:if test="${image.information_type == 'detail'}">
				detail = '${image.path}';
			</c:if>
		</c:forEach>
		
		// 동적으로 태그 만들어주기
		let inputId = '<tr><input type=hidden name=id value=' 
						+ id + '><td>상품번호</td><td>' + id + '</td></tr>';
		$("#table").prepend(inputId);
		
		// input 태그에 value 속성 값에 수정할 상품 정보 넣기
		 $("#name").attr("value", name);
		 $("#price").attr("value", price);
		 $("#brand").attr("value", brand);
		 $("#stock").attr("value", stock);
		 $("#discount").attr("value", discount);
		 
		 // capacity에서 숫자만 분리하기
		 let capacity_part1 = capacity.replace(/[^0-9]/g,'');
		 console.log("capacity_part1 : " + capacity_part1);
		 $("#capacity_part1").attr("value", capacity_part1);
		 
		// capacity에서 문자만 분리하기
		 let capacity_part2 = capacity.replace(/[0-9]/g,'');
		 console.log("capacity_part2 : " + capacity_part2);
		 $("#capacity_part2").val(capacity_part2).prop("selected", true);
		 
		 
		 
		// unit에서 숫자만 분리하기
		 let unit_part1 = unit.replace(/[^0-9]/g,'');
		 console.log("unit_part1 : " + unit_part1);
		 $("#unit_part1").attr("value", unit_part1);
		 
		// unit에서 문자만 분리하기
		 let unit_part2 = unit.replace(/[0-9]/g,'');
		 console.log("unit_part2 : " + unit_part2);
		 $("#unit_part2").val(unit_part2).prop("selected", true);
		
		 
		 // select 태그의 option값 선택하기
		 $("#type").val(type).prop("selected", true);
		 
		 // radio태그에서 값 선택하기
		 $("input:radio[name='packaging']").prop('checked', false);
		 $("input:radio[name='packaging']").val(packaging).prop('checked', true);
		 
		 
		 		 
		 $("input:radio[name='delivery_type']").prop('checked', false);
		 $("input:radio[name='delivery_type']").val(delivery_type).prop('checked', true);
		
		 
		 
		 $("#mainImage").empty();
		 $("#mainImage").prepend("<img src=" + main + ">");
		 $("#mainImage").append("<span onclick=imageDelete();><i class='fa fa-times fa-xl'></i></span>");
		 
		 $("#infoImage").empty();
		 $("#infoImage").prepend("<img src=" + info + ">");
		 $("#infoImage").append("<span onclick=imageDelete();><i class='fa fa-times fa-xl'></i></span>");
		 
		 $("#detailImage").empty();
		 $("#detailImage").prepend("<img src=" + detail + ">");
		 $("#detailImage").append("<span onclick=imageDelete();><i class='fa fa-times fa-xl'></i></span>");
		 

		return console.log("수정 페이지 로딩 완료");
		
	} // end makeInputValue();
	

	$(document).ready(function(){
		// 페이지 접속시 상품명 입력칸에 커서를 위치시킨다.
		$("#name").focus();
		
		// 수정 페이지로 접근시 input 태그에 value를 넣어주기 위한 설정
		if(${product != null}){
			
			let makeModifyPage = makeInputValue();
			
			// 상품 수정 경로로 바꾸기
			$(".addProduct").attr("action", "${pageContext.request.contextPath}/admin/modifyProduct");
			$("#submit").remove();
			$(".link").remove();
			
			$("h1").empty();
			$("h1").prepend("상품 수정");
			
			// 수정 버튼 만들어주기
			$("#table").after('<button id=modify>수정하기</button>');
			
		}
		
		// 상품 수정 버튼
		$("#modify").on('click', function(event){
			
			
			// DB에 들어갈 capacity(용량)과 unit(판매단위)를 
			// 하나의 문자로 만들어 주기위한 작업		
			let capacity = $("#capacity_part1").val() + $("#capacity_part2").val();
			
							
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
		
			
		// 상품 등록 버튼
		$("#submit").on('click', function(event){
			
			// DB에 들어갈 capacity(용량)과 unit(판매단위)를 
			// 하나의 문자로 만들어 주기위한 작업		
			let capacity = $("#capacity_part1").val() + $("#capacity_part2").val();
			
							
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
	<h1>상품 등록</h1>
	<!-- 파일 등록을 위해 enctype="multipart/form-data" 설정-->
	<form:form class="addProduct" 
		action="${pageContext.request.contextPath}/admin/insertProduct" 
			enctype="multipart/form-data" method="post">
		<table id="table" width="950" cellpadding="0" cellspacing="0" border="1">
			<tr>
				<td>상품명</td>
				<td><input type="text" id="name" name="name"></td>
			</tr>
			<tr>
				<td>가격</td>
				<td><input type="number" id="price" name="price" value="0">원</td>
			</tr>
			<tr>
				<td>용량</td>
				<td id="capacity">
					<p>
						<input type="number" id="capacity_part1" name="capacity_part1" value="0">
						<select id="capacity_part2" name="capacity_part2">
							<option value="g">g</option>
							<option value="kg">kg</option>
							<option value="ml">ml</option>
							<option value="L">L</option>
						</select>
					</p>
				</td>
			</tr>
			<tr>
				<td>브랜드</td>
				<td><input type="text" id="brand" name="brand"></td>
			</tr>
			<tr>
				<td>재고량</td>
				<td><input type="number" id="stock" name="stock" value="0"></td>
			</tr>
			<tr>
				<td>판매단위</td>
				<td id="unit">
					<input type="text" id="unit_part1" name="unit_part1" value="0">
					<select id="unit_part2" name="unit_part2">
						<option value="팩">팩</option>
						<option value="봉">봉</option>
						<option value="상자">상자</option>
						<option value="개">개</option>
						<option value="병">병</option>
						<option value="통">통</option>
					</select>
				</td>
			</tr>
			<tr>
				<td>상품종류</td>
				<td>
					<select id="type" name="type">
						<option value="채소/과일">채소/과일</option>
						<option value="국/반찬">국/반찬</option>
						<option value="육류">육류</option>
						<option value="간식/과자">간식/과자</option>
						<option value="유제품">유제품</option>
						<option value="즉석식품">즉석식품</option>
					</select>
				</td>
			</tr>
			<tr>
				<td>포장타입</td>
				<td>
					<input type="radio" name="packaging" value="상온" checked="checked">상온
					<input type="radio" name="packaging" value="냉장">냉장
					<input type="radio" name="packaging" value="냉동">냉동
				</td>
			</tr>
			<tr>
				<td>할인율</td>
				<td><input type="number" id="discount" name="discount" value="0">%</td>
			</tr>
			<tr>
				<td>배송타입</td>
				<td>
					<input type="radio" name="delivery_type" value="단순" checked="checked">단순
					<input type="radio" name="delivery_type" value="정기">정기
				</td>
			</tr>
			<tr>
				<td>판매상태</td>
				<td>
					<input type="radio" name="enabled" value="1" checked="checked">판매중
					<input type="radio" name="enabled" value="0">판매종료
				</td>
			</tr>
			<tr>
				<!-- accept="image/*"는 이미지 형태의 파일만 허용하겠다는 의미 -->
				<td>상품 대표 이미지</td>
				<td id="mainImage"><input type="file" id="main" name="main" accept="image/*" required></td>
			</tr>
			<tr>
				<td>상품정보 이미지</td>
				<td id="infoImage"><input type="file" id="info" name="info" accept="image/*" required></td>
			</tr>
			<tr>
				<td>상품상세 이미지</td>
				<td id="detailImage"><input type="file" id="detail" name="detail" accept="image/*" required></td>
			</tr>					

		</table>
		<button id="submit">상품 등록</button>
	</form:form> 
	
	<p class="link"><a href="${pageContext.request.contextPath}/admin/adminHome">이전(관리자홈)</a></p>
	<p class="link"><a href="${pageContext.request.contextPath}/admin/productManagement">상품목록</a></p>

</body>
</html>