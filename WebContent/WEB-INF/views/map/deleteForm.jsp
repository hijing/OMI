<%@ page contentType = "text/html; charset=euc-kr" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<html>
<head>
<title>�Խ���</title>
<link href="style.css" rel="stylesheet" type="text/css">

<script language="JavaScript">      
<!--      
  function deleteSave(){	
	if(document.delForm.passwd.value==''){
	alert("��й�ȣ�� �Է��Ͻʽÿ�.");
	document.delForm.passwd.focus();
	return false;
 }
}    
// -->      
</script>
</head>

<body bgcolor="${bodyback_c}">
<center><b>�ۻ���</b>
<br>
<form method="POST" name="delForm"  action="deletePro.omi?pageNum=${pageNum}" 
   onsubmit="return deleteSave()"> 
 <table border="1" align="center" cellspacing="0" cellpadding="0" width="360" class="tcontent">
  <tr height="30">
     <td align=center  bgcolor="${value_c}" class="tBack">
       <b>���� �Ͻðڽ��ϱ�?</b></td>
  </tr>
  <input type="hidden" name="id" value="${memId }">
  <input type="hidden" name="num" value="${num}">
 <tr height="30">
    <td align=center bgcolor="${value_c}">
      <input type="submit" value="�ۻ���" >
      <input type="button" value="�۸��" 
       onclick="document.location.href='list.omi?pageNum=${pageNum}'">     
   </td>
 </tr>  
</table> 
</form>
</body>
</html> 
