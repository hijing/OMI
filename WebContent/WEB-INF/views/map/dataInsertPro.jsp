<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:if test="${check==1}">
	<script>
		alert("추가 되었습니다.");
	</script> 
	<meta http-equiv="Refresh" content="0;url=list.omi?pageNum=${pageNum}" >
</c:if>

<c:if test="${check==0}"> 
	<script>
	alert("추가 실패.");
	location.href="javascript:history.go(-1)"
	</script>
</c:if>

<c:if test="${check==2 }">
<script>
	alert("이미 추가한 데이터입니다.");
	location.href="list.omi?pageNum=${pageNum }"
	</script>
</c:if>