<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-type" content="text/html; charset=UTF-8">
<title>**자유게시판**</title>
</head>
<body>
<h1> ** 자유 게시판 글 작성**</h1>
<%
String loginid =(String) (session.getAttribute("id")==null ? "null" : session.getAttribute("id"));
String loginnickname =(String) (session.getAttribute("nickname")==null ? "null" : session.getAttribute("nickname"));
%>
<p>	로그인 id : <%=loginid%><br>
	로그인 nickname : <%=loginnickname%></p>
<hr>
<form action="/ProtoType/freeboard/write.do" method="post">
<label>글 머리</label>
<select name="fb_weather" >
<option>날씨 선택</option>
<option>맑음</option>
<option>흐림</option>
<option>비</option>
<option>눈</option>
<option>우박</option>
<option>낙뢰</option>
<option>안개</option>
<%if((loginid!=null)&&(loginid.equals("master"))) {%>
<option>공지 사항</option>
<%} %>
</select><br/>
<label>제목</label>
<input type="text" name="title" min="1" style="width: 500px "/><br>
<label>내용</label><br>
<textarea cols="100" rows="10" name="body"></textarea><br/>
<input type="text" value="<%=loginid%>" name="id" hidden="true"/>
<input type="submit" value="글 쓰기">
</form>
<a href="/ProtoType/freeboard/view?pagenum=1">자유게시판으로 돌아가기</a>
</body>
</html>