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
<h3 style="margin-left: 50px; margin-top: 50px; font-family: Black Han Sans;" >수정페이지</h3>
<form action="login/memberupdate.jsp" method="post" class="form-inline" name="memberfrm">
<input type="hidden" name="num" value="<%=num%>">
<table class="table table-bordered" style="width: 500px; margin-left: 580px;">
	<tr>
		<th width="100" bgcolor="#aaa">이름</th>
		<td>
			<input type="text" name="name" class="form-control"
				required="required" style="width: 120px;"
				value="<%=dto.getName()%>">
		</td>
	</tr>
	<tr>
		<th width="100" bgcolor="#aaa">핸드폰</th>
		<td>
			<input type="text" name="hp" class="form-control"
				required="required" style="width: 150px;"
				value="<%=dto.getHp()%>">
		</td>
	</tr>
	
	<tr>
		<th width="100" bgcolor="#aaa">주소</th>
		<td>
			<input type="text" name="addr" class="form-control"
				required="required" style="width: 200px;"
				value="<%=dto.getAddr()%>">
		</td>
	</tr>

	<tr>
		<td align="center" colspan="2">
			<button type="submit" class="btn btn-default" style="width: 100px;">수정</button>
		</td>
	</tr>
	
	
</table>
<br><br>
</form>



</body>
</html>