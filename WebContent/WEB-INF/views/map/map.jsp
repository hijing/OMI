<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<head>
<meta charset="UTF-8">
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
#close {
	position: absolute;
	padding: 4px;
	top: 5px;
	left: 5px;
	cursor: pointer;
	background: #fff;
	border-radius: 4px;
	border: 1px solid #c8c8c8;
	box-shadow: 0px 1px #888;
	display:none;
}

#close .img {
	position:absolute;
	z-index:3;
	display: block;
	background: url(http://t1.daumcdn.net/localimg/localimages/07/mapapidoc/rv_close.png) no-repeat;
	width: 14px;
	height: 14px;
}

</style>
</head>

<body>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<center>
<script>
function loading(){
	if(document.form1.area1.value == '0'){
		alert("지역을 선택해주세요.");
		document.form1.area1.focus();
		return false;
	}
	if(document.form1.area2.value == ''){
		alert("지역을 선택해주세요.");
		document.form1.area2.focus();
		return false;
	}
	
	var target2 = document.getElementById("area2");
    var t2 = target2.options[target2.selectedIndex].text;
    document.getElementById("area22").value=t2;
    form.submit();
    
	$('#load').show();	
	return "document.location.href='map.omi?area2=${area2}'";
}
</script>
<c:if test="${areaName1!=null && areaName2!=null }">
	<div id="searchText2">${areaName1} ${areaName2}</div> <div id="searchText1">에 대한 검색 결과입니다.</div><br /><br />
</c:if>
<c:if test="${name!=null}">
	<div id="searchText2">${name}</div> <div id="searchText1">에 대한 검색 결과입니다.</div><br /><br />
</c:if>
<form action="map.omi" name="form1" method="post">
<select name="area1" id="area" onChange="cat1_change(this.value,area2)" class="style" >
<option value='0' selected>-선택-</option>
<option value='1'>서울</option>
<option value='2'>부산</option>
<option value='3'>대구</option>
<option value='4'>인천</option>
<option value='5'>광주</option>
<option value='6'>대전</option>
<option value='7'>울산</option>
<option value='8'>세종</option>
<option value='9'>경기</option>
<option value='10'>강원</option>
<option value='11'>충북</option>
<option value='12'>충남</option>
<option value='13'>전북</option>
<option value='14'>전남</option>
<option value='15'>경북</option>
<option value='16'>경남</option>
<option value='17'>제주</option>
  </select>
 <select name="area2" id='area2' class="style">
 <option selected>-선택-</option>
  </select>
  
  <input type="hidden" id="area11" name="area11" />
   <input type="hidden" id="area22" name="area22" />
  <button onclick="return loading()" id="submit">검색</button>
  </form>
  <script language=javascript>

var cctvCheck=false;
var jaywalkingCheck=false;
var childCheck=false;
var bicycleCheck=false;
var wifiCheck=false;
var pbCheck=false;
 

var cat1_num = new Array(1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17);
var cat1_name = new Array('서울','부산','대구','인천','광주','대전','울산','세종','경기','강원','충북','충남','전북','전남','경북','경남','제주');


var cat2_num = new Array();
var cat2_name = new Array();

cat2_num[1] = new Array(18,19,20,21,22,23,24,25,26,27,28,29,30,31,32,33,34,35,36,37,38,39,40,41,42);
cat2_name[1] = new Array('강남구','강동구','강북구','강서구','관악구','광진구','구로구','금천구','노원구','도봉구','동대문구','동작구','마포구','서대문구','서초구','성동구','성북구','송파구','양천구','영등포구','용산구','은평구','종로구','중구','중랑구');

cat2_num[2] = new Array(43,44,45,46,47,48,49,50,51,52,53,54,55,56,57,58);
cat2_name[2] = new Array('강서구','금정구','기장군','남구','동구','동래구','부산진구','북구','사상구','사하구','서구','수영구','연제구','영도구','중구','해운대구');


cat2_num[3] = new Array(59,60,61,62,63,64,65,66);
cat2_name[3] = new Array('남구','달서구','달성군','동구','북구','서구','수성구','중구');

cat2_num[4] = new Array(67,68,69,70,71,72,73,74,75,76);
cat2_name[4] = new Array('강화군','계양구','남구','남동구','동구','부평구','서구','연수구','옹진군','중구');

cat2_num[5] = new Array(77,78,79,80,81);
cat2_name[5] = new Array('광산구','남구','동구','북구','서구');

cat2_num[6] = new Array(82,83,84,85,86);
cat2_name[6] = new Array('대덕구','동구','서구','유성구','중구');

cat2_num[7] = new Array(87,88,89,90,91);
cat2_name[7] = new Array('남구','동구','북구','울주군','중구');

cat2_num[8] = new Array(92, 92);
cat2_name[8] = new Array('세종특별자치시');
 
cat2_num[9] = new Array(93,94,95,96,97,98,99,100,101,102,103,104,105,106,107,108,109,110,111,112,113,114,115,116,117,118,119,120,121,122,123,124,125,126,127,128,129,130,131,132,133,134);
cat2_name[9] = new Array('가평군','고양시덕양구','고양시 일산동구','고양시 일산서구','과천시','광명시','광주시','구리시','군포시','김포시','남양주시','동두천시','부천시','성남시 분당구','성남시 수정구','성남시 중원구','수원시 권선구','수원시 영통구','수원시 장안구','수원시 팔달구','시흥시','안산시 단원구','안산시 상록구','안성시','안양시 동안구','안양시 만안구','양주시','양평군','여주시','연천군','오산시','용인시 기흥구','용인시 수지구','용인시 처인구','의왕시','의정부시','이천시','파주시','평택시','포천시','하남시','화성시');

cat2_num[10] = new Array(135,136,137,138,139,140,141,142,143,144,145,146,147,148,149,150,151,152);
cat2_name[10] = new Array('강릉시','고성군','동해시','삼척시','속초시','양구군','양양군','영월군','원주시','인제군','정선군','철원군','춘천시','태백시','평창군','홍청군','화천군','횡성군');

cat2_num[11] = new Array(153,154,155,156,157,158,159,160,161,162,163,164,165,166);
cat2_name[11] = new Array('괴산군','단양군','보은군','영동군','옥천군','음성군','제천시','증평군','진천군','청주시 상당구','청주시 서원구','청주시 청원구','청주시 흥덕구','충주시');

cat2_num[12] = new Array(167,168,169,170,171,172,173,174,175,176,177,178,179,180,181,182);
cat2_name[12] = new Array('계룡시','공주시','금산군','논산시','당진시','보령시','부여군','서산시','서천군','아산시','예산군','천안시 동남구','천안시 서북구','청양군','태안군','홍성군');

cat2_num[13] = new Array(183,184,185,186,187,188,189,190,191,192,193,194,195,196,197);
cat2_name[13] = new Array('고창군','군산시','김제시','남원시','무주군','부안군','순창군','완주군','익산시','임실군','장수군','전주시 덕진구','전주시 완산구','정읍시','진안군');

cat2_num[14] = new Array(198,199,200,201,202,203,204,205,206,207,208,209,210,211,212,213,214,215,216,217,218,219);
cat2_name[14] = new Array('강진군','고흥군','곡성군','광양시','구례군','나주시','담양군','목포시','무안군','보성군','순천시','신안군','여수시','영광군','영암군','완도군','장성군','장흥군','진도군','함평군','해남군','화순군');

cat2_num[15] = new Array(220,221,222,223,224,225,226,227,228,229,230,231,232,233,234,235,236,237,238,239,240,241,242,243);
cat2_name[15] = new Array('경산시','경주시','고령군','구미시','군위군','김천시','문경시','봉화군','상주시','성주군','안동시','영덕군','영양군','영주시','영천시','예천군','울릉군','울진군','의성군','청도군','청송군','칠곡군','포항시 남구','포항시 북구');

cat2_num[16] = new Array(244,245,246,247,248,249,250,251,252,253,254,255,256,257,258,259,260,261,262,263,264,265);
cat2_name[16] = new Array('거제시','거창군','고성군','김해시','남해군','밀양시','사천시','산청군','양산시','의령군','진주시','창녕군','창원시 마산합포구','창원시 마산회원구','창원시 성산구','창원시 의창구','창원시 진해구','통영시','하동군','함안군','함양군','합천군');

cat2_num[17] = new Array(266,267);
cat2_name[17] = new Array('서귀포시','제주시');
 
function cat1_change(key,sel){
	
	if(key == '') return;
	var name = cat2_name[key];
	var val = cat2_num[key];

	for(i=sel.length-1; i>=0; i--)
		sel.options[i] = null;
		sel.options[0] = new Option('-선택-','', '', 'true');
	for(i=0; i<name.length; i++){
		sel.options[i+1] = new Option(name[i],val[i]);
	}
	
	var target = document.getElementById("area");
	   var areaName = target.options[target.selectedIndex].text;
	   var t = target.options[target.selectedIndex].text;
	   document.getElementById("area11").value=t;
}

</script>

<input type="checkbox" onchange="cctvMarker(cctvCheck)" name="data" id="c1" value="cctv" >cctv
<input type="checkbox" onchange="bicycleMarker(bicycleCheck)" name="data" id="c2" value="자전거교통사고">자전거 교통사고
<input type="checkbox" onchange="jaywalkingMarker(jaywalkingCheck)" name="data" id="c3" value="무단횡단교통사고" >무단횡단 교통사고
<input type="checkbox" onchange="childMarker(childCheck)" name="data" id="c4" value="어린이교통사고" >어린이 교통사고
<input type="checkbox" onchange="wifiMarker(wifiCheck)" name="data" id="c5" value="wifi" >wifi
<input type="checkbox" onchange="pbMarker(pbCheck)" name="data" id="c6" value="공공시설" >공공시설 <br /> <br />

</center>

<script src="//dapi.kakao.com/v2/maps/sdk.js?appkey=d96dbbd36817062878a321222f6634f1&libraries=services,clusterer,drawing"></script>
<div id="load"><img src="/OMI/images/loading.gif" alt="loading"> </div>
<c:if test="${areaName1==null}">
	<script>
		$('#load').hide();
	</script>
</c:if>
<c:if test="${areaName1=='부산'&&areaName2=='강서구' }">
   <script>
      $('#load').hide();
   </script>
</c:if>

 <div style="position:absolute;left:100px;z-index:10;">
	<table>
		<tr>
			<td id="news_test"></td>
		</tr>
	</table>
 </div>

    <!-- 지도가 표시될 div -->
 <!--    <div class="wrap" style="position:relative"> -->
    <div id="map" style="position:relative;z-index:1;width:600px;height:600px;display: table; margin-left:auto; margin-right:auto;">
    	 <div id="close" title="로드뷰닫기" onclick="closeRoadview()"><span class="img"></span></div>
    	 <div id="roadview" style="position:absolute;z-index:0;width:300px;height:300px;"></div>   	
    </div>
    <!-- 로드뷰를 표시할 div -->

  
<script>
var ps = new daum.maps.services.Places();

var mapContainer = document.getElementById('map'),
mapCenter = new daum.maps.LatLng(33.450422139819736 , 126.5709139924533),// 지도를 표시할 div  
mapOption = { 
    center: new daum.maps.LatLng(37.498004414546934, 127.02770621963765), // 지도의 중심좌표 
    level: 11 // 지도의 확대 레벨
}; 

var map = new daum.maps.Map(mapContainer, mapOption)
	customOverlay = new daum.maps.CustomOverlay({}),
	infowindow = new daum.maps.InfoWindow({removable: true}); // 지도를 생성합니다

var rvContainer = document.getElementById('roadview');	

var polygons=[];       //function 안 쪽에 지역변수로 넣으니깐 폴리곤 하나 생성할 때마다 배열이 비어서 클릭했을 때 전체를 못 없애줌.  그래서 전역변수로 만듦.

//검색된 장소 위치를 기준으로 지도 범위를 재설정하기위해
//LatLngBounds 객체에 좌표를 추가
var bounds = new daum.maps.LatLngBounds();
    
//행정구역 폴리곤 생성과 이벤트를 위한 함수.
function displayArea(coordinates, name) {
 
    var path = [];            //폴리곤 그려줄 path
    var points = [];        //중심좌표 구하기 위한 지역구 좌표들
    
    $.each(coordinates[0], function(index, coordinate) {        //console.log(coordinates)를 확인해보면 보면 [0]번째에 배열이 주로 저장이 됨.  그래서 [0]번째 배열에서 꺼내줌.
        var point = new Object(); 
        point.x = coordinate[1];
        point.y = coordinate[0];
        points.push(point);
        path.push(new daum.maps.LatLng(coordinate[1], coordinate[0]));            //new daum.maps.LatLng가 없으면 인식을 못해서 path 배열에 추가
        
      //폴리곤의 중심좌표를 넣는다.
    	for(var i = 0 ; i < path.length; i++){
    		bounds.extend(path[i]);
    	}
    })
    
    // 다각형을 생성합니다 
    var polygon = new daum.maps.Polygon({
        map : map, // 다각형을 표시할 지도 객체
        path : path,
        strokeWeight : 2,
        strokeColor : '#ff0000',
        strokeOpacity : 0.8,
        fillColor : '#ff0000',
        fillOpacity : 0.03
    });
    polygons.push(polygon);            //폴리곤 제거하기 위한 배열
    
 // 다각형에 mouseover 이벤트를 등록하고 이벤트가 발생하면 폴리곤의 채움색을 변경합니다 
    // 지역명을 표시하는 커스텀오버레이를 지도위에 표시합니다
    daum.maps.event.addListener(polygon, 'mouseover', function(mouseEvent) {
        
        //customOverlay.setPosition(centroid(points));
        customOverlay.setMap(map);
    });
 
    // 다각형에 mousemove 이벤트를 등록하고 이벤트가 발생하면 커스텀 오버레이의 위치를 변경합니다 
    daum.maps.event.addListener(polygon, 'mousemove', function(mouseEvent) {
 
        customOverlay.setPosition(mouseEvent.latLng);
    });
    
    //폴리곤에서 mouseout 이벤트 발생시 customOverlay를 없애는 이벤트
    daum.maps.event.addListener(polygon, 'mouseout', function() {     
        customOverlay.setMap(null);
    });
    
    daum.maps.event.addListener(map, 'tilesloaded', loading);
    function loading(){    	
    	$('#load').hide();	
    }

	
	//검색된 장소 위치를 기준으로 지도 범위를 재설정
	map.setBounds(bounds);

}
    
//폴리곤을 지우기 위한 함수
function deletePolygon(polygons) {
    for (var i = 0; i < polygons.length; i++) {
        polygons[i].setMap(null);
    }
    polygons = [];
}


//행정구역 구분
$.getJSON("/OMI/resources/json/gg3.json", function(geojson) {
 
    var data = geojson.features;
    var coordinates = [];    //좌표 저장할 배열
    var name = '';            //행정 구 이름
    var areacode = '<c:out value="${areacode}" />'    //main에서 검색된 행정동을 저장.
    
    $.each(data, function(index, val) {
	           coordinates = val.geometry.coordinates;
	           name = val.properties.SIG_KOR_NM;
	           
	           if( areacode == val.properties.SIG_CD){
	               displayArea(coordinates, name);
	           }
	 })
})


//여기부터 마커 관련 코드
var clusterer = new daum.maps.MarkerClusterer({
	map: map, // 마커들을 클러스터로 관리하고 표시할 지도 객체 
	gridSize: 60, //클러스터의 격자크기를 지정
	averageCenter: true, // 클러스터에 포함된 마커들의 평균 위치를 클러스터 마커 위치로 설정 
	minLevel: 5 // 클러스터 할 최소 지도 레벨 
});

var geocoder = new daum.maps.services.Geocoder();
var cctvMarkers=[];
var roadMarkers=[];
var childMarkers=[];
var bicycleMarkers=[];
var wifiMarkers=[];
var pbMarkers=[];
//인포메이션 담을 배열입니다
var cctvInfo=[];
var roadInfo=[];
var childInfo=[];
var bicycleInfo=[];
var wifiInfo=[];
var pbInfo=[];



var imageSize = new daum.maps.Size(20, 24), // 마커이미지의 크기입니다
imageOption = {offset: new daum.maps.Point(10, 24)}, // 마커이미지의 옵션입니다. 마커의 좌표와 일치시킬 이미지 안에서의 좌표를 설정합니다.
imageSrc3 = '/OMI/images/marker3.png', // 마커이미지의 주소입니다  
imageSrc2 = '/OMI/images/marker2.png', // 마커이미지의 주소입니다    
imageSrc1 = '/OMI/images/marker1.png',
imageSrc4 = '/OMI/images/cctv.png',
imageSrc5 = '/OMI/images/wifi.png';


var markerImage3 = new daum.maps.MarkerImage(imageSrc3, imageSize, imageOption);
var markerImage2 = new daum.maps.MarkerImage(imageSrc2, imageSize, imageOption);
var markerImage1 = new daum.maps.MarkerImage(imageSrc1, imageSize, imageOption);
var markerImage4 = new daum.maps.MarkerImage(imageSrc4, imageSize, imageOption);
var markerImage5 = new daum.maps.MarkerImage(imageSrc5, imageSize, imageOption);


var rv;// = new daum.maps.Roadview(rvContainer); //로드뷰 객체
var rvClient;// = new daum.maps.RoadviewClient(); //좌표로부터 로드뷰 파노ID를 가져올 로드뷰 helper객체

function wifiMarker(Check) {
	wifiCheck = !Check;
	if(wifiCheck){
		
		//test.omi를 news_test라는 id를 갖고 있는 곳에 불러오는 ajax
		var data = document.getElementById("c5").value;
		 $.ajax({
			type:"post",
			url : "/OMI/OMI/test.omi",
			data : {area11 : "${areaName1}" , area22 : "${areaName2}", data : data },
			success : function(data){
				$("#news_test").html(data);	
			}
		}); 
		
		if(wifiMarkers[0]==null){
		<c:forEach var="f" items="${wifi}">
			rvContainer.style.display='none';
		   var markerPosition  = new daum.maps.LatLng("${f.x}", "${f.y}" ); 
		   var content ="${f.location}";
		   // 마커를 생성합니다
		   var marker = new daum.maps.Marker({
		      position: markerPosition,
		      image : markerImage5
		   });
		   
		   wifiMarkers.push(marker);
		  
		  // 인포윈도우를 생성합니다
		   var infowindow = new daum.maps.InfoWindow({
			   content : content

		   });   
			wifiInfo.push(content);
 
			   // 마커에 이벤트를 등록하는 함수 만들고 즉시 호출하여 클로저를 만듭니다
			   // 클로저를 만들어 주지 않으면 마지막 마커에만 이벤트가 등록됩니다
			   (function(marker, infowindow) {
			       // 마커에 mouseover 이벤트를 등록하고 마우스 오버 시 인포윈도우를 표시합니다 
			       daum.maps.event.addListener(marker, 'mouseover', function() {
			           infowindow.open(map, marker);
			       });

			       // 마커에 mouseout 이벤트를 등록하고 마우스 아웃 시 인포윈도우를 닫습니다
			       daum.maps.event.addListener(marker, 'mouseout', function() {
			           infowindow.close();
			       });
			   })(marker, infowindow);
			
			   //해당 마커의 좌표값을 받아와야하지.
			   //클릭한 마커의 좌표값.
		

		 // wifi 마커 클릭 이벤트 추가	   
		 daum.maps.event.addListener(marker, 'click', toggleRoadview(markerPosition));
		  
		  </c:forEach>
		}
		
		
		 if(wifiMarkers[0]==null){
			 alert('해당 지역에 대한 검색결과가 존재하지 않습니다.');
		 }
		 
		 for(var i=0; i<wifiMarkers.length;i++){
			 wifiMarkers[i].setMap(map); 
		 }
		   
	}else{
		$("#news_test").html('');
		 for (var i = 0; i < wifiMarkers.length; i++) {
			 	rvContainer.style.display='none';
			 	 rvContainer.style.zIndex=0;
			 	document.getElementById('close').style.display = "none";
		        wifiMarkers[i].setMap(null);
		    }   
	}
}

function cctvMarker(Check) {
	cctvCheck = !Check;
	if(cctvCheck){
		var data = document.getElementById("c1").value;
		 $.ajax({
			type:"post",
			url : "test.omi",
			data : {area11 : "${areaName1}" , area22 : "${areaName2}", data : data },
			success : function(data){
				$("#news_test").html(data);	
			}
		}); 
		
		if(cctvMarkers[0]==null){
		<c:forEach var="cc" items="${cc}">
			rvContainer.style.display='none';
		   var markerPosition = new daum.maps.LatLng("${cc.wedo}", "${cc.gyungdo}" ); 
		   var content = "${cc.addr}";   
		   // 마커를 생성합니다
		   var marker = new daum.maps.Marker({
		      position: markerPosition, 
		      image : markerImage4
		   });
		   // 인포윈도우를 생성합니다
		   var infowindow = new daum.maps.InfoWindow({
		       content : content
		   });
		   cctvMarkers.push(marker);
		   cctvInfo.push(content);
	
			   // 마커에 이벤트를 등록하는 함수 만들고 즉시 호출하여 클로저를 만듭니다
			   // 클로저를 만들어 주지 않으면 마지막 마커에만 이벤트가 등록됩니다
			   (function(marker, infowindow) {
			       // 마커에 mouseover 이벤트를 등록하고 마우스 오버 시 인포윈도우를 표시합니다 
			       daum.maps.event.addListener(marker, 'mouseover', function() {
			           infowindow.open(map, marker);
			       });

			       // 마커에 mouseout 이벤트를 등록하고 마우스 아웃 시 인포윈도우를 닫습니다
			       daum.maps.event.addListener(marker, 'mouseout', function() {
			           infowindow.close();
			       });
			   })(marker, infowindow);
			   
			   daum.maps.event.addListener(marker, 'click', toggleRoadview(markerPosition));
		   
		 </c:forEach>
		}
		if(cctvMarkers[0]==null){
			alert('해당 지역에 대한 검색결과가 존재하지 않습니다.');
		}
		for(var i=0; i<cctvMarkers.length;i++){
		   cctvMarkers[i].setMap(map); 
		} 
		   
	}else{
		$("#news_test").html('');
		 for (var i = 0; i < cctvMarkers.length; i++) {
				 rvContainer.style.display='none';
			 	 rvContainer.style.zIndex=0;
			 	document.getElementById('close').style.display = "none";
		        cctvMarkers[i].setMap(null);
		    }   
	}
}

function childMarker(Check) {
	childCheck = !Check;
	if(childCheck){
		var data = document.getElementById("c4").value;
		 $.ajax({
			type:"post",
			url : "test.omi",
			data : {area11 : "${areaName1}" , area22 : "${areaName2}", data : data },
			success : function(data){
				$("#news_test").html(data);	
			}
		}); 
		
		if(childMarkers[0]==null){
		<c:forEach var = "geo" items = "${children}">
		rvContainer.style.display='none';
		var markerPosition  = new daum.maps.LatLng("${geo.p2}", "${geo.p1}" ); 
		var content = "${geo.addr}"; 
		var marker = new daum.maps.Marker({
		      position: markerPosition,
		      image : markerImage2
		   });
		// 인포윈도우를 생성합니다
		   var infowindow = new daum.maps.InfoWindow({
		       content : content
		   });
		childMarkers.push(marker);
		childInfo.push(content);

		
			   // 마커에 이벤트를 등록하는 함수 만들고 즉시 호출하여 클로저를 만듭니다
			   // 클로저를 만들어 주지 않으면 마지막 마커에만 이벤트가 등록됩니다
			   (function(marker, infowindow) {
			       // 마커에 mouseover 이벤트를 등록하고 마우스 오버 시 인포윈도우를 표시합니다 
			       daum.maps.event.addListener(marker, 'mouseover', function() {
			           infowindow.open(map, marker);
			       });

			       // 마커에 mouseout 이벤트를 등록하고 마우스 아웃 시 인포윈도우를 닫습니다
			       daum.maps.event.addListener(marker, 'mouseout', function() {
			           infowindow.close();
			       });
			   })(marker, infowindow);
			
			   daum.maps.event.addListener(marker, 'click', toggleRoadview(markerPosition));
		</c:forEach>
		}
		if(childMarkers[0]==null){
			alert('해당 지역에 대한 검색결과가 존재하지 않습니다.');
		}
		for(var i=0;i<childMarkers.length;i++){
			childMarkers[i].setMap(map);
		}
	}else{
		$("#news_test").html('');
		 for (var i = 0; i < childMarkers.length; i++) {
			 rvContainer.style.display='none';
		 	 rvContainer.style.zIndex=0;
		 	document.getElementById('close').style.display = "none";
		        childMarkers[i].setMap(null);
		    }   
	}
}

function bicycleMarker(Check) {
	bicycleCheck = !Check;
	if(bicycleCheck){
		var data = document.getElementById("c2").value;
		 $.ajax({
			type:"post",
			url : "test.omi",
			data : {area11 : "${areaName1}" , area22 : "${areaName2}", data : data },
			success : function(data){
				$("#news_test").html(data);	
			}
		}); 
		 
		if(bicycleMarkers[0]==null){
		<c:forEach var = "geo" items = "${bicycle}">
		rvContainer.style.display='none';
		var markerPosition  = new daum.maps.LatLng("${geo.p2}", "${geo.p1}" ); 
		var content = "${geo.addr}"; 
		var marker = new daum.maps.Marker({
		      position: markerPosition,
		      image: markerImage3
		   });
		// 인포윈도우를 생성합니다
		   var infowindow = new daum.maps.InfoWindow({
		       content : content
		   });
		bicycleMarkers.push(marker);
		bicycleInfo.push(content);
		
	
			   // 마커에 이벤트를 등록하는 함수 만들고 즉시 호출하여 클로저를 만듭니다
			   // 클로저를 만들어 주지 않으면 마지막 마커에만 이벤트가 등록됩니다
			   (function(marker, infowindow) {
			       // 마커에 mouseover 이벤트를 등록하고 마우스 오버 시 인포윈도우를 표시합니다 
			       daum.maps.event.addListener(marker, 'mouseover', function() {
			           infowindow.open(map, marker);
			       });

			       // 마커에 mouseout 이벤트를 등록하고 마우스 아웃 시 인포윈도우를 닫습니다
			       daum.maps.event.addListener(marker, 'mouseout', function() {
			           infowindow.close();
			       });
			   })(marker, infowindow);
			
			   daum.maps.event.addListener(marker, 'click', toggleRoadview(markerPosition));
			</c:forEach>
		}
		if(bicycleMarkers[0]==null){
			alert('해당 지역에 대한 검색결과가 존재하지 않습니다.');
		}
		for(var i=0;i<bicycleMarkers.length;i++){
			bicycleMarkers[i].setMap(map);
		}
	}else{
		$("#news_test").html('');
		 for (var i = 0; i < bicycleMarkers.length; i++) {
			 rvContainer.style.display='none';
		 	 rvContainer.style.zIndex=0;
		 	document.getElementById('close').style.display = "none";
		        bicycleMarkers[i].setMap(null);
		    }   
	}
}

function jaywalkingMarker(Check) {
	jaywalkingCheck = !Check;
	if(jaywalkingCheck){
		var data = document.getElementById("c3").value;
		 $.ajax({
			type:"post",
			url : "test.omi",
			data : {area11 : "${areaName1}" , area22 : "${areaName2}", data : data },
			success : function(data){
				$("#news_test").html(data);	
			}
		});
		 
		if(roadMarkers[0]==null){
		<c:forEach var = "geo" items = "${road}">
		rvContainer.style.display='none';
		var markerPosition  = new daum.maps.LatLng("${geo.p2}", "${geo.p1}" ); 
		var content = "${geo.addr}";  
		var marker = new daum.maps.Marker({
		      position: markerPosition,
		      image: markerImage1
		   });
		// 인포윈도우를 생성합니다
		   var infowindow = new daum.maps.InfoWindow({
		       content : content
		   });
		roadMarkers.push(marker);
		roadInfo.push(content);
	
			   // 마커에 이벤트를 등록하는 함수 만들고 즉시 호출하여 클로저를 만듭니다
			   // 클로저를 만들어 주지 않으면 마지막 마커에만 이벤트가 등록됩니다
			   (function(marker, infowindow) {
			       // 마커에 mouseover 이벤트를 등록하고 마우스 오버 시 인포윈도우를 표시합니다 
			       daum.maps.event.addListener(marker, 'mouseover', function() {
			           infowindow.open(map, marker);
			       });

			       // 마커에 mouseout 이벤트를 등록하고 마우스 아웃 시 인포윈도우를 닫습니다
			       daum.maps.event.addListener(marker, 'mouseout', function() {
			           infowindow.close();
			       });
			   })(marker, infowindow);
			
			   daum.maps.event.addListener(marker, 'click', toggleRoadview(markerPosition));
		</c:forEach>
		}
		
		if(roadMarkers[0]==null){
			alert('해당 지역에 대한 검색결과가 존재하지 않습니다.');
		}
		for(var i=0; i<roadMarkers.length; i++){
			roadMarkers[i].setMap(map);
		}
	}else{
		$("#news_test").html('');
		 for (var i = 0; i < roadMarkers.length; i++) {
			 rvContainer.style.display='none';
		 	 rvContainer.style.zIndex=0;
		 	document.getElementById('close').style.display = "none";
		        roadMarkers[i].setMap(null);
		    }   
	}
}

function pbMarker(Check){
	pbCheck = !Check;
	if(pbCheck){
		var data = document.getElementById("c6").value; 
		 $.ajax({
			type:"post",
			url : "test.omi",
			data : {area11 : "${areaName1}" , area22 : "${areaName2}", data : data },
			success : function(data){
				$("#news_test").html(data);	
			}
		}); 
		 
		if(pbMarkers[0]==null){
		<c:forEach var = "geo" items="${pb}">
		rvContainer.style.display='none';
		var markerPosition  = new daum.maps.LatLng("${geo.x}", "${geo.y}" ); 
		var content = "${geo.site}";  
		var marker = new daum.maps.Marker({
		      position: markerPosition
		   });
		// 인포윈도우를 생성합니다
		   var infowindow = new daum.maps.InfoWindow({
		       content : content
		   });
		pbMarkers.push(marker);
		pbInfo.push(content);
	
			   // 마커에 이벤트를 등록하는 함수 만들고 즉시 호출하여 클로저를 만듭니다
			   // 클로저를 만들어 주지 않으면 마지막 마커에만 이벤트가 등록됩니다
			   (function(marker, infowindow) {
			       // 마커에 mouseover 이벤트를 등록하고 마우스 오버 시 인포윈도우를 표시합니다 
			       daum.maps.event.addListener(marker, 'mouseover', function() {
			           infowindow.open(map, marker);
			       });

			       // 마커에 mouseout 이벤트를 등록하고 마우스 아웃 시 인포윈도우를 닫습니다
			       daum.maps.event.addListener(marker, 'mouseout', function() {
			           infowindow.close();
			       });
			   })(marker, infowindow);
			   
			   daum.maps.event.addListener(marker, 'click', toggleRoadview(markerPosition));
			
		</c:forEach>
		}
		if(pbMarkers[0]==null){
			alert('해당 지역에 대한 검색결과가 존재하지 않습니다.');
		}
		for(var i=0; i<pbMarkers.length;i++){
			pbMarkers[i].setMap(map);
		}
	}else{
		$("#news_test").html('');
		for(var i = 0; i < pbMarkers.length; i++){
			rvContainer.style.display='none';
		 	 rvContainer.style.zIndex=0;
		 	document.getElementById('close').style.display = "none";
			pbMarkers[i].setMap(null);
		}
	}
}


function toggleRoadview(position2) {
    return function() {
       
       try{
          if(rv == null){
             rv = new daum.maps.Roadview(rvContainer); //로드뷰 객체
          }
          rvClient = new daum.maps.RoadviewClient();
           
           rvClient.getNearestPanoId(position2, 200, function(panoId) {
                 if (panoId === null) {
                     rvContainer.style.display = 'none'; //로드뷰를 넣은 컨테이너를 숨깁니다
                     rvContainer.style.zIndex=0;
                     document.getElementById('close').style.display = "none";
                     map.relayout();
                 } else {
                     map.relayout(); //지도를 감싸고 있는 영역이 변경됨에 따라, 지도를 재배열합니다
                     rvContainer.style.display = 'block'; //로드뷰를 넣은 컨테이너를 보이게합니다
                     rvContainer.style.zIndex=2;
                     document.getElementById('close').style.display = "block";
                     rv.setPanoId(panoId, position2); //panoId를 통한 로드뷰 실행
                     rv.relayout(); //로드뷰를 감싸고 있는 영역이 변경됨에 따라, 로드뷰를 재배열합니다
                 }
             });
      }catch(e){
            window.location="http://get.adobe.com/flashplayer";
      }
   
    };
}

function closeRoadview() {
	rvContainer.style.display='none';
 	document.getElementById('close').style.display = "none";
 	rv = daum.maps.Roadview(rvContainer);
}

</script>

</body>