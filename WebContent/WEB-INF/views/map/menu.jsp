<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!doctype html>
<html lang="kr">
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge"/>
<meta name="viewport" content="user-scalable=no, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0, width=device-width"/>
<title>Custom Login Demo - Kakao JavaScript SDK</title>
<script src="//developers.kakao.com/sdk/js/kakao.min.js"></script>

<style rel="stylesheet">
   .tabs {
      font-size: 13px; line-height: 20px;
   }
   .tabs ul:before, .tabs ul:after {
      content: "\0020"; display: block; height: 0; visibility: hidden;   
   } 
   .tabs ul:after { clear: both; }
   .tabs ul {
      margin:0;
      list-style:none;
      padding: 0 20%;
      border-bottom: 1px solid #e0e0e0;
      zoom: 1;
   }
   
   .tabs ul li {
      position: relative;
      float: left;
      margin: 0;
   }
   .tabs ul li a {
      background: #f6f6f6;
      font-weight: bold;
      text-align: center;
      display: block;
      border: 1px solid #e0e0e0;
      color: #909090;
      text-shadow: 0 1px 0 rgba(255,255,255, 0.75);
      padding: 6px 18px; margin: 0 5px -1px 0;
      /* Border Radius */
      -webkit-border-top-left-radius: 6px;
      -webkit-border-top-right-radius: 6px;
      -moz-border-radius-topleft: 6px;
      -moz-border-radius-topright: 6px;
      border-top-left-radius: 6px;
      border-top-right-radius: 6px;
      text-decoration:none;
   }
   .tabs ul li a:hover {
      border-color: #ccc;
      color: #606060;
   }
   .tabs ul li.active a {
      background: #fff;
      border-color: #d4d4d4;
      border-bottom: 1px solid #fff;
      color: #486AAE;
      margin-top: -4px;
      padding-top: 10px;
   }

</style>
</head>
<body>

<br/><br/><br/>

<div class="tabs">
  <ul>
     <c:if test="${main=='map.jsp' || main=='select.jsp'}">
      <li class="active"><a href="main.omi">검색</a></li>
      <li><a href="map2.omi">전국 정보</a></li>
      <li><a href="list.omi">데이터 추가 신청하기</a></li>
   </c:if>
   <c:if test="${main=='map2.jsp' }">
      <li><a href="map.omi">검색</a></li>
      <li class="active"><a href="map2.omi">전국 정보</a></li>
      <li><a href="list.omi">데이터 추가 신청하기</a></li>
   </c:if>
   <c:if test="${main=='list.jsp' || main=='content.jsp' || main=='updateForm.jsp' || main=='deleteForm.jsp' || main=='writeForm.jsp'}">
      <li><a href="map.omi">검색</a></li>
      <li><a href="map2.omi">전국 정보</a></li>
      <li class="active"><a href="list.omi">데이터 추가 신청하기</a></li>
   </c:if>
  </ul>
</div>

</body>
</html>