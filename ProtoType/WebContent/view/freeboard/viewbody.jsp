<%@page import="DWM.vo.FreeBoardVO"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-type" content="text/html; charset=UTF-8">
<title>**자유게시판**</title>
<%
String loginid =(String) (session.getAttribute("id")==null ? "null" : session.getAttribute("id"));
String loginnickname =(String) (session.getAttribute("nickname")==null ? "null" : session.getAttribute("nickname"));
List<FreeBoardVO> viewbody = (List<FreeBoardVO>) request.getAttribute("viewbody"); 
%>
</head>
<body>
<h1> ** 자유 게시판 **</h1>
<p>	로그인 id : <%=loginid%><br>
	로그인 nickname : <%=loginnickname%></p>
<hr>
<label>날씨 : </label><%=viewbody.get(0).getFb_weather() %>
<label>작성 날짜 : </label><%=viewbody.get(0).getWrite_date() %><br/>
<label>제목 : </label><%=viewbody.get(0).getTitle() %>
<label>조회수 : </label><%=viewbody.get(0).getView_count() %><br/>
<label>작성자 : </label><%=viewbody.get(0).getId() %><br/>
<label>내용</label><br>
<textarea cols="100" rows="10" name="body"><%=viewbody.get(0).getBody() %></textarea><br/>
<%if((loginid!=null)&&(loginid.equals(viewbody.get(0).getId()))){ %>
<a href="/ProtoType/freeboard/rewriteview?count=<%=viewbody.get(0).getCount() %>">글 수정</a> &nbsp;
<!-- 글 삭제시 확인 받아보기 ? -->
<a href="/ProtoType/freeboard/deleteview?count=<%=viewbody.get(0).getCount() %>">글 삭제</a><br>
<%} %>
<a href="/ProtoType/freeboard/view?pagenum=1">자유게시판으로 돌아가기</a>
</body>
</html>