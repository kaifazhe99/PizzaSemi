<%@page import="data.dto.NoticeDto"%>
<%@page import="data.dao.NoticeDao"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<%
	NoticeDao dao=new NoticeDao();
	//페이징 처리에 필요한 변수 선언
	int perPage=5;//한페이지에 보여질 글의 갯수
	int totalCount;//총 글의 수
	int currentPage;//현재 페이지 번호
	int totalPage;//총 페이지 수
	int start;//각 페이지에서 불러올 db의 시작번호
	int perBlock=5;//몇개의 페이지 번호씩 표현할것인가
	int startPage;//각 블럭에 표시할 시작페이지
	int endPage;//각 블럭에 표시할 마지막페이지
	
	//총 갯수
	totalCount=dao.getTotalCount();
	//현재 페이지 번호 읽기(단 null일 경우는 1페이지로 설정)
	if(request.getParameter("currentPage")==null)
		currentPage=1;
	else
		currentPage=Integer.parseInt(request.getParameter("currentPage"));
	
	//총 페이지 갯수 구하기
	totalPage=totalCount/perPage+(totalCount%perPage==0?0:1);
	//각 블럭의 시작페이지
	startPage=(currentPage-1)/perBlock*perBlock+1;   //7페이지일 경우 7/5*5+1 = 6 시작
	endPage=startPage+perBlock-1; // 위의 경우 6+5-1 10페이지
	if(endPage>totalPage)
		endPage=totalPage;
	//각 페이지에서 불러올 시작번호
	start=(currentPage-1)*perPage; //mysql은 첫번째 글이 0번, 오라클은 1번부터 시작이므로 start=(currentPage-1)*perPage+1;
	//각 페이지에서 필요한 게시글 가져오기
	List<NoticeDto> list=dao.getList(start, perPage);
	
	if(list.size()==0 && totalCount>0)
	{%>
		<script type="text/javascript">
			location.href="index.jsp?main=notice/noticelist.jsp?currentPage=<%=currentPage-1%>";
		</script>
	<%}
	
	SimpleDateFormat sdf=new SimpleDateFormat("yyyy-MM-dd");
	//각페이지에 출력할 시작번호
	int no=totalCount-(currentPage-1)*perPage;
%>
<body>
<!-- 게시판 출력 -->
<br><br>
<div style="height: 500px; margin-bottom: 100px;" align="center">
<h2 style="font-family: 'Black Han Sans';">공지사항</h2>
<br>
<table class="table table-bordered" style="width: 900px;">
	
	<tr bgcolor="#ddd">
		<th width="70">번호</th>
		<th width="350">공지사항</th>
		<th width="100">담당자</th>
		<th width="150">작성일</th>
		<th width="70">조회</th>		
	</tr>
	<%
	if(totalCount==0)
	{%>
		<tr height="40">
			<td colspan="5" align="center">
				<b>등록된 게시글이 없습니다</b>
			</td>
		</tr>
	<%}else{
		for(NoticeDto dto:list)
		{%>
			<tr>
				<td align="center"><%=no--%></td>
				<td>
					<a style="color: black;"
					href="index.jsp?main=notice/detail.jsp?num=<%=dto.getNum()%>&currentPage=<%=currentPage%>&key=list">
					<%=dto.getTitle()%>
					</a>
				</td>
				<td><%=dto.getMyid()%></td>
				<td><%=sdf.format(dto.getWriteday())%></td>
				<td><%=dto.getView()%></td>
			</tr>
		<%}
	}
	%>	
</table>

<!-- 페이징 -->
<div style="width: 900px; text-align: center;">
	<ul class="pagination">
	<%
	//이전
	if(startPage>1)
	{%>
		<li>
			<a href="index.jsp?main=notice/noticelist.jsp?currentPage=<%=startPage-1%>">이전</a>
		</li>
	<%}
	
	for(int pp=startPage;pp<=endPage;pp++)
	{
		if(pp==currentPage) //현재 페이지일때 active
		{%>
			<li class="active">
			<a href="index.jsp?main=notice/noticelist.jsp?currentPage=<%=pp%>"><%=pp%></a></li>
		<%}else{%>
			<li>
			<a href="index.jsp?main=notice/noticelist.jsp?currentPage=<%=pp%>"><%=pp%></a></li>
		<%}
	}
	
	//다음
	if(endPage<totalPage)
	{%>
		<li>
			<a href="index.jsp?main=notice/noticelist.jsp?currentPage=<%=endPage+1%>">다음</a>
		</li>
	<%}
	%>
	</ul>
</div>
</div>
</body>
</html>