<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html lang="kr">
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge"/>
<meta name="viewport" content="user-scalable=no, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0, width=device-width"/>
<title>Custom Login Demo - Kakao JavaScript SDK</title>
<script src="//developers.kakao.com/sdk/js/kakao.min.js"></script>

</head>
<body>
<table align="right">
   <c:if test="${sessionScope.memId == null}">
      <tr>
         <td width="50"><img src="/OMI/images/kakao.png" onclick="login()" style='cursor:pointer'></a></td>
         <td width="300"></td>
      </tr>
   </c:if>
   <c:if test="${sessionScope.memId != null }">
      <tr>
         <td width="200" align="center" ><div id="topMSG2">${nickname } </div><div id="topMSG1">님 환영합니다.</div></td>
         <td width="50"><a id="topLogin" href="#" onclick="out()">Logout</a></td>
         <td width="300"></td>
      </tr>
   </c:if>

</table><br /><br /><br /><br />
<a id="top1" href="main.omi">OMI</a>
<p />
<a id="top2" href="main.omi">Only Map Information</a>


<script type='text/javascript'>

    // 사용할 앱의 JavaScript 키를 설정해 주세요.
    Kakao.init('cb62f9c085465b25a6b2359c43c379dc');

   function login(){
      Kakao.Auth.loginForm({
         success: function(authObj){
            Kakao.API.request({
                    url : '/v1/user/me',
                    success: function(res){
                       alert(res.properties.nickname+'님 환영합니다.');
                       window.location='main.omi?id='+res.id+'&token='+authObj.access_token+'&nickname='+res.properties.nickname;
                    },
                    fail: function(error){
                       alert(JSON.stringify(error));
                    }
                 });
         },
         fail: function(err){
            alert("error");
         }
      })
   }
      
      function out(){
         Kakao.Auth.logout(function(){
            setTimeout(function(){
              window.location='logout.omi'
           },1000);
         });
      }

</script>
</body>
</html>