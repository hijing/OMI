<%@ page contentType = "text/html; charset=euc-kr" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<html>
<head>
<title>�Խ���</title>
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
@font-face {font-family:����;}
body,td,a,div,p,pre,input,textarea {font-family:����;font-size:9pt;}
-->
</style>
</head>

<body bgcolor="${bodyback_c}">

<script src="//dapi.kakao.com/v2/maps/sdk.js?appkey=d96dbbd36817062878a321222f6634f1"></script>

<center><b>�۳��� ����</b>
<br>
<form>
<table width="500" border="1" cellspacing="0" cellpadding="0" align="center" class="tcontent">  
  <tr height="30">
    <td align="center" width="125" bgcolor="${value_c}" class="tBack">�۹�ȣ</td>
    <td align="center" width="125">${article.num}</td>
    <td align="center" width="125" bgcolor="${value_c}" class="tBack">��ȸ��</td>
    <td align="center" width="125">${article.readcount}</td>
  </tr>
  <tr height="30">
    <td align="center" width="125" bgcolor="${value_c}" class="tBack">�ۼ���</td>
    <td align="center" width="125">${article.writer}</td>
    <td align="center" width="125" bgcolor="${value_c}" class="tBack">�ۼ���</td>
    <td align="center" width="125">${article.reg_date}</td>
  </tr>
  <tr height="30">
    <td align="center" width="125" bgcolor="${value_c}" class="tBack">������</td>
    <td align="center" colspan="3">${article.subject}</td>
  </tr>
  <tr height="30">
    <td align="center" width="125" bgcolor="${value_c}" class="tBack">������</td>
    <td align="center" colspan="3">${article.data}</td>
  </tr>
  <tr height="30">
    <td align="center" width="125" bgcolor="${value_c}" class="tBack">��ġ</td>
    <td align="center" colspan="3">${article.local}</td>
  </tr>
  <tr height="30">
    <td align="center" width="125" bgcolor="${value_c}" class="tBack">���� �浵</td>
    <td align="center" colspan="3">���� : ${article.x}  �浵 : ${article.y }</td>
  </tr>
  <tr>
	<td colspan=4 height=400>
		<div id="map" style="width:100%;height:100%;"></div>
		<!-- ��ü ������ ������ ���� ����. �ҷ���, ����.(***��ü ������ ���� ���� ��� ��.) -->
	</td>
  </tr>

  <tr>
    <td align="center" width="125" bgcolor="${value_c}" class="tBack">�۳���</td>
    <td align="left" width="375" colspan="3"><pre>${article.content}</pre></td>
  </tr>
  <tr height="30">      
    <td colspan="4" bgcolor="${value_c}" align="right" > 
    
    <c:if test="${sessionScope.memId == 1014030732 }">
		<input type="button" value="�߰� & ����" onclick="document.location.href='dataInsertForm.omi?num=${article.num}&pageNum=${pageNum}'">
		&nbsp;&nbsp;&nbsp;&nbsp;
		<input type="button" value="�ۻ���"  onclick="document.location.href='deleteForm.omi?num=${article.num}&pageNum=${pageNum}'">
	    &nbsp;&nbsp;&nbsp;&nbsp;
	</c:if>
    
    <c:if test="${sessionScope.memId == article.id}">
	  <input type="button" value="�ۼ���" 
       onclick="document.location.href='updateForm.omi?num=${article.num}&pageNum=${pageNum}'">
	   &nbsp;&nbsp;&nbsp;&nbsp;
	  <input type="button" value="�ۻ���" 
       onclick="document.location.href='deleteForm.omi?num=${article.num}&pageNum=${pageNum}'">
	   &nbsp;&nbsp;&nbsp;&nbsp;
	</c:if>
	
       <input type="button" value="�۸��" 
       onclick="document.location.href='list.omi?pageNum=${pageNum}'">
    </td>
  </tr>
</table>    
</form>   

<script>
	var mapContainer = document.getElementById('map'), // ������ ǥ���� div
    mapOption = {
        center: new daum.maps.LatLng(${article.x}, ${article.y}), // ������ �߽���ǥ
		level: 2 // ������ Ȯ�� ����
    };

	//������ �̸� ����
	var map = new daum.maps.Map(mapContainer, mapOption);
	//��Ŀ�� �̸� ����
	var marker = new daum.maps.Marker({
	    position: new daum.maps.LatLng(${article.x}, ${article.y}),
	    map: map
	});
	// �ش� �ּҿ� ���� ��ǥ�� �޾Ƽ�
    var coords = new daum.maps.LatLng(${article.x}, ${article.y}); 
    // ������ �����ش�.
    mapContainer.style.display = "block";
    map.relayout();
    // ���� �߽��� �����Ѵ�.
    map.setCenter(coords);
    // ��Ŀ�� ��������� ���� ��ġ�� �ű��.
    marker.setPosition(coords);
	</script>	
   
</body>
</html>      
