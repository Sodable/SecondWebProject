<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.*" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<title>**관리자 페이지**</title>
</head>
<body>
<h2>**회원 목록**</h2>
<hr>
<%
String loginid =(String) (session.getAttribute("id")==null ? "null" : session.getAttribute("id"));
String loginnickname =(String) (session.getAttribute("nickname")==null ? "null" : session.getAttribute("nickname"));
%>
<p>	로그인 id : <%=loginid%><br>
	로그인 nickname : <%=loginnickname%></p>
<c:if test="${!empty member }">
<table border="1">
 <tr>
	<th>ID</th>
	<th>NAME</th> 
	<th>TEL</th> 
	<th>EMAIL</th> 
	<th>NICKNAME</th> 
	<th>GENDER</th> 
	<th>AGE</th> 
	<th>LOCALE</th> 
	<th>JOB</th> 
	<th>JOB_LOCALE</th> 
	<th>삭제</th>
 </tr>
		<tr>
			<td>${member.id}</td>
			<td>${member.name}</td>
			<td>${member.tel}</td>
			<td>${member.email}</td>
			<td>${member.nickname}</td>
			<td>${member.gender}</td>
			<td>${member.age}</td>
			<td>${member.locale}</td>
			<td>${member.job}</td>
			<td>${member.job_locale}</td>
			<td><a href="/ProtoType/master/memberdelete?id=${member.id}">삭제</a></td>
		</tr>
</table>
</c:if>
<c:if test="${empty member }">
	검색 결과	가 없습니다.
</c:if>
	<a href="/ProtoType/master/main">돌아가기</a>

</body>
</html>