<%@ page contentType = "text/html; charset=euc-kr" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<c:if test="${check==1}"> 
	<meta http-equiv="Refresh" content="0;url=list.omi?pageNum=${pageNum}" >
</c:if>
<c:if test="${check==0}">
<script> 
alert("�ٸ� ȸ���� ���� ������ �Ұ��� �մϴ�.");
location.href="javascript:history.go(-1)"
</script>
</c:if>