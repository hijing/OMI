<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<title>OMI</title>
<link rel="stylesheet" href="/OMI/css/omi.css" >
</head>
<body>
<center>
    <table width="100%">
    	<tr>
    		<td height="200" align="center">
    			<jsp:include page="top.jsp" flush="false"/>
    		</td>    	
    	</tr>
    	<tr>
    		<td align="center">
    			<jsp:include page="menu.jsp" flush="false" />
    		</td>
    	</tr>
    	<c:if test="${main!='map.jsp'}">
    	<tr>
    		<td height="300" align="center"> 
    		<br /><br />
    		<jsp:include page="${main}" flush="false"/>
    		</td>
    	</tr>
    	</c:if>
    	<c:if test="${main=='map.jsp'}">
    	<tr>
    		<td height="300">
    		<br /><br />
    		<jsp:include page="${main}" flush="false" />
    		</td>
    	</tr>
    	</c:if>
    	<tr>
    		<td height="200" align="center">
    			<jsp:include page="bottom.jsp" flush="false" />
    		</td>
    	</tr>
    </table>
</center>
</body>
</html>