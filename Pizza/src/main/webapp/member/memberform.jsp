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
			if($(this).val()=="-"){
				$("#email2").val('');//지정된 메일 지우기
				$("#email2").foucs();//포커스 주기
			}else{
				$("#email2").val($(this).val());
			}
		});
		
		//아이디 입력버튼 이벤트
		$("#btnidcheck").click(function() {
			window.open("member/idsearch.jsp","","width=300px,height=300px,left=700px,top=100px");
		});
		
	});
	
	function check(f) {
		if(f.id.value.length==0){
			alert("아이디를 입력해주세요");
			return false;//action이 호출되지 않는다
		}
		if(f.pass.value!=f.pass2.value){
			alert("비밀번호가 서로 다릅니다");
			f.pass.value="";
			f.pass2.value="";
			return false;//action이 호출되지 않는다
		}
		if(f.pass.value.length<8){
			alert("비밀번호는 8자리 이상으로 해주세요");
			f.pass.value="";
			f.pass2.value="";
		}
		return true;
		
	}
</script>
</head>
<body>
<h3 style="margin-left: 50px; margin-top: 50px; font-family: Black Han Sans;" >회원가입</h3>
<form action="member/memberadd.jsp" method="post" class="form-inline" name="memberfrm" style="margin-left: 580px; margin-top: 50px;"
	onsubmit="return check(this)">
<table class="table table-bordered" style="width: 500px;">
	<tr>
		<th width="100" bgcolor="#aaa">아이디</th>
		<td>
			<input type="text" name="id" maxlength="15"
				required="required" style="width: 200px;" readonly="readonly">&nbsp;
			<button type="button" class="btn btn-danger btn-sm" id="btnidcheck">아이디입력</button>
		</td>
	</tr>
	<tr>
		<th width="100" bgcolor="#aaa">비밀번호</th>
		<td>
			<input type="password" name="pass" 
				required="required" style="width: 200px;" placeholder="비밀번호">
		</td>
	</tr>
	<tr>
		<th width="100" bgcolor="#aaa">비밀번호 확인</th>
		<td>
			<input type="password" name="pass2"
				required="required" style="width: 200px;" placeholder="비밀번호확인">
		</td>
	</tr>
	<tr>
		<th width="100" bgcolor="#aaa">이름</th>
		<td>
			<input type="text" name="name"
				required="required" style="width: 120px;">
		</td>
	</tr>
	<tr>
		<th width="100" bgcolor="#aaa">핸드폰</th>
		<td>
			<input type="text" name="hp"
				required="required" style="width: 200px;">
		</td>
	</tr>
	
	<tr>
		<th width="100" bgcolor="#aaa">주소</th>
		<td>
			<input type="text" name="addr"
				required="required" style="width: 400px;">
		</td>
	</tr>
	<tr>
		<th width="100" bgcolor="#aaa">이메일</th>
		<td>
			<input type="text" name="email1"
				required="required" style="width: 80px;">
			<b>@</b>
			<input type="text" name="email2" id="email2"
				required="required" style="width: 150px;">
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
			<button type="submit" class="btn btn-default" style="width: 100px;">저장하기</button>
			<button type="reset" class="btn btn-default" style="width: 100px;">다시하기</button>
		</td>
	</tr>
	
</table>
</form>

</body>
</html>