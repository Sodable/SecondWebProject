<%@page import="DWM.vo.FreeBoardVO"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-type" content="text/html; charset=UTF-8">
<title>**자유게시판**</title>
<% List<FreeBoardVO> freelist = (List<FreeBoardVO>) request.getAttribute("freelist"); %>
</head>
<body>
<h1> ** 자유 게시판 **</h1>
<hr>
<table board="0">
	<tr >
		<th>글 번호</th><th>날씨</th><th width="700">제목</th><th>작성자</th><th>작성 날짜</th><th>조회수</th>
	</tr>
	<% for(FreeBoardVO vo : freelist) {%>
	<tr>
		<td><%=vo.getCount() %></td>
		<td><%=vo.getFb_weather() %></td>
		<td><a href="/ProtoType/freeboard/viewbody?count=<%=vo.getCount() %>" ><%=vo.getTitle() %></a></td>
		<td><%=vo.getId() %></td>
		<td><%=vo.getWrite_date() %></td>
		<td><%=vo.getView_count() %></td>
	</tr>
	<%} %>
</table>
<hr>
<form action="/ProtoType/freeboard/write">
<input type="submit" value="글 작성"/>
</form>

</body>
</html>