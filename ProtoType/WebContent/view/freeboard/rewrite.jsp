<%@page import="DWM.vo.FreeBoardVO"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-type" content="text/html; charset=UTF-8">
<title>**자유게시판**</title>
		<%String loginid =(String) session.getAttribute("id");%>
	<p>
		로그인 id :
		<%=loginid%></p>
<% List<FreeBoardVO> viewbody = (List<FreeBoardVO>) request.getAttribute("viewbody"); %>
</head>
<body>
<h1> ** 자유 게시판 **</h1>
<hr>
<form action="/ProtoType/freeboard/rewrite.do" method="post">
<label>글 머리</label>
<!-- <select name="category" >
<option>카테고리 선택</option>
<option>공지사항</option>
<option>잡담</option>
<option>등등..</option>
</select> -->
<select name="fb_weather" >
<option>날씨 선택</option>
<option>맑음</option>
<option>흐림</option>
<option>비</option>
<option>눈</option>
<option>우박</option>
<option>낙뢰</option>
<option>안개</option>
</select><br/>
<label>제목</label>
<input type="text" name="title" min="1" style="width: 500px " value="<%=viewbody.get(0).getTitle() %>"/><br>
<label>내용</label><br>
<textarea cols="100" rows="10" name="body"><%=viewbody.get(0).getBody() %></textarea><br/>
<input type="text" value="<%=viewbody.get(0).getId() %>" name="id" hidden="true"/>
<input type="text" value="<%=viewbody.get(0).getCount() %>" name="count" hidden="true"/>
<input type="submit" value="글 쓰기">
</form>
<a href="/ProtoType/freeboard/view">자유게시판으로 돌아가기</a>
</body>
</html>