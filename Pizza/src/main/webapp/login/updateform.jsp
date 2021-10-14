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
String num = request.getParameter("num");
//dao 선언
MemberDao dao = new MemberDao();
//dto 얻기
MemberDto dto = dao.getMember(num);
//이메일 분리하기(@기준으로)
int idx = dto.getAddr().indexOf(',');
String addr1 = dto.getAddr().substring(0, idx);//0부터 idx-1 까지 추출
String addr2 = dto.getAddr().substring(idx + 1);//idx+1부터 끝까지 추출

int idx1=dto.getEmail().indexOf('@');
String email1=dto.getEmail().substring(0,idx1);//0부터 idx-1 까지 추출
String email2=dto.getEmail().substring(idx1+1);//idx+1부터 끝까지 추출
%>
<body>
	<h3
		style="margin-left: 50px; margin-top: 50px; font-family: Black Han Sans;">수정페이지</h3>
	<form action="login/memberupdate.jsp" method="post" class="form-inline"
		name="memberfrm">
		<input type="hidden" name="num" value="<%=num%>">
		<table class="table table-bordered"
			style="width: 500px; margin-left: 580px;">
			<tr>
				<th width="100" bgcolor="#aaa">이름</th>
				<td><input type="text" name="name" class="form-control"
					required="required" style="width: 120px;"
					value="<%=dto.getName()%>"></td>
			</tr>
			<tr>
				<th width="100" bgcolor="#aaa">핸드폰</th>
				<td><input type="text" name="hp" class="form-control"
					required="required" style="width: 150px;" value="<%=dto.getHp()%>">
				</td>
			</tr>

			<tr>
				<th width="100" bgcolor="#aaa">주소</th>
				<td><input type="text" name="addressName" id="userZipcode"
					placeholder="우편번호 입력" readonly class='box' /> <input type="button"
					value="주소 검색" onclick="findAddr()"><br> <input
					type="text" name="addressName1" id="addr1" value="<%=addr1%>"
					readonly class='box' /> <br> <input type="text"
					name="addressName2" id="addr2" class="form-control"
					value="<%=addr2%>" /> <br></td>
			</tr>
			<tr>
		<th width="100" bgcolor="#aaa">이메일</th>
		<td>
			<input type="text" name="email1"
				required="required" style="width: 80px;"
				value="<%=email1%>">
			<b>@</b>
			<input type="text" name="email2" id="email2"
				required="required" style="width: 150px;"
				value="<%=email2%>">
			<select id="selemail">
				<option value="-">직접입력</option>
				<option value="naver.com">네이버</option>
				<option value="nate.com">네이트</option>
				<option value="gmail.com">구글</option>
				<option value="hanmail.com">다음</option>
			</select>
		</td>
	</tr>
			<tr>
				<td align="center" colspan="2">
					<button type="submit" class="btn btn-default" style="width: 100px;">수정</button>
				</td>
			</tr>


		</table>
		<br>
		<br>
	</form>



</body>
</html>