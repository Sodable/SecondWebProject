<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>** 로그인 **</title>
</head>
<body>
<h2>** 로그인 **</h2>
<form action="/ProtoType/member/login.do" method="post">
	ID : <input type="text" name="id"><br/>
	PW : <input type="password" name="password"><br/>
	<input type="submit" value="로그인">
	<a href="/ProtoType/view/home/insert.jsp">회원 등록</a><br/>
	<a href="/ProtoType/">돌아가기</a>
</form>
</body>
</html>