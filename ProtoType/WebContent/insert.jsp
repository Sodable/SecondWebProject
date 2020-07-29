<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-type" content="text/html; charset=UTF-8">
<title>** 회원 등록 **</title>
</head>
<body>
	<h3>** 회원 정보를 입력하세요 **</h3>
	<!-- servlet에서 *.do로 url 맵핑, Controller로 이동한다. -->
	<form action="/ProtoType/memberInsert.do" method="post">
		아이디 : <input type="text" name="id"><br /> 
		패스워드 : <input type="password" name="password"><br /> 
		이름 : <input type="text" name="name"><br /> 
		전화번호 : <input type="text" name="tel"><br /> 
		이메일 : <input type="text" name="email"><br /> 
		<input type="submit" value="등록"> 
		<input type="reset" value="재작성">
	</form>
	<a href="/ProtoType/index.jsp">돌아가기</a>
</body>
</html>