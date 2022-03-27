<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
    <!-- Required meta tags -->
    <meta charset="utf-8" />
    <meta
      name="viewport"
      content="width=device-width, initial-scale=1, shrink-to-fit=no"
    />

<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>

<!-- fontawesome -->
<script src="https://kit.fontawesome.com/b7ee8a4337.js" crossorigin="anonymous"></script>

<!-- csrf meta tag -->
<meta name="_csrf" content="${_csrf.token}"/>
<meta name="_csrf_header" content="${_csrf.headerName}"/>

<!-- Bootstrap CSS -->
<link
  rel="stylesheet"
  href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/css/bootstrap.min.css"
  integrity="sha384-zCbKRCUGaJDkqS1kPbPd7TveP5iyJE0EjAuZQTgFLD2ylzuqKfdKlfG/eSrtxUkn"
  crossorigin="anonymous"
/>
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/chatbot-ui.css" />
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/font.css" />
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/adminpage.css" />
          
<title>ROCKET MARKET :: 관리자페이지</title>
<script src="https://code.jquery.com/jquery-1.12.4.min.js"></script>
<link rel="shortcut icon" type="image/x-icon" href="${pageContext.request.contextPath}/imgs/logo.png" />

    
<style>

      #topmenu_left,
      #topmenu_right {
        font-weight: bold;
        font-size: 0.9em;
      }

      .navbar {
        display: block;
      }

      #logo {
        justify-content: center;
      }

      #topbanner {
        text-align: center;
        background-color: #d3c5a8;
      }

      #footernavbar {
        font-size: 1em;
      }

      #footernavbar a {
        text-align: center;
        width: 14rem;
      }

      .dropbtn {
        background-color: #ffffff;
        width: 13rem;
        color: rgb(90, 88, 88);
        font-weight: bold;
        padding: 16px;
        font-size: 16px;
        border: none;
        cursor: pointer;
      }

      #categorybtn {
        background-color: #ffffff;
        width: 13.5rem;
        color: rgb(90, 88, 88);
        font-weight: bold;
        text-align: center;
        padding: 16px;
        font-size: 16px;
        border: none;
        cursor: pointer;
      }

      .dropdown {
        display: inline-block;
      }

      .dropdown-content {
        display: none;
        width: 13rem;
        position: absolute;
        background-color: #f9f9f9;
        min-width: 160px;
        box-shadow: 0px 8px 16px 0px rgba(0, 0, 0, 0.2);
        z-index: 2;
      }

      .dropdown-content a {
        color: black;
        padding: 12px 16px;
        text-decoration: none;
        display: block;
      }

      .dropdown-content a:hover {
        background-color: #d8c5a2;
      }

      .dropdown:hover .dropdown-content {
        display: block;
      }

      .dropdown:hover .dropbtn {
        background-color: #d8c5a2;
        color: rgb(90, 88, 88);
      }

      /*카테고리 상단 고정*/
      .category {
        position: sticky;
        top: 0px;
        background: #fff;
        z-index: 1;
      }

      /* 사이드바 */
      main {
        position: relative;
        top: 0px;
      }
      .sidebar {
        margin-top: 10px;
        margin-right: 10px;
        width: 100px;
        position: absolute;
        top:10px;
        right: 10px;
        float: right;
        z-index: 3;
      }
      #cartbox {
        width: 100px;
        background-color: #eeddbe;
        border-radius: 10px;
      }

      #sideimg {
        width: 80%;
        height: 80%;
        position: relative;
      }

      /*장바구니 삭제 버튼*/
      #closebtn {
        position: absolute;
        top: 30px;
        right: 10px;
        z-index: 2;
      }

      #sidetitle a {
        text-decoration: none;
        color: black;
      }

      /*상단 페이지 이동*/

      #pagebtn {
        top: 60%;
        left: 80%;
        width: 100px;
        height: 50px;
        background-color: #eeddbe;
        border: 1px solid rgb(255, 255, 255);
        border-radius: 10px;
        top: 20px;
      }

      /*챗봇버튼*/

      .chat-btn {
        cursor: pointer;
        background-color: #ffffff;
        border: #ffffff;
        opacity: 1;
        transition: opacity 0.3s;
      }

      .card{
        border: none;
      }

      .card-body{
        font-weight: bold;
      }
      
    </style>



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
	<!-- ======================== 배너 =========================== -->
	<div>
    	<nav class="navbar" id="topbanner">
          <a class="navbar-brand" href="${pageContext.request.contextPath}/basicaddMemberForm" style="color: rgb(90, 69, 42)"> 🤎 회원가입 혜택이 팡팡팡! 🤎 </a>
        </nav>
    </div>

	<!-- ======================== 상단 메뉴 =========================== -->
    <div class="container pb-2">
        <nav class="navbar navbar-expand-md navbar-light">
          <button
            class="navbar-toggler"
            type="button"
            data-toggle="collapse"
            data-target="#navbarNavAltMarkup"
            aria-controls="navbarNavAltMarkup"
            aria-expanded="false"
            aria-label="Toggle navigation">
            <span class="navbar-toggler-icon"></span>
          </button>
          
          <div
            class="collapse navbar-collapse d-flex justify-content-between"
            id="navbarNavAltMarkup">
            <div class="navbar-nav" id="topmenu_left">
              <a class="nav-link" href="#">공지사항</a>
              <a class="nav-link" href="#">문의</a>
              <a class="nav-link" href="#">이벤트</a>
            </div>
            
            <!-- 로그인을 안했다면 -->
            <div class="navbar-nav" id="topmenu_right">
            <sec:authorize access="isAnonymous()">
              <a class="nav-link" href="${pageContext.request.contextPath}/loginForm">로그인</a>
              <a class="nav-link" href="${pageContext.request.contextPath}/basicaddMemberForm">회원가입</a>
              <a class="nav-link" href="${pageContext.request.contextPath}/user/userHome">마이페이지</a>
             </sec:authorize>
             
 
            <!-- 로그인을 했다면 -->
			<sec:authorize access="isAuthenticated()">
			<div style="align-self:center">
			  <sec:authentication property="principal.memberVO.name"/>님 환영합니다.&nbsp;&nbsp;
			</div>
			  <a 
			  class="nav-link" 
			  type="button"
			  onclick="document.getElementById('logout-form').submit();"
			  >로그아웃</a>
			  <form:form id="logout-form" action="${pageContext.request.contextPath}/logout" method="POST">
				  <input type="hidden"/>
			  </form:form>
			  
			  <!-- 관리자 -->
				<sec:authorize access="hasRole('ROLE_ADMIN')">					
					<a class="nav-link" href="${pageContext.request.contextPath}/admin/adminHome">관리자홈</a>
             		<a class="nav-link" href="${pageContext.request.contextPath}/admin/productManagement">상품관리</a>
              		<a class="nav-link" href="${pageContext.request.contextPath}/admin/memberList">회원관리</a>
                </sec:authorize>				
			  <!-- 회원 -->
			    <sec:authorize access="hasRole('ROLE_USER')">
			    	<a class="nav-link" href="${pageContext.request.contextPath}/user/userHome">마이페이지</a>
              		<a class="nav-link" href="#">위시리스트</a>
              		<a class="nav-link" href="${pageContext.request.contextPath}/user/cart">장바구니</a>
                </sec:authorize>
			</sec:authorize>             
             
            </div><!-- <div class="navbar-nav" id="topmenu_right"> -->
        </div><!-- collapse navbar-collapse -->


		<!-- ======================== 로고 =========================== -->
        <center>
        	<div id="logo" style="width: 12rem">
              <a href="${pageContext.request.contextPath}/"><img src="${pageContext.request.contextPath}/imgs/locketlogo.png" class="card-img-top"/></a>
            </div>
        </center>
	</nav>
  </div><!-- container -->
      
</header>

    <div class="pt-5 pb-5 mr-5 ml-5">
      <img src="${pageContext.request.contextPath}/imgs/admin.png" style="width: 50px;">
      <h1 style="font-weight: bold;"> <a href="${pageContext.request.contextPath}/admin/adminHome"> 관리자 페이지 </a></h1> 
      <br>
      <div class="d-flex justify-content-start align-items-center">
      	<h2 style="font-weight: bold;"> 상품등록 </h2>
      </div>
	
	<!-- 파일 등록을 위해 enctype="multipart/form-data" 설정-->
	<form:form class="addProduct" 
		action="${pageContext.request.contextPath}/admin/insertProduct" 
			enctype="multipart/form-data" method="post">
      <table class="table table-bordered pt-5"  id="admin_addproduct_table">
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
		<button class="btn btn-warning" id="submit">상품 등록</button>
	</form:form> 
	</div>
	<br><br><br>

    <!-- ======================== 하단 메뉴 (푸터 동일) =========================== -->
	<hr class="m-0" />
    <div class="container">
      <footer class="pt-0">
        <nav class="navbar navbar-expand-lg navbar-light">
          <div class="navbar d-flex justify-content-center">
            <div class="navbar-nav" id="footernavbar">
              <a class="nav-link" href="#">로켓마켓소개</a>
              <a class="nav-link" href="#">이용약관</a>
              <a class="nav-link" href="#">개인정보처리방침</a>
              <a class="nav-link" href="#">이용안내</a>
              <a class="nav-link" href="#">문의하기</a>
            </div>
          </div>
        </nav>
      </footer>
    </div>
    <!-- container -->
    <hr class="m-0" />

    <!-- Optional JavaScript; choose one of the two! -->

    <!-- Option 1: jQuery and Bootstrap Bundle (includes Popper) -->
    <script
      src="https://cdn.jsdelivr.net/npm/jquery@3.5.1/dist/jquery.min.js"
      integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj"
      crossorigin="anonymous"
    ></script>
    <script
      src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/js/bootstrap.bundle.min.js"
      integrity="sha384-fQybjgWLrvvRgtW6bFlB7jaZrFsaBXjsOMm/tB9LTS58ONXgqbR9W8oWht/amnpF"
      crossorigin="anonymous"
    ></script>

    <!-- Option 2: Separate Popper and Bootstrap JS -->
    <!--
    <script src="https://cdn.jsdelivr.net/npm/jquery@3.5.1/dist/jquery.slim.min.js" integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj" crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js" integrity="sha384-9/reFTGAW83EW2RDu2S0VKaIzap3H66lZH81PoYlFhbGU+6BZp6G7niu735Sk7lN" crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/js/bootstrap.min.js" integrity="sha384-VHvPCCyXqtD5DqJeNxl2dtTyhF78xXNXdkwX1CZeRusQfRKp+tA7hAShOK/B/fQ2" crossorigin="anonymous"></script>
    -->


</body>
</html>