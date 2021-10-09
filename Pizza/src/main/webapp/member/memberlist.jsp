<%@page import="MemberDto.MemberDto"%>
<%@page import="MemberDao.MemberDao"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>Insert title here</title>
 <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
</head>
<body>
<%
	MemberDao dao=new MemberDao();
	List<MemberDto> list=dao.getAllMembers();
	SimpleDateFormat sdf=new SimpleDateFormat("yyyy-MM-dd");
%>
<table class="table table-bordered" style="width: 900px;">
	<caption><b>회원 정보 출력</b></caption>
	<tr bgcolor="orange">
		<th width="50">번호</th>
		<th width="70">이름</th>
		<th width="70">아이디</th>
		<th width="150">핸드폰</th>
		<th width="150">주소</th>
		<th width="150">이메일</th>
		<th width="100">가입일</th>
		<th width="100">수정/삭제</th>
	</tr>
	<%
	for(int i=0;i<list.size();i++)
	{
		MemberDto dto=list.get(i);
	%>
		<tr>
			<td><%=i+1 %></td>
			<td><%=dto.getName() %></td>
			<td><%=dto.getId() %></td>
			<td><%=dto.getHp() %></td>
			<td><%=dto.getAddr() %></td>
			<td><%=dto.getEmail() %></td>
			<td><%=sdf.format(dto.getGaipday()) %></td>
			<td	align="center">
				<button type="button" class="btn btn-info btn-xs"
				onclick="location.href='index.jsp?main=member/updatepassform.jsp?num=<%=dto.getNum()%>'">수정</button>
				<button type="button" class="btn btn-danger btn-xs"
				onclick="delfunc(<%=dto.getNum()%>)">삭제</button>
			</td>
		</tr>
	<%}
	%>
</table>

	<!-- 삭제 Modal -->
	<div class="modal fade" id="myModal" role="dialog">
		<div class="modal-dialog modal-sm">

			<!-- Modal content-->
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal">&times;</button>
					<h4 class="modal-title">삭제 확인</h4>
				</div>
				<div class="modal-body form-inline">
					<input type="hidden" id="delnum">
					<b>삭제비밀번호</b>
					<input type="password" id="delpass" class="form-control"
						style="width: 120px;">
				</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-default delbtn" data-dismiss="modal">삭제</button>
				</div>
			</div>

		</div>
	</div>


	<script type="text/javascript">
		function delfunc(num) {
			//alert(num);
			$("#delnum").val(num);
			$("#myModal").modal();
			
			//삭제버튼 이벤트
			$("button.delbtn").click(function(){
				//num, pass 읽기
				var num=$("#delnum").val();
				var pass=$("#delpass").val();
				//삭제파일 호출
				location.href="member/memberdelete.jsp?num="+num+"&pass="+pass;
				
			});
		}
	</script>



</body>
</html>












