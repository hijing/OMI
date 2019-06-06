<%@ page contentType = "text/html; charset=euc-kr" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<html>
<head>
<title>게시판</title>
<link href="style.css" rel="stylesheet" type="text/css">
<script language="JavaScript" src="script.js"></script>
</head>

<body bgcolor="${bodyback_c}">

<script src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script>
<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=d96dbbd36817062878a321222f6634f1&libraries=services"></script>

<script type='text/javascript'>
	function writeSave(){
		if(document.writeform.data.value == ''){
			alert("선택사항 필수!");
			document.writeform.data.focus();
			return false;
		}
	}
</script>

<center><b>글수정</b>
<br>
<form method="post" name="writeform" action="updatePro.omi?pageNum=${pageNum}" onsubmit="return writeSave()">
<table border="1" cellspacing="0" cellpadding="0" align="center" class="tcontent">
  <tr>
    <td  width="90"  bgcolor="${value_c}" align="center" class="tBack">이 름</td>
    <td align="left" width="330">
       ${article.writer}
       <input type="hidden" name="id" value="${article.id }">
	   <input type="hidden" name="num" value="${article.num}"></td>
  </tr>
  <tr>
    <td  width="90"  bgcolor="${value_c}" align="center" class="tBack">제 목</td>
    <td align="left" width="330">
       <input type="text" size="40" maxlength="50" name="subject" value="${article.subject}"></td>
  </tr>
  <tr>
  	<td width="90" align="center" class="tBack">* 선택사항</td>
  	<td width="330">
  		<select name="data">
  		<option selected>-데이터 선택-</option>
  		<option value="cctv">cctv</option>
  		<option value="공공시설">공공시설</option>
  		<option value="wifi">무료 wifi</option>
  		</select>
  	</td>
  </tr>
  <tr>
    <td width="90" align="center" class="tBack">장소</td>
    <td>
     <input type="text" id="sample5_address" placeholder="주소를 검색하거나 지도를 클릭해주세요." name="local" readonly="true" value="${article.local }" size=50>
	 <input type="button" onclick="sample5_execDaumPostcode()" value="주소 검색"><br>
	 </td>
  </tr>
  <tr>
  	<td colspan=2 height=350>
  		<div id="map" style="width:100%;height:350px;"></div>
  		<div id="clickLatlng"></div>
  	</td>
  </tr>
  <tr>
    <td  width="90"  bgcolor="${value_c}" align="center" class="tBack">내 용</td>
    <td align="left" width="330">
     <textarea name="content" style="width:100%;resize:none" rows=10>${article.content}</textarea></td>
  </tr>
  <tr>      
	<td colspan=2  align="center"> 
	위도 : <input type="text" readonly="true" name="x" value="${article.x }">
	경도 : <input type="text" readonly="true" name="y" value="${article.y }">
	</td>
</tr>
  <tr>      
   <td colspan=2 bgcolor="${value_c}" align="center"> 
     <input type="submit" value="글수정" >  
     <input type="reset" value="다시작성">
     <input type="button" value="목록보기" 
       onclick="document.location.href='list.omi?pageNum=${pageNum}'">
   </td>
 </tr>
 </table>
</form>

<script>
		var mapContainer = document.getElementById('map'), // 지도를 표시할 div
		mapOption = {
		    center: new daum.maps.LatLng(${article.x}, ${article.y}), // 지도의 중심좌표
		    level: 3 // 지도의 확대 레벨
		};
		
		//지도를 미리 생성
		var map = new daum.maps.Map(mapContainer, mapOption);
		//주소-좌표 변환 객체를 생성
		var geocoder = new daum.maps.services.Geocoder();
		//마커를 미리 생성
		var marker = new daum.maps.Marker({
		position: map.getCenter(),
		map: map
		});
		
		var infowindow = new daum.maps.InfoWindow({zindex:1}); // 클릭한 위치에 대한 주소를 표시할 인포윈도우입니다
		
		
		// 지도에 클릭 이벤트를 등록합니다
		// 지도를 클릭하면 마지막 파라미터로 넘어온 함수를 호출합니다
		daum.maps.event.addListener(map, 'click', function(mouseEvent) {
		    
		    // 클릭한 위도, 경도 정보를 가져옵니다 
		    var latlng = mouseEvent.latLng; 
		    
		    // 마커 위치를 클릭한 위치로 옮깁니다
		    marker.setPosition(latlng);
		    
		    document.writeform.x.value=latlng.getLat();
		    document.writeform.y.value=latlng.getLng();
		    console.log(latlng.getLng());
		    console.log(latlng.getLat());
		    
		    var resultDiv = document.getElementById('clickLatlng');

		});
		
		
		function sample5_execDaumPostcode() {
		new daum.Postcode({
		    oncomplete: function(data) {
		        // 각 주소의 노출 규칙에 따라 주소를 조합한다.
		        // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
		        var fullAddr = data.address; // 최종 주소 변수
		        var extraAddr = ''; // 조합형 주소 변수
		
		        // 기본 주소가 도로명 타입일때 조합한다.
		        if(data.addressType === 'R'){
		            //법정동명이 있을 경우 추가한다.
		            if(data.bname !== ''){
		                extraAddr += data.bname;
		            }
		            // 건물명이 있을 경우 추가한다.
		            if(data.buildingName !== ''){
		                extraAddr += (extraAddr !== '' ? ', ' + data.buildingName : data.buildingName);
		            }
		            // 조합형주소의 유무에 따라 양쪽에 괄호를 추가하여 최종 주소를 만든다.
		            fullAddr += (extraAddr !== '' ? ' ('+ extraAddr +')' : '');
		        }
		
		        // 주소 정보를 해당 필드에 넣는다.
		        document.getElementById("sample5_address").value = fullAddr;
		        // 주소로 상세 정보를 검색
		        geocoder.addressSearch(data.address, function(results, status) {
		            // 정상적으로 검색이 완료됐으면
		            if (status === daum.maps.services.Status.OK) {
		
		                var result = results[0]; //첫번째 결과의 값을 활용
		
		                // 해당 주소에 대한 좌표를 받아서
		                var coords = new daum.maps.LatLng(result.y, result.x);
		                document.writeform.x.value=result.x;
		                document.writeform.y.value=result.y;
		                // 지도를 보여준다.
		                mapContainer.style.display = "block";
		                map.relayout();
		                // 지도 중심을 변경한다.
		                map.setCenter(coords);
		                // 마커를 결과값으로 받은 위치로 옮긴다.
		                marker.setPosition(coords)
		            }
		        });
		    }
		}).open();
		}
		
		// 지도를 클릭했을 때 클릭 위치 좌표에 대한 주소정보를 표시하도록 이벤트를 등록합니다
		daum.maps.event.addListener(map, 'click', function(mouseEvent) {
		    searchDetailAddrFromCoords(mouseEvent.latLng, function(result, status) {
		        if (status === daum.maps.services.Status.OK) {
		            /* var detailAddr = !!result[0].road_address ? '<div>도로명주소 : ' + result[0].road_address.address_name + '</div>' : '';
		            detailAddr += '<div>지번 주소 : ' + result[0].address.address_name + '</div>';
		            
		            var content = '<div class="bAddr">' +
		                            '<span class="title">법정동 주소정보</span>' + 
		                            detailAddr + 
		                        '</div>'; */

                    document.getElementById("sample5_address").value = result[0].address.address_name;
		            // 마커를 클릭한 위치에 표시합니다 
		            marker.setPosition(mouseEvent.latLng);
		            marker.setMap(map);

		        }   
		    });
		});

		function searchAddrFromCoords(coords, callback) {
		    // 좌표로 행정동 주소 정보를 요청합니다
		    geocoder.coord2RegionCode(coords.getLng(), coords.getLat(), callback);         
		}

		function searchDetailAddrFromCoords(coords, callback) {
		    // 좌표로 법정동 상세 주소 정보를 요청합니다
		    geocoder.coord2Address(coords.getLng(), coords.getLat(), callback);
		}

</script>

</body>
</html>      
