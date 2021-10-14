<%@page import="MemberDao.MemberDao"%>
<%@page import="data.dto.CustomerDto"%>
<%@page import="data.dao.CustomerDao"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>Insert title here</title>
<link href="https://fonts.googleapis.com/css2?family=Black+Han+Sans&family=Jua&family=Nanum+Gothic:wght@400;800&display=swap" rel="stylesheet">
<style type="text/css">
	a:link {
	  color : black;
	  text-decoration: none;
	}
	a:visited {
	  color : black;
	  text-decoration: none;
	}
	a:hover {
	  color : black;
	  text-decoration: none;
	}
	a:active {
	  color : pink;
	  text-decoration: none;
	}
</style>
</head>
<% 
	String loginok=(String)session.getAttribute("loginok");

	CustomerDao dao=new CustomerDao();
	//페이징 처리에 필요한 변수선언
	int perPage=5;	//한 페이지에 보여질 글의 개수
	int totalCount;	//총 글의 개수
	int currentPage; //현재 페이지 번호
	int totalPage;	//총 페이지 수
	int start;	//각 페이지에서 불러올 db의 시작번호
	int perBlock=5;	//몇개의 페이지번호를 표현할건지...(ex)목록 하단이나 상단에 나오는 1~n페이지 번호))
	int startPage;	//각 블럭에 표시할 시작페이지
	int endPage;	//각 블럭에 표시할 마지막페이지
	
	//총 개수
	totalCount=dao.getTotalCount();
	//현재 페이지 번호 읽기(단, null일 경우에는 1페이지로 설정)
	if(request.getParameter("currentPage")==null)
		currentPage=1;
	else
		currentPage=Integer.parseInt(request.getParameter("currentPage"));
	
	//총 페이지 개수 구하기
	totalPage=totalCount/perPage+(totalCount%perPage==0?0:1);
	//각 블럭의 시작페이지
	startPage=(currentPage-1)/perBlock*perBlock+1;
	endPage=startPage+perBlock-1;
	if(endPage>totalPage)
		endPage=totalPage;
	//각 페이지에서 불러올 시작번호
	start=(currentPage-1)*perPage;// 오라클은 start=(currentPage-1)*perPage+1;
	//각 페이지에서 필요한 게시글 가져오기
	List<CustomerDto> list=dao.getList(start, perPage);
	
	if(list.size()==0 && totalCount>0)
	{%>
		<script type="text/javascript">
			location.href="index.jsp?main=customer/customerlist.jsp?currentPage=<%= currentPage-1 %>";
		</script>
	<%}
	SimpleDateFormat sdf=new SimpleDateFormat("yyyy-MM-dd");
	
	//각 페이지에 출력할 시작번호
	int no=totalCount-(currentPage-1)*perPage;
%>
<body>
<!-- 게시판 출력 -->
<br><br>
<div style="height: 400px;" align="center">
<h2 style="font-family: 'Black Han Sans';">고객의 소리</h2>
<br>

<table class="table table-bordered" style="width: 900px; text-align: center; 
	border-right:white;border-top:black;border-left:white;border-bottom:#e0e0e0;">
	<tr bgcolor="#fff">
		<th width="70">번호</th>
		<th width="350">제목</th>
		<th width="100">작성자</th>
		<th width="100">작성일</th>
		<th width="70">조회</th>
	</tr>
	<%
	if(totalCount==0)
	{%>
		<tr height="40">
			<td colspan="5" align="center">
				<b>등록된 게시글이 없습니다.</b>
			</td>
		</tr>
	<%}else{
		MemberDao mdao=new MemberDao();
		for(CustomerDto dto:list)
		{
			String name=mdao.getName(dto.getMyid());
		%>
			<tr style="font-family: 'Nanum Gothic Coding';">
				<td align="center"><%= no-- %></td>
				<td>
					<a style="color: black;" 
						href="index.jsp?main=customer/detail.jsp?num=<%=dto.getNum()%>&currentPage=<%=currentPage%>&key=list">
					<%= dto.getSubject() %>
					</a>
				</td>
				<td><%= name %></td>
				<td><%= sdf.format(dto.getWriteday()) %></td>
				<td><%= dto.getViews() %></td>			
			</tr>
		<%}
	}
	%>
</table>
<div style="position: absolute; margin-left: 290px;">
<% 
	if(loginok!=null){	//로그인 상태일때만 입력폼이 보이도록 한다.
	%>		
		<button type="button" class="btn btn-danger btn-sm" 
		style="color:white; width: 90px; margin-left: 20px; font-family: 'Nanum Gothic Coding:wght@800';"
		onclick="location.href='index.jsp?main=customer/customerform.jsp'">
		글쓰기</button>
	<%}
%>
</div>
<br><br>
<!-- 페이징 -->
<div style="position: absolute; margin-left: 700px;" align="center">
	<ul class="pagination">
		<%
		//이전
		if(startPage>1)
		{%>
			<li>
				<a style="color: tomato;" href="index.jsp?main=customer/customerlist.jsp?currentPage=<%= startPage-1 %>">이전</a>&nbsp;&nbsp;
			</li>
		<%}
		for(int pp=startPage;pp<=endPage;pp++)
		{
			if(pp==currentPage)	//현재 페이지일때 active
			{%>
				<li class="active">
					<a style="color: black;" href="index.jsp?main=customer/customerlist.jsp?currentPage=<%= pp %>"><%= pp %></a>&nbsp;&nbsp;
				</li>
			<%}else{%>
				<li>
					<a style="color: lightgray;" href="index.jsp?main=customer/customerlist.jsp?currentPage=<%= pp %>"><%= pp %></a>&nbsp;&nbsp;
				</li>
			<%}
		}
		
		//다음
		if(endPage<totalPage)
		{%>
			<li>
				<a style="color: tomato;" href="index.jsp?main=customer/customerlist.jsp?currentPage=<%= endPage+1 %>">다음</a>
			</li>
		<%}
		%>
	</ul>
</div>
</div>
<br><br>
</body>

</html>