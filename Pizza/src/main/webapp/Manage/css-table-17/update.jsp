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
$(function(){
	//이메일 선택 이벤트
	$("#selemail").change(function(){
		if($(this).val()=='-'){
			$("#email2").val('');//지정된 메일 지우기
			$("#email2").focus();//포커스주기
		}else{
			$("#email2").val($(this).val());
		}
	});	
});
</script>
</head>
<%
	//num 읽기
	String num=request.getParameter("num");
	//dao 선언
	MemberDao dao=new MemberDao();
	//dto 얻기
	MemberDto dto=dao.getMember(num);
	//이메일 분리하기(@기준으로)
	//@ 의 위치 알아내기
	int idx=dto.getEmail().indexOf('@');
	String email1=dto.getEmail().substring(0,idx);//0~(idx-1) 까지 추출
	String email2=dto.getEmail().substring(idx+1);//idx+1번지부터 끝까지 추출
%>
<body>
<form action="Memberupdate.jsp" method="post" class="form-inline" name="memberfrm">
<input type="hidden" name="num" value="<%=num%>">
<table class="table table-bordered" style="width: 500px;">
	<caption><b>회원정보수정</b></caption>
	
	<tr>
		<th width="100" bgcolor="#aaa">이름</th>
		<td>
			<input type="text" name="name"  class="form-control"
				required="required" style="width: 120px;"
				value="<%=dto.getName()%>">			
		</td>
	</tr>
	<tr>
		<th width="100" bgcolor="#aaa">핸드폰</th>
		<td>
			<input type="text" name="hp"  class="form-control"
				required="required" style="width: 200px;"
				value="<%=dto.getHp()%>">			
		</td>
	</tr>
	<tr>
		<th width="100" bgcolor="#aaa">주소</th>
		<td>
			<input type="text" name="addr"  class="form-control"
				required="required" style="width: 400px;"
				value="<%=dto.getAddr()%>">			
		</td>
	</tr>
	<tr>
		<th width="100" bgcolor="#aaa">이메일</th>
		<td>
			<input type="text" name="email1"  class="form-control"
				required="required" style="width: 80px;"
				value="<%=email1%>">	
			<b>@</b>
			<input type="text" name="email2" id="email2" class="form-control"
				required="required" style="width: 150px;"
				value="<%=email2%>">	
			<select id="selemail" class="form-control">
				<option value="-">직접입력</option>
				<option value="naver.com">네이버</option>
				<option value="nate.com">네이트</option>
				<option value="gmail.com">구글</option>
				<option value="hanmail.net">다음</option>				
			</select>	
		</td>
	</tr>
	<tr>
		<td align="center" colspan="2">
			<button type="submit" class="btn btn-default"
			style="width: 100px;">수정하기</button>
			
			<button type="reset" class="btn btn-default"
			style="width: 100px;">다시하기</button>
			
		</td>		
	</tr>
</table>
</form>
</body>
</html>
