<%@ page contentType = "text/html; charset=euc-kr" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<html>
<head>
<title>�Խ���</title>
<link href="style.css" rel="stylesheet" type="text/css">
<script language="JavaScript" src="script.js"></script>
</head>

<body bgcolor="${bodyback_c}">

<script src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script>
<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=d96dbbd36817062878a321222f6634f1&libraries=services"></script>

<script type='text/javascript'>
	function writeSave(){
		if(document.writeform.data.value == ''){
			alert("���û��� �ʼ�!");
			document.writeform.data.focus();
			return false;
		}
	}
</script>

<center><b>�ۼ���</b>
<br>
<form method="post" name="writeform" action="updatePro.omi?pageNum=${pageNum}" onsubmit="return writeSave()">
<table border="1" cellspacing="0" cellpadding="0" align="center" class="tcontent">
  <tr>
    <td  width="90"  bgcolor="${value_c}" align="center" class="tBack">�� ��</td>
    <td align="left" width="330">
       ${article.writer}
       <input type="hidden" name="id" value="${article.id }">
	   <input type="hidden" name="num" value="${article.num}"></td>
  </tr>
  <tr>
    <td  width="90"  bgcolor="${value_c}" align="center" class="tBack">�� ��</td>
    <td align="left" width="330">
       <input type="text" size="40" maxlength="50" name="subject" value="${article.subject}"></td>
  </tr>
  <tr>
  	<td width="90" align="center" class="tBack">* ���û���</td>
  	<td width="330">
  		<select name="data">
  		<option selected>-������ ����-</option>
  		<option value="cctv">cctv</option>
  		<option value="�����ü�">�����ü�</option>
  		<option value="wifi">���� wifi</option>
  		</select>
  	</td>
  </tr>
  <tr>
    <td width="90" align="center" class="tBack">���</td>
    <td>
     <input type="text" id="sample5_address" placeholder="�ּҸ� �˻��ϰų� ������ Ŭ�����ּ���." name="local" readonly="true" value="${article.local }" size=50>
	 <input type="button" onclick="sample5_execDaumPostcode()" value="�ּ� �˻�"><br>
	 </td>
  </tr>
  <tr>
  	<td colspan=2 height=350>
  		<div id="map" style="width:100%;height:350px;"></div>
  		<div id="clickLatlng"></div>
  	</td>
  </tr>
  <tr>
    <td  width="90"  bgcolor="${value_c}" align="center" class="tBack">�� ��</td>
    <td align="left" width="330">
     <textarea name="content" style="width:100%;resize:none" rows=10>${article.content}</textarea></td>
  </tr>
  <tr>      
	<td colspan=2  align="center"> 
	���� : <input type="text" readonly="true" name="x" value="${article.x }">
	�浵 : <input type="text" readonly="true" name="y" value="${article.y }">
	</td>
</tr>
  <tr>      
   <td colspan=2 bgcolor="${value_c}" align="center"> 
     <input type="submit" value="�ۼ���" >  
     <input type="reset" value="�ٽ��ۼ�">
     <input type="button" value="��Ϻ���" 
       onclick="document.location.href='list.omi?pageNum=${pageNum}'">
   </td>
 </tr>
 </table>
</form>

<script>
		var mapContainer = document.getElementById('map'), // ������ ǥ���� div
		mapOption = {
		    center: new daum.maps.LatLng(${article.x}, ${article.y}), // ������ �߽���ǥ
		    level: 3 // ������ Ȯ�� ����
		};
		
		//������ �̸� ����
		var map = new daum.maps.Map(mapContainer, mapOption);
		//�ּ�-��ǥ ��ȯ ��ü�� ����
		var geocoder = new daum.maps.services.Geocoder();
		//��Ŀ�� �̸� ����
		var marker = new daum.maps.Marker({
		position: map.getCenter(),
		map: map
		});
		
		var infowindow = new daum.maps.InfoWindow({zindex:1}); // Ŭ���� ��ġ�� ���� �ּҸ� ǥ���� �����������Դϴ�
		
		
		// ������ Ŭ�� �̺�Ʈ�� ����մϴ�
		// ������ Ŭ���ϸ� ������ �Ķ���ͷ� �Ѿ�� �Լ��� ȣ���մϴ�
		daum.maps.event.addListener(map, 'click', function(mouseEvent) {
		    
		    // Ŭ���� ����, �浵 ������ �����ɴϴ� 
		    var latlng = mouseEvent.latLng; 
		    
		    // ��Ŀ ��ġ�� Ŭ���� ��ġ�� �ű�ϴ�
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
		        // �� �ּ��� ���� ��Ģ�� ���� �ּҸ� �����Ѵ�.
		        // �������� ������ ���� ���� ��쿣 ����('')���� �����Ƿ�, �̸� �����Ͽ� �б� �Ѵ�.
		        var fullAddr = data.address; // ���� �ּ� ����
		        var extraAddr = ''; // ������ �ּ� ����
		
		        // �⺻ �ּҰ� ���θ� Ÿ���϶� �����Ѵ�.
		        if(data.addressType === 'R'){
		            //���������� ���� ��� �߰��Ѵ�.
		            if(data.bname !== ''){
		                extraAddr += data.bname;
		            }
		            // �ǹ����� ���� ��� �߰��Ѵ�.
		            if(data.buildingName !== ''){
		                extraAddr += (extraAddr !== '' ? ', ' + data.buildingName : data.buildingName);
		            }
		            // �������ּ��� ������ ���� ���ʿ� ��ȣ�� �߰��Ͽ� ���� �ּҸ� �����.
		            fullAddr += (extraAddr !== '' ? ' ('+ extraAddr +')' : '');
		        }
		
		        // �ּ� ������ �ش� �ʵ忡 �ִ´�.
		        document.getElementById("sample5_address").value = fullAddr;
		        // �ּҷ� �� ������ �˻�
		        geocoder.addressSearch(data.address, function(results, status) {
		            // ���������� �˻��� �Ϸ������
		            if (status === daum.maps.services.Status.OK) {
		
		                var result = results[0]; //ù��° ����� ���� Ȱ��
		
		                // �ش� �ּҿ� ���� ��ǥ�� �޾Ƽ�
		                var coords = new daum.maps.LatLng(result.y, result.x);
		                document.writeform.x.value=result.x;
		                document.writeform.y.value=result.y;
		                // ������ �����ش�.
		                mapContainer.style.display = "block";
		                map.relayout();
		                // ���� �߽��� �����Ѵ�.
		                map.setCenter(coords);
		                // ��Ŀ�� ��������� ���� ��ġ�� �ű��.
		                marker.setPosition(coords)
		            }
		        });
		    }
		}).open();
		}
		
		// ������ Ŭ������ �� Ŭ�� ��ġ ��ǥ�� ���� �ּ������� ǥ���ϵ��� �̺�Ʈ�� ����մϴ�
		daum.maps.event.addListener(map, 'click', function(mouseEvent) {
		    searchDetailAddrFromCoords(mouseEvent.latLng, function(result, status) {
		        if (status === daum.maps.services.Status.OK) {
		            /* var detailAddr = !!result[0].road_address ? '<div>���θ��ּ� : ' + result[0].road_address.address_name + '</div>' : '';
		            detailAddr += '<div>���� �ּ� : ' + result[0].address.address_name + '</div>';
		            
		            var content = '<div class="bAddr">' +
		                            '<span class="title">������ �ּ�����</span>' + 
		                            detailAddr + 
		                        '</div>'; */

                    document.getElementById("sample5_address").value = result[0].address.address_name;
		            // ��Ŀ�� Ŭ���� ��ġ�� ǥ���մϴ� 
		            marker.setPosition(mouseEvent.latLng);
		            marker.setMap(map);

		        }   
		    });
		});

		function searchAddrFromCoords(coords, callback) {
		    // ��ǥ�� ������ �ּ� ������ ��û�մϴ�
		    geocoder.coord2RegionCode(coords.getLng(), coords.getLat(), callback);         
		}

		function searchDetailAddrFromCoords(coords, callback) {
		    // ��ǥ�� ������ �� �ּ� ������ ��û�մϴ�
		    geocoder.coord2Address(coords.getLng(), coords.getLat(), callback);
		}

</script>

</body>
</html>      
