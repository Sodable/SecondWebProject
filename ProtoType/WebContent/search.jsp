<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>** 고객 검색 **</title>
</head>
<body>
<h2>** 고객 검색 **</h2>
<form action="/TestMVC03/customerSearch.do" method="post">
	ID : <input type="text" name="id"><br/>
	<input type="submit" value="검색">
	<input type="reset" value="리셋">
	<a href="/TestMVC03/index.html">돌아가기</a>
</form>
</body>
</html>