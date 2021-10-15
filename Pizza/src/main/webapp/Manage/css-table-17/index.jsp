
<%@page import="MemberDto.MemberDto"%>
<%@page import="MemberDao.MemberDao"%>
<%@page import="java.text.SimpleDateFormat"%>

<%@page import="java.util.List"%>

<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<!-- Required meta tags -->
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <link href="https://fonts.googleapis.com/css?family=Roboto:300,400&display=swap" rel="stylesheet">

    <link rel="stylesheet" href="fonts/icomoon/style.css">

    <link rel="stylesheet" href="css/owl.carousel.min.css">

    <!-- Bootstrap CSS -->
    <link rel="stylesheet" href="css/bootstrap.min.css">
    
    <!-- Style -->
    <link rel="stylesheet" href="css/style.css">
   
    <title>회원목록</title>
    
 	
   <style type="text/css">
   		div.btn{
   			position: absolute;
   			top:600px; 
   			left: 1175px;
   			

   		}	
   		
   </style>
   

</head>
<% 
	//전체 멤버정보 가져오기
	MemberDao dao=new MemberDao();
	List<MemberDto> list=dao.getAllMembers();
	SimpleDateFormat sdf=new SimpleDateFormat("yyyy-MM-dd");
	int no=1;
%>
<body>
<div class="content">
     
    <div class="container">
      <h2 class="mb-5"><div class="glyphicon glyphicon-th-list"></div>회원전체목록</h2>

      <div class="table-responsive">

        <table class="table table-striped custom-table">
          <thead>
            <tr>
              <th scope="col"></th>
              <th scope="col"></th>
             
              <th scope="col">이름</th>
              <th scope="col">아이디,비밀번호</th>
              <th scope="col">주소</th>
              <th scope="col">e-mail</th>
              <th scope="col">전화번호</th>
              
            </tr>
            	<%
	for(MemberDto dto:list)
	{%>
          </thead>
          <tbody>
            <tr scope="row">
              <td></td>
              <td>
              <%=no++%>
              </td>
              <td class="pl-0">
                <div class="d-flex align-items-center">
                  <label class="custom-control ios-switch">
                  <input type="checkbox" class="ios-switch-control-input" checked="">
                  
                  </label>

                  <%=dto.getName()%>
                </div>
              </td>
              <td>
                <%=dto.getId()%>
                <small class="d-block"><%=dto.getPass() %></small>
              </td>
              <td><%=dto.getAddr() %></td>
              <td><%=dto.getEmail() %></td>
              <td><%=dto.getHp() %></td>
              <td>
              <button type="button" class="btn btn-secondary" style="padding-right: 0px; padding-left: 12px;"
              onclick="location.href='updatepass.jsp?num=<%=dto.getNum()%>'">
              수정 </button>
  	 		  <button type="button" class="btn btn-secondary" style="padding-right: 0px; padding-left: 12px;" class="delete"
  	 		   onclick="delfunc(<%=dto.getNum()%>)">
  	 		  삭제 </button>
  	 		  </td>
            
            </tr>

            
            
          </tbody>
<%}
	%>
        </table>
      </div>


    </div>

  </div>
<!-- 삭제 Modal -->
  <div class="modal fade" id="myModal" role="dialog">
    <div class="modal-dialog modal-sm">
    
      <!-- Modal content-->
      <div class="modal-content">
        <div class="modal-header">
          <button type="button" class="close" data-dismiss="modal">&times;</button>
         
        </div>
        <div class="modal-body form-inline">
          <input type="hidden" id="delnum">
          <b>삭제비밀번호:</b>
          <input type="password" id="delpass" class="form-control"
            style="width:120px;">
        </div>
        <div class="modal-footer">
          <button type="button" class="btn btn-default delbtn" data-dismiss="modal">삭제</button>
        </div>
      </div>
      
    </div>
  </div>
  
  <script type="text/javascript">
  	function delfunc(num){
  		//alert(num);
  		$("#delnum").val(num);
  		$("#myModal").modal();
  		
  		//삭제 버튼 이벤트
  		$("button.delbtn").click(function(){
  			//num,pass 읽기
  			var num=$("#delnum").val();
  			var pass=$("#delpass").val();
  			//삭제파일 호출
  			location.href="delete.jsp?num="+num+"&pass="+pass;  			
  		});
  	}
  </script>	

 
    <script src="js/jquery-3.3.1.min.js"></script>
    <script src="js/popper.min.js"></script>
    <script src="js/bootstrap.min.js"></script>
    <script src="js/main.js"></script>
</body>
</html>