<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-type" content="text/html; charset=UTF-8">
<title>** 마이페이지 메인 ** </title>
</head>
<body>
<h1>** 마이페이지 메인 **</h1>
		<%
		String loginid =(String) (session.getAttribute("id")==null ? "null" : session.getAttribute("id"));
		String loginnickname =(String) (session.getAttribute("nickname")==null ? "null" : session.getAttribute("nickname"));
		%>
	<p>	로그인 id : <%=loginid%><br>
		로그인 nickname : <%=loginnickname%></p>
	<a href="/ProtoType/member/regimore">추가 정보 등록</a>
	<a href="/ProtoType/member/regiloc">지역 정보 등록</a>
<a href="">지역 정보 보기 및 사용 설정</a>

</body>
</html>