<%@page import="DWM.vo.PhotoBoardVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.*" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<title>**관리자 페이지**</title>
<%
	List<PhotoBoardVO> photolist = (List<PhotoBoardVO>) request.getAttribute("photolist");
int pagenum = Integer.parseInt(request.getParameter("pagenum"));
int itemnum = photolist.size();
int totalpage = (int) itemnum / 12 + 1;
int pageflag = (int) (pagenum - 1) / 5 + 1;
if (!photolist.isEmpty()) {
	int fromIndex = (pagenum - 1) * 12;
	int toIndex = ((pagenum * 12 > itemnum) ? itemnum : pagenum * 12);
	request.removeAttribute("photolist");
	request.setAttribute("photolist", photolist.subList(fromIndex, toIndex));
}
%>
</head>
<body>
<h2>**사진게시판 게시글 목록**</h2>
<hr>
총 게시물 : <%=itemnum %> 개
<c:if test="${!empty photolist }">
<table border="1">
 <tr>
	<th>pb_file</th> 
	<th>count</th> 
	<th>ID</th>
	<th>title</th> 
	<th>view_count</th> 
	<th>write_date</th> 
	<th>pb_count</th> 
	<th>pb_weather</th> 
	<th>삭제</th>
 </tr>
 	<c:forEach items="${photolist}" var="one">
		<tr>
			<td><img src="/ProtoType/upload/photoboard/${one.pb_file}" 
	title="${one.pb_file}" 
	alt="" width="100px" height="100px"
	onclick="window.open('/ProtoType/photoboard/viewbody?count=${one.count}',
	'${one.pb_file}',
	'height=650,location=no,status=no,scrollbars=yes');"></td>
			<td>${one.count}</td>
			<td>${one.id}</td>
			<td>${one.title}</td>
			<td>${one.view_count}</td>
			<td>${one.write_date}</td>
			<td>${one.pb_count}</td>
			<td>${one.pb_weather}</td>
			<td><a href="/ProtoType/master/photodelete?count=${one.count}">삭제</a></td>
		</tr>
 	</c:forEach>
</table>
<!-- 페이지 넘기는 코드 -->
<%if(pageflag>1){%>
<a href="/ProtoType/master/photolist?pagenum=<%=pagenum-(pagenum-1)%5-1%>">이전</a>
<%} %>
<%for (int i = 0 ; i < ((totalpage-(pageflag-1)*5)>5 ? 5 : (totalpage-(pageflag-1)*5)) ; i++) {%>
<a href="/ProtoType/master/photolist?pagenum=<%=(pagenum-1)/5*5+i+1 %>"><%=(pagenum-1)/5*5+i+1 %></a>
<%} %>
<%if(pageflag<(int)(totalpage-1)/5+1) {%>
<a href="/ProtoType/master/photolist?pagenum=<%=(pagenum-1)/5*5+6%>">다음</a>
<%} %>
</c:if>
<c:if test="${empty photolist }">
	회원이 없습니다.
</c:if>
	<a href="/ProtoType/master/main">돌아가기</a>

</body>
</html>