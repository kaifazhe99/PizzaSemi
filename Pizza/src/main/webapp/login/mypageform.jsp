<%@page import="MemberDto.MemberDto"%>
<%@page import="MemberDao.MemberDao"%>
<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>Insert title here</title>
<script type="text/javascript">
</script>
</head>
<%
	//num 읽기	
	String num=request.getParameter("num");
	//dao 선언
	MemberDao dao=new MemberDao();
	//dto 얻기
	MemberDto dto=dao.getMember(num);
%>
<body>
<h3 style="margin-left: 50px; margin-top: 50px; font-family: Black Han Sans;" >마이페이지</h3>
<table class="table table-bordered" style="width: 500px; margin-left: 580px;">
	<tr>
		<th width="100" bgcolor="#aaa">이름</th>
		<td>
			<a type="text" name="name" style="width: 120px;"><%=dto.getName()%></a>
		</td>
	</tr>
	<tr>
		<th width="100" bgcolor="#aaa">핸드폰</th>
		<td>
			<a type="text" name="hp" style="width: 120px;"><%=dto.getHp()%></a>
		</td>
	</tr>
	
	<tr>
		<th width="100" bgcolor="#aaa">주소</th>
		<td>
			<a type="text" name="addr" style="width: 120px;"><%=dto.getAddr()%></a>
		</td>
	</tr>

	<tr>
		<td align="center" colspan="2">
			<button type="button" class="btn btn-default" style="width: 100px;" onclick="location.href='index.jsp?main=login/updateform.jsp?num=<%=num%>'">수정하기</button>
			<button type="button" class="btn btn-default" style="width: 100px;">틸퇴하기</button>
		</td>
	</tr>
	
	
</table>
<br><br>



</body>
</html>