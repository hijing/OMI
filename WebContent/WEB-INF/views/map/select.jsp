<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<head>
<script src="//code.jquery.com/jquery-latest.min.js"></script>
</head>

<body>
<script>
window.onload = (function() {
	$('#load').hide();
});

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
	$('#load').show();	
	return true;
}
</script>
<div id="load">
	<img src="/OMI/images/loading.gif" alt="loading"> </div>
<div id="searchText1">원하는</div> <div id="searchText2">지역</div><div id="searchText1">을 검색해보세요! </div><br /><br />
<div id="searchText3">교통사고 다발지역, CCTV, 공공시설, 무료 wifi의 위치에 대한 정보를 얻을 수 있습니다.</div>	<br /> <br /><br />
 <form action="map.omi" name="form1" onsubmit='return loading()'>
  <select name="area1" onChange="cat1_change(this.value,area2)" class="style">
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
 <select name="area2" class="style">
 <option selected>-선택-</option>
  </select>
  
  <input type="submit" value="검색" id="submit">
  </form>
<script language=javascript>

 

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

 cat2_num[8] = new Array(92,92);
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
}

</script>
</body>

