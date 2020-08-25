<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form"
uri="http://www.springframework.org/tags/form" %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-type" content="text/html; charset=UTF-8">
<title>** 로그인 **</title>
</head>
<body>
<h2>** 로그인 **</h2>
<form:form action="/ProtoType/member/login.do" method="post"
	modelAttribute="login">
	ID : <form:textarea name="id" path="id" rows="1" cols="20"/><br/>
	<p style="color:red; font-weight:bold">
		<form:errors path="id"/>
	</p>
	PW : <form:input type="password" name="password" path="password"/><br/>
	<p style="color:red; font-weight:bold">
		<form:errors path="password"/>
	</p>
	<c:if test="${error}==1">
	<p style="color:red; font-weight:bold">
		아이디 혹은 비밀번호가 잘못되었습니다.
	</p>
	</c:if>
	<input type="submit" value="로그인">
	<a href="/ProtoType/member/regi">회원 등록</a><br/>
	<a href="/ProtoType/">돌아가기</a>
</form:form>
</body>
</html>