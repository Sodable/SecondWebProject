<%@page import="DWM.vo.PhotoBoardVO"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="form"
uri="http://www.springframework.org/tags/form" %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-type" content="text/html; charset=UTF-8">
<title>**포토게시판**</title>
<%
//로그인 아이디 받아오기
String loginid =(String) (session.getAttribute("id")==null ? "null" : session.getAttribute("id"));
String loginnickname =(String) (session.getAttribute("nickname")==null ? "null" : session.getAttribute("nickname"));
//================================================================

// 당일 게시물들 받아오기
PhotoBoardVO photo = (PhotoBoardVO) request.getAttribute("photo");
//================================================================


%>
</head>
<body>
<h1> ** 포토 게시판 글 작성**</h1>
<p>	로그인 id : <%=loginid%><br>
	로그인 nickname : <%=loginnickname%></p>
<hr>
<img alt="" src="/ProtoType/upload/photoboard/<%=photo.getPb_file().trim()%>"><br>
</body>
</html>