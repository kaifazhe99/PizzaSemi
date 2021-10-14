<%@page import="MemberDao.MemberDao"%>
<%@page import="data.dto.CustomerDto"%>
<%@page import="data.dao.CustomerDao"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>Insert title here</title>
</head>
<body>
<% 
	String loginok=(String)session.getAttribute("loginok");

	String num=request.getParameter("num");
	String currentPage=request.getParameter("currentPage");
	if(currentPage==null)
		currentPage="1";
	//key는 목록에서만 값이 넘어오고 그 이외는 null 값
	String key=request.getParameter("key");
	
	CustomerDao dao=new CustomerDao();
	//목록에서 올 경우에만 조회수 1 증가한다.
	if(key!=null)
		dao.updateViews(num);
	
	//num 에 해당하는 dto 얻기
	CustomerDto dto=dao.getData(num);
	
	SimpleDateFormat sdf=new SimpleDateFormat("yyyy-MM-dd HH:mm");
%>
<br><br>
<h2 style="font-family: 'Black Han Sans';">고객의 소리</h2>
<br>
<table class="table table-bordered" style="width: 900px;
	border-right:white;border-top:black;border-left:white;border-bottom:#e0e0e0;">
	<% 
	MemberDao mdao=new MemberDao();
		String name=mdao.getName(dto.getMyid());
	%>
	<tr>
		<th>
			<span style="font-size: 1.7em;"><%= dto.getSubject() %></span>
			<br>
			<span><img src="customer/profile.png" width="30px;" style="margin-top: 10px;"></span>
			<span style="color: black; font-size:12pt; height: 20px; margin-left: 5px;"><%= name %></span>
			<span style="color: gray; font-size: 9pt; margin-left: 10px;">
				<%= sdf.format(dto.getWriteday()) %>
				&nbsp;
				조회<%= dto.getViews() %>
			</span>
		</th>
	</tr>
	<tr>
		<td style="height: 400px;">
			<div style="width: 100%;"><%= dto.getContent() %></div>
		</td>
	</tr>
</table>

<div>
<!-- 회원/비회원에게 보이는 부분 -->			
			<button type="button" class="btn btn-sm btn-info" style="width: 80px;"
				onclick="location.href='index.jsp?main=customer/customerlist.jsp?currentPage=<%=currentPage%>'">목록</button>
				
			<% 
				String myid=(String)session.getAttribute("myid");
				if(loginok!=null && dto.getMyid().equals(myid)){	//로그인 상태일때만 입력폼이 보이도록 한다.
				%>		
					<button type="button" class="btn btn-sm btn-info" style="width: 80px;"
				onclick="location.href='index.jsp?main=customer/customerform.jsp'">글쓰기</button>
			
			<button type="button" class="btn btn-sm btn-info" style="width: 80px;"
				onclick="location.href='index.jsp?main=customer/updateform.jsp?num=<%=dto.getNum()%>'">수정</button>
				
			<button type="button" class="btn btn-sm btn-info" style="width: 80px;"
				onclick="location.href='customer/customerdelete.jsp?num=<%=dto.getNum()%>&currentPage=<%= currentPage %>'">삭제</button>
				<%}
			%>
</div>
<br><br>
</body>
</html>