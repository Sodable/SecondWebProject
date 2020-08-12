<%@page import="DWM.vo.MemberVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.*" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<title>**관리자 페이지**</title>
<%
	List<MemberVO> memberlist = (List<MemberVO>) request.getAttribute("memberlist");
int pagenum = Integer.parseInt(request.getParameter("pagenum"));
int itemnum = memberlist.size();
int totalpage = (int) itemnum / 12 + 1;
int pageflag = (int) (pagenum - 1) / 5 + 1;
if (!memberlist.isEmpty()) {
	int fromIndex = (pagenum - 1) * 12;
	int toIndex = ((pagenum * 12 > itemnum) ? itemnum : pagenum * 12);
	memberlist = memberlist.subList(fromIndex, toIndex);
}
%>
</head>
<body>
<h2>**회원 목록**</h2>
<hr>
총 회원 수 : <%=itemnum %> 명
<c:if test="${!empty memberlist }">
<table border="1">
 <tr>
	<th>ID</th>
	<th>NAME</th> 
	<th>TEL</th> 
	<th>EMAIL</th> 
	<th>NICKNAME</th> 
	<th>GENDER</th> 
	<th>AGE</th> 
	<th>LOCALE</th> 
	<th>JOB</th> 
	<th>JOB_LOCALE</th> 
	<th>삭제</th>
 </tr>
 	<c:forEach items="${memberlist}" var="member">
		<tr>
			<td>${member.id}</td>
			<td>${member.name}</td>
			<td>${member.tel}</td>
			<td>${member.email}</td>
			<td>${member.nickname}</td>
			<td>${member.gender}</td>
			<td>${member.age}</td>
			<td>${member.locale}</td>
			<td>${member.job}</td>
			<td>${member.job_locale}</td>
			<td><a href="/ProtoType/master/memberdelete?id=${member.id}">삭제</a></td>
		</tr>
 	</c:forEach>
</table>
<!-- 페이지 넘기는 코드 -->
<%if(pageflag>1){%>
<a href="/ProtoType/master/memberlist?pagenum=<%=pagenum-(pagenum-1)%5-1%>">이전</a>
<%} %>
<%for (int i = 0 ; i < ((totalpage-(pageflag-1)*5)>5 ? 5 : (totalpage-(pageflag-1)*5)) ; i++) {%>
<a href="/ProtoType/master/memberlist?pagenum=<%=(pagenum-1)/5*5+i+1 %>"><%=(pagenum-1)/5*5+i+1 %></a>
<%} %>
<%if(pageflag<(int)(totalpage-1)/5+1) {%>
<a href="/ProtoType/master/memberlist?pagenum=<%=(pagenum-1)/5*5+6%>">다음</a>
<%} %>
<hr>

</c:if>
<c:if test="${empty memberlist }">
	회원이 없습니다.
</c:if>
	<a href="/ProtoType/master/main">돌아가기</a>

</body>
</html>