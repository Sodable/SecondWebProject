<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.*,customer.vo.*" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-type" content="text/html; charset=UTF-8">
<title>** 고객 리스트 **</title>
</head>
<body>
<h2>** 고객 리스트 **</h2>
<hr>
<c:if test="${!empty list }">
<table border="1">
 <tr>
	<th>ID</th><th>NAME</th> 
 </tr>
<% List<CustomerVO> list = (List<CustomerVO>) request.getAttribute("list"); 
for(CustomerVO vo : list){%>
	<tr>
		<td><%=vo.getId()%></td>
		<td><%=vo.getName()%></td>
	</tr>
<%} %>
</table>
</c:if>
<c:if test="${empty list }">
	검색 결과가 없습니다.
</c:if>
	<a href="/TestMVC03/index.html">돌아가기</a>

</body>
</html>