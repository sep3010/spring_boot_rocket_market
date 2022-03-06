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
	<h1>상품등록</h1>
	<!-- 파일 등록을 위해 enctype="multipart/form-data" 설정-->
	<form:form class="addProduct" 
		action="${pageContext.request.contextPath}/admin/insertProduct" 
			enctype="multipart/form-data" method="post">
		<table width="950" cellpadding="0" cellspacing="0" border="1">
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
					<p>
						<input type="number" id="capacity_part3" name="capacity_part3" value="0">개입
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
						<option value="기타">직접입력</option>
					</select>
				</td>
			</tr>
			<tr>
				<td>상품종류</td>
				<td>
					<select name="type">
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
				<td><input type="number" id="discount" name="discount" value="0"></td>
			</tr>
			<tr>
				<td>배송타입</td>
				<td>
					<input type="radio" name="delivery_type" value="단순" checked="checked">단순
					<input type="radio" name="delivery_type" value="단기">단기
					<input type="radio" name="delivery_type" value="정기">정기
				</td>
			</tr>
			<tr>
				<!-- accept="image/*"는 이미지 형태의 파일만 허용하겠다는 의미 -->
				<td>상품 대표 이미지</td>
				<td><input type="file" id="main" name="main" accept="image/*"></td>
			</tr>
			<tr>
				<td>상품정보 이미지</td>
				<td><input type="file" id="info" name="info" accept="image/*"></td>
			</tr>
			<tr>
				<td>상품상세 이미지</td>
				<td><input type="file" id="detail" name="detail" accept="image/*"></td>
			</tr>					

		</table>
		<button id="submit">상품 등록</button>
	</form:form>
	
	

	<p><a href="${pageContext.request.contextPath}/admin/adminHome">이전(관리자홈)</a></p>
	<p><a href="${pageContext.request.contextPath}/admin/productManagement">상품목록</a></p>

</body>
</html>