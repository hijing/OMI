<%@ page contentType = "text/html; charset=euc-kr" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<html>
<head>
<title>게시판</title>
<link href="style.css" rel="stylesheet" type="text/css">

<script language="JavaScript">      
<!--      
  function deleteSave(){	
	if(document.delForm.passwd.value==''){
	alert("비밀번호를 입력하십시요.");
	document.delForm.passwd.focus();
	return false;
 }
}    
// -->      
</script>
</head>

<body bgcolor="${bodyback_c}">
<center><b>글삭제</b>
<br>
<form method="POST" name="delForm"  action="deletePro.omi?pageNum=${pageNum}" 
   onsubmit="return deleteSave()"> 
 <table border="1" align="center" cellspacing="0" cellpadding="0" width="360" class="tcontent">
  <tr height="30">
     <td align=center  bgcolor="${value_c}" class="tBack">
       <b>삭제 하시겠습니까?</b></td>
  </tr>
  <input type="hidden" name="id" value="${memId }">
  <input type="hidden" name="num" value="${num}">
 <tr height="30">
    <td align=center bgcolor="${value_c}">
      <input type="submit" value="글삭제" >
      <input type="button" value="글목록" 
       onclick="document.location.href='list.omi?pageNum=${pageNum}'">     
   </td>
 </tr>  
</table> 
</form>
</body>
</html> 
