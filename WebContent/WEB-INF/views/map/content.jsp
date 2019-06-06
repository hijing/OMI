<%@ page contentType = "text/html; charset=euc-kr" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<html>
<head>
<title>게시판</title>
<style type='text/css'>
<!--
a:link { color:black; text-decoration:none; }
a:visited {  }
a:active { text-decoration:underline; }
a:hover { text-decoration:underline; background-image:url('text_dottdeline.gif'); background-repeat:repeat-x; background-position:50% 100%; }
-->
</style>
<style>
<!--
@font-face {font-family:굴림;}
body,td,a,div,p,pre,input,textarea {font-family:굴림;font-size:9pt;}
-->
</style>
</head>

<body bgcolor="${bodyback_c}">

<script src="//dapi.kakao.com/v2/maps/sdk.js?appkey=d96dbbd36817062878a321222f6634f1"></script>

<center><b>글내용 보기</b>
<br>
<form>
<table width="500" border="1" cellspacing="0" cellpadding="0" align="center" class="tcontent">  
  <tr height="30">
    <td align="center" width="125" bgcolor="${value_c}" class="tBack">글번호</td>
    <td align="center" width="125">${article.num}</td>
    <td align="center" width="125" bgcolor="${value_c}" class="tBack">조회수</td>
    <td align="center" width="125">${article.readcount}</td>
  </tr>
  <tr height="30">
    <td align="center" width="125" bgcolor="${value_c}" class="tBack">작성자</td>
    <td align="center" width="125">${article.writer}</td>
    <td align="center" width="125" bgcolor="${value_c}" class="tBack">작성일</td>
    <td align="center" width="125">${article.reg_date}</td>
  </tr>
  <tr height="30">
    <td align="center" width="125" bgcolor="${value_c}" class="tBack">글제목</td>
    <td align="center" colspan="3">${article.subject}</td>
  </tr>
  <tr height="30">
    <td align="center" width="125" bgcolor="${value_c}" class="tBack">데이터</td>
    <td align="center" colspan="3">${article.data}</td>
  </tr>
  <tr height="30">
    <td align="center" width="125" bgcolor="${value_c}" class="tBack">위치</td>
    <td align="center" colspan="3">${article.local}</td>
  </tr>
  <tr height="30">
    <td align="center" width="125" bgcolor="${value_c}" class="tBack">위도 경도</td>
    <td align="center" colspan="3">위도 : ${article.x}  경도 : ${article.y }</td>
  </tr>
  <tr>
	<td colspan=4 height=400>
		<div id="map" style="width:100%;height:100%;"></div>
		<!-- 객체 생성한 지도를 담을 공간. 불러옴, 세팅.(***객체 생성문 보다 위에 써야 함.) -->
	</td>
  </tr>

  <tr>
    <td align="center" width="125" bgcolor="${value_c}" class="tBack">글내용</td>
    <td align="left" width="375" colspan="3"><pre>${article.content}</pre></td>
  </tr>
  <tr height="30">      
    <td colspan="4" bgcolor="${value_c}" align="right" > 
    
    <c:if test="${sessionScope.memId == 1014030732 }">
		<input type="button" value="추가 & 삭제" onclick="document.location.href='dataInsertForm.omi?num=${article.num}&pageNum=${pageNum}'">
		&nbsp;&nbsp;&nbsp;&nbsp;
		<input type="button" value="글삭제"  onclick="document.location.href='deleteForm.omi?num=${article.num}&pageNum=${pageNum}'">
	    &nbsp;&nbsp;&nbsp;&nbsp;
	</c:if>
    
    <c:if test="${sessionScope.memId == article.id}">
	  <input type="button" value="글수정" 
       onclick="document.location.href='updateForm.omi?num=${article.num}&pageNum=${pageNum}'">
	   &nbsp;&nbsp;&nbsp;&nbsp;
	  <input type="button" value="글삭제" 
       onclick="document.location.href='deleteForm.omi?num=${article.num}&pageNum=${pageNum}'">
	   &nbsp;&nbsp;&nbsp;&nbsp;
	</c:if>
	
       <input type="button" value="글목록" 
       onclick="document.location.href='list.omi?pageNum=${pageNum}'">
    </td>
  </tr>
</table>    
</form>   

<script>
	var mapContainer = document.getElementById('map'), // 지도를 표시할 div
    mapOption = {
        center: new daum.maps.LatLng(${article.x}, ${article.y}), // 지도의 중심좌표
		level: 2 // 지도의 확대 레벨
    };

	//지도를 미리 생성
	var map = new daum.maps.Map(mapContainer, mapOption);
	//마커를 미리 생성
	var marker = new daum.maps.Marker({
	    position: new daum.maps.LatLng(${article.x}, ${article.y}),
	    map: map
	});
	// 해당 주소에 대한 좌표를 받아서
    var coords = new daum.maps.LatLng(${article.x}, ${article.y}); 
    // 지도를 보여준다.
    mapContainer.style.display = "block";
    map.relayout();
    // 지도 중심을 변경한다.
    map.setCenter(coords);
    // 마커를 결과값으로 받은 위치로 옮긴다.
    marker.setPosition(coords);
	</script>	
   
</body>
</html>      
