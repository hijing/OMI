<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<center>
   <table class="bluetop">
	   <tr>
	   		<th align="center">naver news</th>
	   </tr>
      <c:forEach var="news" items="${val}" varStatus="status">
         <tr>
            <td>
            <a href="javascript:void(window.open('${hr[status.index]}', '_blank'))" class="tText">${news}</a><br>
            </td>
         </tr>
      </c:forEach>
   </table>
</center>
</body>
</html>