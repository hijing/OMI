<%@ page contentType = "text/html; charset=euc-kr" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<c:if test="${check==1}"> 
	<meta http-equiv="Refresh" content="0;url=list.omi?pageNum=${pageNum}" >
</c:if>
<c:if test="${check==0}">
<script> 
alert("다른 회원의 글은 삭제가 불가능 합니다.");
location.href="javascript:history.go(-1)"
</script>
</c:if>