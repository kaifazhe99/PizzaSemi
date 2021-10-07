<%@page import="java.text.SimpleDateFormat"%>
<%@page import="team.TeamDto"%>
<%@page import="java.util.ArrayList"%>
<%@page import="team.TeamDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link href="https://fonts.googleapis.com/css2?family=Dokdo&family=Gaegu&family=Gugi&family=Nanum+Pen+Script&display=swap" rel="stylesheet">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
<script src="https://code.jquery.com/jquery-3.5.0.js"></script>
<style type="text/css">
	table *{
		font-family: 'Gugi';
	}	
</style>
</head>
<%
	//db 목록 가져오기
	TeamDao dao=new TeamDao();
	ArrayList<TeamDto> list=dao.getAllDatas();
	SimpleDateFormat sdf=new SimpleDateFormat("yyyy-MM-dd HH:mm");
%>
<body>
<button type="button" class="btn btn-info"
 style="width: 100px;margin-left:200px;" 
 onclick="location.href='addform.html'">팀원추가</button>
<br>
<table class="table table-bordered" style="width: 800px;">
	<caption><b>팀원 정보 출력</b></caption>
	<tr bgcolor="orange">
		<th width="50">번호</th>
		<th width="100">이름</th>
		<th width="120">운전면허</th>
		<th width="150">주소</th>
		<th width="150">작성일</th>
		<th width="70">삭제</th>		
	</tr>
	<%
	for(int i=0;i<list.size();i++)
	{
		TeamDto dto=list.get(i);//i번지의 dto를 꺼낸다
	%>	
		<tr>
			<td align="center"><%=i+1%></td>
			<td><%=dto.getName() %></td>
			<td align="center"><%=dto.getDriver()%></td>
			<td><%=dto.getAddr() %></td>
			<td align="center"><%=sdf.format(dto.getWriteday()) %></td>
			<td align="center">
				<button type="button" class="btn btn-danger btn-xs"
				onclick="location.href='teamdelete.jsp?num=<%=dto.getNum()%>'">Delete</button>
			</td>
		</tr>	
	<%}
	%>
</table>
</body>
</html>



















