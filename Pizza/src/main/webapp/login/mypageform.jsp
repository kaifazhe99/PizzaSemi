<%@page import="MemberDto.MemberDto"%>
<%@page import="MemberDao.MemberDao"%>
<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>Insert title here</title>
 <link rel="stylesheet" href="//code.jquery.com/ui/1.13.0/themes/base/jquery-ui.css">
  <link rel="stylesheet" href="/resources/demos/style.css">

  <script src="https://code.jquery.com/ui/1.13.0/jquery-ui.js"></script>

 <script>
  $( function() {
    $( "#dialog" ).dialog({
      autoOpen: false,
      show: {
        effect: "blind",
        duration: 1000
      },
      hide: {
        effect: "explode",
        duration: 1000
      }
    });
 
    $( ".delbtn" ).on( "click", function() {
    	var num=$(this).attr("num");
    	//$("#spannum").val(num);
		//$("#delbtn").val(num);
    
    	
    	$("#delask").click(function(){
			//pass 읽기
			var num=$(".delbtn").attr("num");
			var pass=$("#delpass").val();
			//삭제파일 호출
			location.href="member/memberdelete.jsp?num="+num+"&pass="+pass;
			
		});
    	
    	
      $( "#dialog" ).dialog( "open" );
      
	      
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
%>
<div id="dialog" title="탈퇴하기">
  <p>
  	<span id="spannum"></span>
  	<input type="password" id="delpass" style="width: 120px;">
  	<button id="delask">삭제하기</button>
  	
  </p>
</div>

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
			<%-- <button type="button" class="btn btn-default delbtn" style="width: 100px;" onclick="delfunc(<%=num%>)">틸퇴하기</button> --%>
			<button type="button" class="btn btn-default delbtn" style="width: 100px;" num="<%=num%>">탈퇴하기</button>
		</td>
	</tr>
	
	
</table>
<br><br>






</body>
</html>