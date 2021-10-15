<%@page import="data.dto.NoticeDto"%>
<%@page import="data.dao.NoticeDao"%>
<%@page import="java.text.SimpleDateFormat"%>
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
</head>
<body>
<%
	String num=request.getParameter("num");
	String currentPage=request.getParameter("currentPage");
	if(currentPage==null)
		currentPage="1";
	//key는 목록에서만 값이 넘어오고 그 이외는 null값
	String key=request.getParameter("key");
	
	NoticeDao dao=new NoticeDao();
	//목록에서 올경우에만 조회수 1 증가한다
	if(key!=null)
		dao.updateView(num);
	
	//num에 해당하는 dto 얻기
	NoticeDto dto=dao.getData(num);
	
	SimpleDateFormat sdf=new SimpleDateFormat("yyyy-MM-dd HH:mm");
%>
<table class="table table-borderd" style="width: 600px;">
	<caption><b>내용보기</b></caption>
	<tr>
		<th>
			<span style="font-size: 1.7em;"><%=dto.getTitle()%></span>
			<br>
			<span style="color: black; font-size: 12pt; margin-left: 30px;">
				<%=dto.getMyid()%></span><br>
			<span style="color: gray; font-size: 10pt; margin-left: 30px;">
				<%=sdf.format(dto.getWriteday())%>
				&nbsp;&nbsp;&nbsp;
				조회 <%=dto.getView() %>
			</span>
		</th>
	</tr>
	<tr>
		<td>
			<%=dto.getContent()%>
		</td>
	</tr>
	<tr>
		<td align="center">
			<button type="button" class="btn btn-sm btn-info"
			style="width: 80px;"
			onclick="location.href='index.jsp?main=board/smartform.jsp'">글쓰기</button>
			
			<button type="button" class="btn btn-sm btn-info"
			style="width: 80px;"
			onclick="location.href='index.jsp?main=board/boardlist.jsp?currentPage=<%=currentPage%>'">목록</button>
			
			<button type="button" class="btn btn-sm btn-info"
			style="width: 80px;"
			onclick="location.href=''">수정</button>
			
			<button type="button" class="btn btn-sm btn-info"
			style="width: 80px;"
			onclick="location.href=''">삭제</button>
		</td>
	</tr>
</table>
</body>
</html>