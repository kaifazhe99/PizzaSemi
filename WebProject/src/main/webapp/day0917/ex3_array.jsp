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
	//배열선언
	String []colors={"green","magenta","blue","red","orange"};
	//제목선언
	String title="배열출력";
%>
<table class="table table-bordered" style="width: 200px;">
	<caption><b><%=title%></b></caption>
  <tr bgcolor="pink">
    <th>번호</th>
    <th>색상</th>
  </tr>
  <%
  for(int i=0;i<colors.length;i++)
  {%>
	<tr>
		<td align="center"><%=i+1%></td>
		<td>
			<b style="color: <%=colors[i]%>"><%=colors[i]%></b>
		</td>
	</tr>  
  <%}
  %>
</table>

</body>
</html>










