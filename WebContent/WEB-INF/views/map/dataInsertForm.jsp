<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<body>
<script src="//dapi.kakao.com/v2/maps/sdk.js?appkey=d96dbbd36817062878a321222f6634f1"></script>

<script type='text/javascript'>
	function writeSave(){
		if(document.writeForm.information.value == ''){
			alert("데이터 이름을 적어주세요.");
			document.writeForm.information.focus();
			return false;
		}
	}
</script>

<form action="dataInsertPro.omi" name="writeForm" onsubmit="return writeSave()">
<table border="1" cellspacing="0" cellpadding="0" align="center">  
  <tr height="30">
    <td align="center">글번호</td>
    <td align="center">${article.num}</td>
    <td align="center">조회수</td>
    <td align="center">${article.readcount }</td>
  </tr>
  <tr height="30">
    <td align="center">작성자</td>
    <td align="center">${article.writer}</td>
    <td align="center">작성일</td>
    <td align="center">${article.reg_date}</td>
  </tr>
  <tr height="30">
    <td align="center">글제목</td>
    <td align="center" colspan="3">${article.subject}</td>
  </tr>
  <tr height="30">
    <td align="center" bgcolor="${value_c}">데이터</td>
    <td align="center" colspan="3">${article.data}</td>
  </tr>
  <tr height="30">
    <td align="center" bgcolor="${value_c}">위치</td>
    <td align="center" colspan="3">${article.local}</td>
    <c:if test="${article.data == 'wifi' || article.data == 'cctv'}">
    <input type="hidden" name="sigungu1" value="${sigungu1 }">
    <input type="hidden" name="sigungu2" value="${sigungu2 }">
    </c:if>
  </tr>
  <tr height="30">
    <td align="center" bgcolor="${value_c}">지역코드</td>
    <td align="center" colspan="3">${localCode}</td>
    <input type="hidden" name="localCode" value="${localCode }" />
  </tr>
  <tr height="30">
    <td align="center" bgcolor="${value_c}">위도 경도</td>
    <td align="center" colspan="3">위도 : ${article.x}  경도 : ${article.y }</td>
  </tr>
  <tr>
	<td colspan=4 height=400>
		<div id="map" style="width:100%;height:100%;"></div>
		<!-- 객체 생성한 지도를 담을 공간. 불러옴, 세팅.(***객체 생성문 보다 위에 써야 함.) -->
	</td>
  </tr>
  <c:if test="${article.data == 'cctv' }">
	  <tr>
	    <td align="center">방향</td>
	    <td align="left" colspan="3">
	    	<input type="text" name="direction" size=50/>
	    </td>
	  </tr>
	</c:if>
	<c:if test="${article.count == 0 }">
  <tr>
    <td align="center">*데이터 제목</td>
    <td align="left" colspan="3">
    	<input type="text" name="information" size=50/>
    </td>
  </tr>
  </c:if>
  
  <tr height="30">
    <td colspan="4" bgcolor="${value_c}" align="right" > 
    	<input type="hidden" name="num" value="${article.num }">
    	<input type="hidden" name="pageNum" value="${pageNum }">
    	<c:if test="${article.count == 0 }">
		<input type="submit" value="추가하기">
		&nbsp;&nbsp;&nbsp;&nbsp;
		</c:if>
		<c:if test="${article.count != 0 }">
			<input type="button" value="삭제하기"
			onclick="document.location.href='dataDeletePro.omi?num=${article.num}&pageNum=${pageNum }'">
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