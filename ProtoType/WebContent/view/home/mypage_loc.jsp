<%@page import="java.util.List"%>
<%@page import="DWM.vo.MemberVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-type" content="text/html; charset=UTF-8">
<title>** 마이페이지 ** </title>
</head>
<body>
<h1>** 지역 정보 즐겨찾기 **</h1>
<%
String loginid =(String) (session.getAttribute("id")==null ? "null" : session.getAttribute("id"));
String loginnickname =(String) (session.getAttribute("nickname")==null ? "null" : session.getAttribute("nickname"));
List<MemberVO> loclist = (List<MemberVO>) request.getAttribute("loclist");
%>
<p>	로그인 id : <%=loginid%><br>
	로그인 nickname : <%=loginnickname%></p>
<form action="/ProtoType/member/selectloc.do" method="post">
<table border="0">
	<tr>
		<th>선택</th>	<th>지역</th>	<th>삭제</th>
	</tr>
<%for(MemberVO vo : loclist){ %>
	<tr>
		<td><input type="radio" name="locale" value="<%=vo.getLocale() %>" 
		<%if(vo.getLoc_flag()==1){ %>
		checked="checked"
		<%} %>
		></td>
		<td>
		<%=vo.getLocale().split(" ")[0] %>&nbsp;
		<%=vo.getLocale().split(" ")[1] %>&nbsp;
		<%=vo.getLocale().split(" ")[2] %>
		</td>
		<td><a href="">삭제</a></td>
	</tr>
<%} %>
</table>
<input type="text" value="<%=loginid %>" name = "id" hidden="true">
<input type="submit" value="설정 하기"/>
</form>
</body>
</html>