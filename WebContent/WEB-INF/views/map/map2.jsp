<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=d96dbbd36817062878a321222f6634f1"></script>  
<head>
<script src="//code.jquery.com/jquery-latest.min.js"></script>
<style>
	.area {
	    position: absolute;
	    background: #fff;
	    border: 1px solid #888;
	    border-radius: 3px;
	    font-size: 12px;
	    top: -5px;
	    left: 15px;
	    padding:2px;
	}
	
	.info {
	    font-size: 12px;
	    padding: 5px;
	}
	.info .title {
	    font-weight: bold;
	}
</style>
</head>

<body>

<div id="load"><img src="/OMI/images/loading.gif" alt="loading"> </div>
<div class="map2Text1">지도 위에 마우스 오버 시 지역별 정보가 나타납니다.</div><br /><div class="map2Text1">자세한 정보를 알고 싶으시다면 지역을</div> <div class="map2Text2">클릭</div><div class="map2Text1">해주세요.</div><br /><br />
	<div id="map" style="width:1100px;height:900px;"></div>
	<script src="https://code.jquery.com/jquery-3.1.1.js"></script>
	<script>
	var mapContainer = document.getElementById('map'), // 지도를 표시할 div 
    mapOption = { 
        center: new daum.maps.LatLng(36.2597562818552, 127.95089116577991), // 지도의 중심좌표
        level: 12 // 지도의 확대 레벨
    };
	
	var map = new daum.maps.Map(mapContainer, mapOption),
	 customOverlay = new daum.maps.CustomOverlay({});
	


	//행정구역 구분
	$.getJSON("/OMI/resources/json/gg3.json", function(geojson) {
	 
	    var data = geojson.features;
	    var coordinates = [];    //좌표 저장할 배열
	    var name = '';            //행정 구 이름
	    var num = ''; // 행정 코드
	    $.each(data, function(index, val) {
	 
	        coordinates = val.geometry.coordinates;
	        name = val.properties.SIG_KOR_NM;
	        num = val.properties.SIG_CD;
	        displayArea(coordinates, name,num);
	    })
	    $('#load').hide();
	})
	 
	var polygons=[];                //function 안 쪽에 지역변수로 넣으니깐 폴리곤 하나 생성할 때마다 배열이 비어서 클릭했을 때 전체를 못 없애줌.  그래서 전역변수로 만듦.
	    
	//행정구역 폴리곤
	function displayArea(coordinates, name,num) {
		var bike=null;
		var child=null;
		var jaywalking=null;
		var wifi=null;
		var publics=null;
		var cctv=null;
	
	 <c:forEach var="geoInfo" items="${geoInfo}">
	 	if("${geoInfo.code}"==num){
	 		bike=${geoInfo.bikeAC};
	 		child=${geoInfo.childAC};
	 		jaywalking=${geoInfo.jaywalkingAC};
	 		wifi=${geoInfo.wifi};
	 		publics=${geoInfo.publics};
	 		cctv=${geoInfo.cctv};
	 	}
	 </c:forEach>
	 
	    var path = [];            //폴리곤 그려줄 path
	    var points = [];        //중심좌표 구하기 위한 지역구 좌표들
	    
		var num2 = num.substring(0,2);
	    if(num2=="11"){
	    	name="서울 "+name;
	    }else if(num2=="26"){
	    	name="부산 "+name;
	    }else if(num2=="27"){
	    	name="대구 "+name;
	    }else if(num2=="28"){
	    	name="인천 "+name;
	    }else if(num2=="29"){
	    	name="광주 "+name;
	    }else if(num2=="30"){
	    	name="대전 "+name;
	    }else if(num2=="31"){
	    	name="울산 "+name;
	    }else if(num2=="36"){
	    	name="세종 "+name;
	    }else if(num2=="41"){
	    	name="경기 "+name;
	    }else if(num2=="42"){
	    	name="강원 "+name;
	    }else if(num2=="43"){
	    	name="충북 "+name;
	    }else if(num2=="44"){
	    	name="충남 "+name;
	    }else if(num2=="45"){
	    	name="전북 "+name;
	    }else if(num2=="46"){
	    	name="전남 "+name;
	    }else if(num2=="47"){
	    	name="경북 "+name;
	    }else if(num2=="48"){
	    	name="경남 "+name;
	    }else if(num2=="50"){
	    	name="제주 "+name;
	    }
	    
	    $.each(coordinates[0], function(index, coordinate) {        //console.log(coordinates)를 확인해보면 보면 [0]번째에 배열이 주로 저장이 됨.  그래서 [0]번째 배열에서 꺼내줌.
	        var point = new Object(); 
	        point.x = coordinate[1];
	        point.y = coordinate[0];
	        points.push(point);
	        path.push(new daum.maps.LatLng(coordinate[1], coordinate[0]));            //new daum.maps.LatLng가 없으면 인식을 못해서 path 배열에 추가
	    })
	    
	    // 다각형을 생성합니다 
	    var polygon = new daum.maps.Polygon({
	        map : map, // 다각형을 표시할 지도 객체
	        path : path,
	        strokeWeight : 2,
	        strokeColor : '#004c80',
	        strokeOpacity : 0.3,
	        fillColor : '#fff',
	        fillOpacity : 0.2
	    });
	    polygons.push(polygon);            //폴리곤 제거하기 위한 배열
	    


	    // 다각형에 mouseover 이벤트를 등록하고 이벤트가 발생하면 폴리곤의 채움색을 변경합니다 
	    // 지역명을 표시하는 커스텀오버레이를 지도위에 표시합니다
	    daum.maps.event.addListener(polygon, 'mouseover', function(mouseEvent) {
	        polygon.setOptions({
	            fillColor : '#09f'
	        });
	 
	        customOverlay.setContent('<div class="area"><b>' + name +'</b><br /> 자전거 교통사고 다발지역 : '+bike+ '<br /> 어린이 교통사고 다발지역 : '+child+
	        		'<br /> 무단횡단 교통사고 다발지역 : '+jaywalking+'<br />공공 와이파이 장소 : '+wifi+'<br />공공시설 갯수 : '+publics+'<br />cctv 갯수 : '+cctv+'</div>');
	 
	        customOverlay.setPosition(mouseEvent.latLng);
	        customOverlay.setMap(map);
	    });
	 
	    // 다각형에 mousemove 이벤트를 등록하고 이벤트가 발생하면 커스텀 오버레이의 위치를 변경합니다 
	    daum.maps.event.addListener(polygon, 'mousemove', function(mouseEvent) {
	 
	        customOverlay.setPosition(mouseEvent.latLng);
	    });
	 
	    // 다각형에 mouseout 이벤트를 등록하고 이벤트가 발생하면 폴리곤의 채움색을 원래색으로 변경합니다
	    // 커스텀 오버레이를 지도에서 제거합니다 
	    daum.maps.event.addListener(polygon, 'mouseout', function() {
	    	
	        polygon.setOptions({
	            fillColor : '#fff'
	        });
	        customOverlay.setMap(null);
	    });

	    daum.maps.event.addListener(polygon, 'click',  function(mouseEvent){
	    	$('#load').show();
	    	location.href="/OMI/OMI/map.omi?geocode="+num+"&name="+name;
	    });
	    
	}	
	</script>
</body>