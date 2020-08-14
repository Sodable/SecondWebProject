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
List<FreeBoardVO> freelist = (List<FreeBoardVO>) request.getAttribute("freelist"); 

//페이지 부분 이부분을 컨트롤러에서 get으로 보내주면 검색하기 편할듯 
int pagenum = (int) request.getAttribute("pagenum"); // 입력된 페이지 , 컨트롤러에서 디폴트로 1
int itemnum = (int) request.getAttribute("itemnum"); // 게시물 총 갯수 받아오기
int totalpage = (int) itemnum/10 + 1;
int pageflag = (int) (pagenum-1)/5+1;
//================================================================
%>
</head>
<body>
<h1> ** 자유 게시판 **</h1>
	<p>	로그인 id : <%=loginid%><br>
		로그인 nickname : <%=loginnickname%></p>
<hr>
<table board="0">
	<tr >
		<th>글 번호</th><th>날씨</th><th width="700">제목</th><th>작성자</th><th>작성 날짜</th><th>조회수</th>
	</tr>
	<% int gongjicnt = 0;
	for(FreeBoardVO vo : freelist) {
	if((gongjicnt<5)&&(vo.getFb_weather()!=null)&&(vo.getFb_weather().equals("공지 사항"))){
	gongjicnt++;%>
	<tr style="background-color: silver;">
		<td><%=vo.getCount() %></td>
		<td><%=vo.getFb_weather() %></td>
		<td><a href="/ProtoType/freeboard/viewbody?count=<%=vo.getCount() %>" ><%=vo.getTitle() %></a></td>
		<td><%=vo.getId() %></td>
		<td><%=vo.getWrite_date() %></td>
		<td><%=vo.getView_count() %></td>
	</tr>
	<%}} 
	if(!freelist.isEmpty()){
		int fromIndex = (pagenum-1)*10;
		int toIndex = ((pagenum*10 >itemnum) ? itemnum : pagenum*10 );
		freelist = freelist.subList(fromIndex, toIndex);
	} 
	for(FreeBoardVO vo : freelist) {%>
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
<!-- 페이지 넘기는 코드 -->
<%if(pageflag>1){%>
<a href="/ProtoType/freeboard/view?pagenum=<%=pagenum-(pagenum-1)%5-1%>">이전</a>
<%} %>
<%for (int i = 0 ; i < ((totalpage-(pageflag-1)*5)>5 ? 5 : (totalpage-(pageflag-1)*5)) ; i++) {%>
<a href="/ProtoType/freeboard/view?pagenum=<%=(pagenum-1)/5*5+i+1 %>"><%=(pagenum-1)/5*5+i+1 %></a>
<%} %>
<%if(pageflag<(int)(totalpage-1)/5+1) {%>
<a href="/ProtoType/freeboard/view?pagenum=<%=(pagenum-1)/5*5+6%>">다음</a>
<%} %>
<hr>
<%if(!loginid.equals("null")) {%>
<form action="/ProtoType/freeboard/write">
<input type="submit" value="글 작성"/>
</form>
<%} %>
<form action="/ProtoType/freeboard/search" method="get">
<select name="type">
<option>제목</option>
<option>내용</option>
<option>작성자</option>
<option>제목/내용</option>
</select>
<input type="search" name = "search"/>
<input type="hidden" name="pagenum" value="1"/>
<input type="submit" value='검색'/>
</form>

</body>
</html>