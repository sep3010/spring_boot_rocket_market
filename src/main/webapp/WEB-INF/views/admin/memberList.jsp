<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<html>
<head>
<title>회원 리스트</title>
</head>
<body>
	<table width="1300" cellpadding="0" cellspacing="0" border="1">
	  <tr>
         <td>회원번호</td>
         <td>아이디</td>
         <td>닉네임</td>
         <td>이름</td>
         <td>연락처</td>
         <td>우편번호</td>
         <td>주소</td>
         <td>생일</td>
         <td>등급</td>
         <td>이메일</td>
         <td>적립금</td>
         <td>소셜 가입</td>
      </tr>
      
      <c:forEach items="${ListPaging}" var="ListPaging">
      <tr>
         <td>${ListPaging.id}</td>
         <td>
         <a href="/admin/memberInfo_view?id=${ListPaging.id}">${ListPaging.username}</a>
         </td>
         <td>${ListPaging.nickname}</td>
         <td>${ListPaging.name}</td>
         <td>${ListPaging.phone}</td>
         <td>${ListPaging.postcode}</td>
         <td>${ListPaging.address}</td>
         <td>${ListPaging.birth}</td>
         <td>${ListPaging.grade}</td>
         <td>${ListPaging.email}</td>
         <td>${ListPaging.point}</td>
         <td>
	         <c:choose>
				<c:when test="${empty ListPaging.platform_type}">
				 	X
				</c:when>
				<c:otherwise>
					${ListPaging.platform_type}
				</c:otherwise>				
			</c:choose>
		</td>
      </tr>
      </c:forEach>
	</table>


	<!-- 여기서 << 1 2 3 4 5 >> 이거 만드는 거임 -->
	<c:if test="${pageMaker.pre}">
		<a href="${pageContext.request.contextPath}/admin/memberList${pageMaker.makeQuery(pageMaker.startPage - 1) }">«</a>
	</c:if>

	<!-- 링크를 걸어준다 1-10페이지까지 페이지를 만들어주는것  -->
	<c:forEach var="idx" begin="${pageMaker.startPage }"
		end="${pageMaker.endPage }">
		<a href="${pageContext.request.contextPath}/admin/memberList${pageMaker.makeQuery(idx)}">${idx}</a>
	</c:forEach>

	<c:if test="${pageMaker.next && pageMaker.endPage > 0}">
		<a href="${pageContext.request.contextPath}/admin/memberList${pageMaker.makeQuery(pageMaker.endPage +1) }"> » </a>
	</c:if>


</body>
</html>