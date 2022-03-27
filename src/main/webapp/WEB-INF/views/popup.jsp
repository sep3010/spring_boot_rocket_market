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
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/font.css" />


<title>ROCKET MARKET 로그인</title>
<script src="https://code.jquery.com/jquery-1.12.4.min.js"></script>
<link rel="shortcut icon" type="image/x-icon" href="${pageContext.request.contextPath}/imgs/logo.png" />



     <style>
   
      .layerPopup img{
        margin-bottom : 20px;}
      .layerPopup:before {display:block; content:""; position:fixed; left:0; top:0; width:100%; height:100%; background:rgba(0,0,0,.5); z-index:9000}
      .layerPopup .layerBox {    z-index:10000;   
        position:fixed; left:50%; top:50%; transform:translate(-50%, -50%); padding:30px; background:#fff; border-radius:6px; }
      .layerPopup .layerBox .title {margin-bottom:10px; padding-bottom:10px; font-weight:600; border-bottom:1px solid #d9d9d9;}
      .layerPopup .layerBox .btnTodayHide {
        font-size:14px; font-weight:600; color:black; 
        float: left;text-decoration:none;width: 150px; 
        height : 30px;line-height:30px;border:black solid 1px; text-align : center;text-decoration:none;
      }
      .layerPopup div{
        display : inline;
      }
      .layerPopup form{
        margin-top : 5px;
        font-size:16px; font-weight:600;
        height : 30px;
        line-height:30px
      }
      .layerPopup #close {
        font-size:16px; font-weight:600; width: 40px; height : 30px;color:black; float: right; line-height:30px; text-align : center;text-decoration:underline;
      }
      .layerPopup a{
        text-decoration : none;
        color : black;width: 50px;height : 40px;
      }
    
      </style>

		<script type="text/javascript">
              function setCookie( name, value, expiredays ) {
                  var todayDate = new Date();
                  todayDate.setDate( todayDate.getDate() + expiredays ); 
                  document.cookie = name + "=" + escape( value ) + "; path=/; expires=" + todayDate.toGMTString() + ";"
              }
              function closePop() {
                  if ( document.pop_form.chkbox.checked ){            	  
                      setCookie( "maindiv", "done" , 1 );
                  }
                  document.all['layer_popup'].style.visibility = "hidden";

              }
      </script> 

   
  </head>
<body>
<!-- layer popup content -->
<div class="layerPopup" id="layer_popup" style="visibility: visible;">
  <div class="layerBox">
      <h4 class="title">ROCKET MARKET 이벤트!</h4>
      <div class="cont">
          <p>
          <a href="${pageContext.request.contextPath}/basicaddMemberForm"><img src="${pageContext.request.contextPath}/imgs/event.png" width=350 height=500 usemap="#popup" alt="event page"></a>
          </p>
      </div>
        <form name="pop_form">
          <div id="check" ><input type="checkbox" name="chkbox" value="checkbox" id='chkbox' >
            <label for="chkbox">&nbsp&nbsp오늘 하루동안 보지 않기</label></div>
          <div id="close" ><a href="javascript:closePop();">닫기</a></div>    
        </form>
  </div>
</div>

    <script>

	        cookiedata = document.cookie;       
	        if ( cookiedata.indexOf("maindiv=done") < 0 ){     
	            document.all['layer_popup'].style.visibility = "visible";
	        }
	        else {
	            document.all['layer_popup'].style.visibility = "hidden";
	        }

	        
	</script>
	

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
