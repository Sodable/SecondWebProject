<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>**관리자 페이지**</title>
<%
String loginid =(String) (session.getAttribute("id")==null ? "null" : session.getAttribute("id"));
String loginnickname =(String) (session.getAttribute("nickname")==null ? "null" : session.getAttribute("nickname"));
%>
</head>
<body>
<%if(!loginid.equals("master")){ %>
	<c:redirect url="/"/>
<%} %>
<h1>**관리자 페이지**</h1>
<p>	로그인 id : <%=loginid%><br>
	로그인 nickname : <%=loginnickname%></p>
<hr>
<a href="/ProtoType/master/memberlist?pagenum=1">회원 목록</a><br><br>

<!-- 회원 검색 -->
<form action="/ProtoType/master/membersearch" method="post">
<input type="text" name="id"/>
<input type="submit" value="회원 검색"/>
</form>
<hr>
<a href="/ProtoType/master/memberanaly?pagenum=1">접속자 보기</a>
<hr>
<a href="/ProtoType/master/freelist?pagenum=1">자유 게시판 관리</a>
<hr>
<a href="/ProtoType/master/photolist?pagenum=1">사진 게시판 관리</a>

</body>
</html>