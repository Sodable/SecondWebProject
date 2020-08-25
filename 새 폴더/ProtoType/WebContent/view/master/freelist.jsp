<%@page import="DWM.vo.FreeBoardVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.*" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<title>**관리자 페이지**</title>
<%
	List<FreeBoardVO> freelist = (List<FreeBoardVO>) request.getAttribute("freelist");
int pagenum = Integer.parseInt(request.getParameter("pagenum"));
int itemnum = freelist.size();
int totalpage = (int) itemnum / 12 + 1;
int pageflag = (int) (pagenum - 1) / 5 + 1;
if (!freelist.isEmpty()) {
	int fromIndex = (pagenum - 1) * 12;
	int toIndex = ((pagenum * 12 > itemnum) ? itemnum : pagenum * 12);
	request.removeAttribute("freelist");
	request.setAttribute("freelist", freelist.subList(fromIndex, toIndex));
}
%>
</head>
<body>
<h2>**자유게시판 게시글 목록**</h2>
<hr>
총 게시물 : <%=itemnum %> 개
<c:if test="${!empty freelist }">
<table border="1">
 <tr>
	<th>count</th> 
	<th>ID</th>
	<th>title</th> 
	<th>body</th> 
	<th>view_count</th> 
	<th>write_date</th> 
	<th>fb_file</th> 
	<th>fb_weather</th> 
	<th>삭제</th>
 </tr>
 	<c:forEach items="${freelist}" var="one">
		<tr>
			<td>${one.count}</td>
			<td>${one.id}</td>
			<td>${one.title}</td>
			<td>${one.body}</td>
			<td>${one.view_count}</td>
			<td>${one.write_date}</td>
			<td>${one.fb_file}</td>
			<td>${one.fb_weather}</td>
			<td><a href="/ProtoType/master/freedelete?count=${one.count}">삭제</a></td>
		</tr>
 	</c:forEach>
</table>
<!-- 페이지 넘기는 코드 -->
<%if(pageflag>1){%>
<a href="/ProtoType/master/freelist?pagenum=<%=pagenum-(pagenum-1)%5-1%>">이전</a>
<%} %>
<%for (int i = 0 ; i < ((totalpage-(pageflag-1)*5)>5 ? 5 : (totalpage-(pageflag-1)*5)) ; i++) {%>
<a href="/ProtoType/master/freelist?pagenum=<%=(pagenum-1)/5*5+i+1 %>"><%=(pagenum-1)/5*5+i+1 %></a>
<%} %>
<%if(pageflag<(int)(totalpage-1)/5+1) {%>
<a href="/ProtoType/master/freelist?pagenum=<%=(pagenum-1)/5*5+6%>">다음</a>
<%} %>
</c:if>
<c:if test="${empty freelist }">
	회원이 없습니다.
</c:if>
	<a href="/ProtoType/master/main">돌아가기</a>

</body>
</html>