<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-type" content="text/html; charset=UTF-8">
<title>** 회원 정보 추가 등록 **</title>
</head>
<body>
	<h3>** 추가 회원 정보를 입력하세요 **</h3>
<%
String loginid =(String) (session.getAttribute("id")==null ? "null" : session.getAttribute("id"));
String loginnickname =(String) (session.getAttribute("nickname")==null ? "null" : session.getAttribute("nickname"));
%>
<p>	로그인 id : <%=loginid%><br>
	로그인 nickname : <%=loginnickname%></p>
	<form action="/ProtoType/member/regimore.do" method="post">
		아이디 : <input type="text" name="id" value="<%=loginid%>" readonly="readonly"/><br /> 
		닉네임 : <input type="text" name="nickname"/><br/>		
		성별 : <input type="radio" name="gender" value="남"/>남
		<input type="radio" name="gender" value="여"/>여<br/>		
		나이 : <input type="number" name="age"/><br/>		
		직업 : <input type="text" name="job"/><br/>		
		<input type="submit" value="등록"> 
		<input type="reset" value="재작성">
	</form>
	<a href="/ProtoType/">돌아가기</a>
</body>
</html>