<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>couponManagement</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>


</head>
<body>
	<h1>쿠폰등록</h1>
   <form:form class="addCoupon" action="${pageContext.request.contextPath}/admin/insertCoupon" method="post">
      <table width="950" cellpadding="0" cellspacing="0" border="1">
         <tr>
            <td>쿠폰명</td>
            <td><input type="text" id="coupon_name" name="coupon_name"></td>
         </tr>
         <tr>
            <td>할인율</td>
            <td><input type="number" id="coupon_discount" name="coupon_discount" value="0">%</td>
         </tr>
      </table>
      <button type="submit">쿠폰 등록</button>
   </form:form>

</body>
</html>