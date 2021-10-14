<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>Insert title here</title>

<script type="text/javascript">
	$(function() {
		//이메일 선택 이벤트
		$("#selemail").change(function() {
			if ($(this).val() == "-") {
				$("#email2").val('');//지정된 메일 지우기
				$("#email2").foucs();//포커스 주기
			} else {
				$("#email2").val($(this).val());
			}
		});

		//아이디 입력버튼 이벤트
		$("#btnidcheck").click(
				function() {
					window.open("member/idsearch.jsp", "",
							"width=300px,height=300px,left=700px,top=100px");
				});

	});

	function check(f) {
		if (f.id.value.length == 0) {
			alert("아이디를 입력해주세요");
			return false;//action이 호출되지 않는다
		}
		if (f.pass.value != f.pass2.value) {
			alert("비밀번호가 서로 다릅니다");
			f.pass.value = "";
			f.pass2.value = "";
			return false;//action이 호출되지 않는다
		}
		if (f.pass.value.length < 8) {
			alert("비밀번호는 8자리 이상으로 해주세요");
			f.pass.value = "";
			f.pass2.value = "";
			return false;
		}
		return true;

	}
</script>
</head>
<body>
	<h3
		style="margin-left: 50px; margin-top: 50px; font-family: Black Han Sans;">회원가입</h3>
	<form action="member/memberadd.jsp" method="post" class="form-inline"
		name="memberfrm" style="margin-left: 580px; margin-top: 50px;"
		onsubmit="return check(this)">
		<table class="table table-bordered" style="width: 550px;">
			<tr>
				<th width="120" bgcolor="#aaa">아이디</th>
				<td><input type="text" name="id" maxlength="15"
					required="required" style="width: 200px;" readonly="readonly">&nbsp;
					<button type="button" class="btn btn-danger btn-sm" id="btnidcheck">아이디입력</button>
				</td>
			</tr>
			<tr>
				<th width="120" bgcolor="#aaa" align="center">비밀번호</th>
				<td><input type="password" name="pass" required="required"
					style="width: 200px;" placeholder="비밀번호"></td>
			</tr>
			<tr>
				<th width="120" bgcolor="#aaa" align="center">비밀번호 확인</th>
				<td><input type="password" name="pass2" required="required"
					style="width: 200px;" placeholder="비밀번호확인"></td>
			</tr>
			<tr>
				<th width="120" bgcolor="#aaa" align="center">이름</th>
				<td><input type="text" name="name" required="required"
					style="width: 120px;"></td>
			</tr>
			<tr>
				<th width="120" bgcolor="#aaa" align="center">핸드폰</th>
				<td><input type="text" name="hp" required="required"
					style="width: 200px;"><br> <a>SMS 수신 동의/비동의</a><input
					type="checkbox"></td>
			</tr>

			<tr>
				<th width="120">주소</th>
				<td>
					<input type="text" name="addressName" id="userZipcode" placeholder="우편번호 입력" readonly class='box' />
                        <input type="button" value="주소 검색" onclick="findAddr()"><br>
					<input type="text" name="addressName1" id="addr1" placeholder="주소를 입력" readonly class='box' /> <br>
					<input type="text" name="addressName2" id="addr2" class="form-control" placeholder="상세 주소를 입력하세요"/> <br>
				</td>
			</tr>
			
			<tr>
				<th width="120" bgcolor="#aaa" align="center">이메일</th>
				<td><input type="text" name="email1" required="required"
					style="width: 80px;"> <b>@</b> <input type="text"
					name="email2" id="email2" required="required" style="width: 150px;">
					<select id="selemail">
						<option value="-">직접입력</option>
						<option value="naver.com">네이버</option>
						<option value="nate.com">네이트</option>
						<option value="gmail.com">구글</option>
						<option value="hanmail.com">다음</option>
				</select><br> <a>광고성 메일 수신 동의/비동의</a><input type="checkbox"></td>
			</tr>
			<tr>
				<td align="center" colspan="2">
					<button type="submit" class="btn btn-default" style="width: 100px;">저장하기</button>
					<button type="reset" class="btn btn-default" style="width: 100px;">다시하기</button>
				</td>
			</tr>

		</table>
	</form>
	
<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script>
// 사용할 function명 적어주기
function findAddr() {
	daum.postcode.load(function() {
		new daum.Postcode({
			oncomplete: function(data){
				// 각 주소의 규칙에 따라 주소 조합
				// 가져올 변수가 없을때는 공백을 가지기 때문에 이를 참고해 분기한다고 한다
				var addr = ''; //주소 변수
				
				
				// 사용자가 선택한 주소타입(도로명/지번)에 따라 해당 값 가져오기
				// 만약 사용자가 도로명 주소를 선택했을 때
				if (data.userSelectedType == 'R') {
					addr = data.roadAddress;
				// 만약 사용자가 구주소를 선택했을 때
				} else {
					addr = data.jibunaddress;
				}
				// 우편번호
				document.getElementById('userZipcode').value = data.zonecode;
				// 주소정보
				document.getElementById('addr1').value = addr;
				}
		}).open();
	});
}
</script>


</body>
</html>