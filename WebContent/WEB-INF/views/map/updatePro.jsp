<%@ page contentType = "text/html; charset=euc-kr" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<c:if test="${check==1}"> 
	<meta http-equiv="Refresh" content="0;url=list.omi?pageNum=${pageNum}" >
</c:if>
<c:if test="${check==0}"> 
alert("다른 회원의 글은 수정이 불가능합니다.");
<br>
<a href="javascript:history.go(-1)">[글수정 폼으로 돌아가기]</a>
</c:if>