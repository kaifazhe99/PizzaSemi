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
<table class="table table-bordered">
   <tr>
   		<td colspan="8" align="center">
   			<b style="font-size: 2em;">전체 구구단</b>
		</td>
   </tr>
   <tr bgcolor="#ffc">
   <%
   for(int dan=2;dan<=9;dan++)
   {%>
	  <td align="center"><b><%=dan%>단</b></td>
   <%}
   %>
   </tr>	
   <%
   for(int i=1;i<=9;i++)
   {%>
	 <tr>
	 <%
	 for(int dan=2;dan<=9;dan++)
	 {%>
		<td align="center">
			<%=dan%>x<%=i%>=<%=dan*i%>
		</td> 
	 <%}
	 %>
	 </tr>  
   <%}
   %>
</table>
</body>
</html>









