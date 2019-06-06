<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<html>
<head>
<title>게시판</title>

</head>

<body>
<center><b class="tText2">데이터 추가 목록(전체 글:${count})</b>
<table width="700">
  <tr>
    <td align="right">
       <a href="writeForm.omi" class="tText2">글쓰기</a>
    </td>
  </tr>
</table>

<c:if test="${count == 0}">
<table width="700" border="1" cellpadding="0" cellspacing="0">
  <tr>
    <td align="center">
      게시판에 저장된 글이 없습니다.
    </td>
  </tr>
</table>
</c:if>

<c:if test="${count > 0}">
<table border="0" width="700" cellpadding="0" cellspacing="0" align="center" class="bluetop"> 
    <tr height="30" > 
      <th align="center"  width="50" >번 호</th> 
      <th align="center"  width="250" >제   목</th> 
      <th align="center"  width="100" >작성자</th>
      <th align="center"  width="150" >작성일</th> 
      <th align="center"  width="50" >조 회</th>    
    </tr>

   <c:forEach var="article" items="${articleList}">
   <tr height="30">
    <td align="center"  width="50" class="tText2">
	  <c:out value="${number}"/>
	  <c:set var="number" value="${number - 1}"/>
	</td>
    <td  width="250" class="tText2">
      <a href="content.omi?num=${article.num}&pageNum=${currentPage}" class="tText">
      <c:if test="${article.count == 1}">
         	[추가완료]
      </c:if>
          ${article.subject}</a>
	</td>
    <td align="center"  width="100" class="tText2"> 
       ${article.writer}
	</td>
    <td align="center"  width="150" class="tText2">${article.reg_date}</td>
    <td align="center"  width="50" class="tText2">${article.readcount}</td>
  </tr>
  </c:forEach>
</table>
</c:if>

<c:if test="${count > 0}">
   <c:set var="pageCount" value="${count / pageSize + ( count % pageSize == 0 ? 0 : 1)}"/>
   <c:set var="pageBlock" value="${10}"/>
   <fmt:parseNumber var="result" value="${currentPage / 10}" integerOnly="true" />
   <c:set var="startPage" value="${result * 10 + 1}" />
   <c:set var="endPage" value="${startPage + pageBlock-1}"/>
   <c:if test="${endPage > pageCount}">
        <c:set var="endPage" value="${pageCount}"/>
   </c:if> 
          
   <c:if test="${startPage > 10}">
        <a href="list.omi?pageNum=${startPage - 10 }" class="tText">[이전]</a>
   </c:if>

   <c:forEach var="i" begin="${startPage}" end="${endPage}">
       <a href="list.omi?pageNum=${i}" class="tText2">[${i}]</a>
   </c:forEach>

   <c:if test="${endPage < pageCount}">
        <a href="list.omi?pageNum=${startPage + 10}" class="tText">[다음]</a>
   </c:if>
</c:if>

</center>
</body>
</html>