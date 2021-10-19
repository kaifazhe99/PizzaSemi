<%@page import="java.util.List"%>
<%@page import="data.dao.CommentDao"%>
<%@page import="data.dto.CommentDto"%>
<%@page import="MemberDao.MemberDao"%>
<%@page import="data.dto.CustomerDto"%>
<%@page import="data.dao.CustomerDao"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>Insert title here</title>
<script type="text/javascript">
	$(function() {
		//댓글 삭제 이벤트
		$("span.cdel").click(function() {
			var idx=$(this).attr("idx");
			if(confirm('정말 삭제하시겠습니까?')){
				//alert(idx);
				$.ajax({
					type: "get",
					dataType: "html",
					url: "customer/commentdelete.jsp",
					data: {"idx":idx},
					success:function(){
						//새로고침
						location.reload();
					}
				});
			}else{
			return false;
			}
		});
		
		$("button.delbtn").click(function() {
			var num=$(this).attr("num");
			if(confirm('정말 삭제하시겠습니까?')){				
				//alert(num);
				$.ajax({
					type: "get",
					dataType: "html",
					url: "customer/customerdelete.jsp",
					data: {"num":num},
					success:function(){
						console.log("delete");
						//새로고침
						location.href='index.jsp?main=customer/customerlist.jsp';
					}
				});
				
			}else{
				return false;
			}
			
		});
	});
</script>
</head>
<% 
	String loginok=(String)session.getAttribute("loginok");

	String num=request.getParameter("num");
	String currentPage=request.getParameter("currentPage");
	if(currentPage==null)
		currentPage="1";
	//key는 목록에서만 값이 넘어오고 그 이외는 null 값
	String key=request.getParameter("key");
	
	CustomerDao dao=new CustomerDao();
	//목록에서 올 경우에만 조회수 1 증가한다.
	if(key!=null)
		dao.updateViews(num);
	
	//num 에 해당하는 dto 얻기
	CustomerDto dto=dao.getData(num);
	
	SimpleDateFormat sdf=new SimpleDateFormat("yyyy-MM-dd HH:mm");
%>
<body>
	<br>
	<br>
	<div style="height: auto; margin-bottom: 100px;" align="center">
		<h2 style="font-family: 'Black Han Sans';">고객의 소리</h2>
		<br>
		<table class="table table-bordered"
			style="width: 900px; font-family: 'IBM Plex Sans KR'; border-right: white; border-top: black; border-left: white; border-bottom: #e0e0e0;">
			<% 
		MemberDao mdao=new MemberDao();
		String name=mdao.getName(dto.getMyid());
	%>
			<tr>
				<th><span style="font-size: 1.7em;"><%= dto.getSubject() %></span>
					<br> <span><img src="customer/profile.png"
						width="30px;" style="margin-top: 10px;"></span> <span
					style="color: black; font-size: 12pt; height: 20px; margin-left: 5px;"><%= name %></span>
					<span style="color: gray; font-size: 9pt; margin-left: 10px;">
						<%= sdf.format(dto.getWriteday()) %> &nbsp; 조회<%= dto.getViews() %>
				</span></th>
			</tr>
			<tr>
				<td style="height: 400px;">
					<div style="width: 100%;">
						<span style="font-family: 'IBM Plex Sans KR';"><%= dto.getContent() %></span>
					</div>
				</td>
			</tr>
			<tr>
				<td>
					<!-- 회원/비회원에게 보이는 부분 -->
					<button type="button" class="btn btn-sm btn-info"
						style="width: 80px; color: white;"
						onclick="location.href='index.jsp?main=customer/customerlist.jsp?currentPage=<%=currentPage%>'">목록</button>

					<% 
				String myid=(String)session.getAttribute("myid");
				if(loginok!=null && dto.getMyid().equals(myid)){	//로그인 상태일때만 입력폼이 보이도록 한다.
				%>
					<button type="button" class="btn btn-sm btn-info"
						style="width: 80px; color: white;"
						onclick="location.href='index.jsp?main=customer/updateform.jsp?num=<%=dto.getNum()%>&currentPage=<%=currentPage%>'">수정</button>

					<button type="button" class="delbtn btn btn-sm btn-info"
						style="width: 80px; color: white;" num="<%= dto.getNum() %>">삭제</button>
					<%}
				 if(loginok!=null && myid.equals("admin")){%>
                 <button type="button" class="delbtn btn btn-sm btn-info"
              	style="width: 80px; color: white;" num="<%= dto.getNum() %>">삭제</button>
            <%}
			%>
				</td>
			</tr>
			<!-- 댓글 &  추천 -->
			<tr>
				<td>
					<% 
							//각 방명록에 달린 댓글 목록 가져오기
							CommentDao adao=new CommentDao();
							List<CommentDto> clist=adao.getAllComment(dto.getNum());
					%> <span class="comment"
					style="cursor: pointer; font-family: 'IBM Plex Sans KR'; font-weight: bold;"
					num="<%= dto.getNum() %>">댓글 <a style="color: red;"><%= clist.size() %></a></span>
					<div class="commentlist"
						style="background-color: #f9f9f9; width: 900px; border: 1px solid #f6f6f6; border-radius: 5px; margin-bottom: 10px; margin-top: 5px;">
						<table>
							<% 
						for(CommentDto cdto:clist)
						{%>
							<tr style="font-family: 'IBM Plex Sans KR';">
								<td width="20" align="left"></td>
								<td>
									<% 
										//작성자명 얻기
										String cname=mdao.getName(cdto.getMyid());
									%> <br> <b style="font-size: 12pt; color: #626262;"><%= cname %></b>
									<% 
									//글 작성자와 댓글쓴 작성자가 같을 경우
									if(dto.getMyid().equals(cdto.getMyid())){%> <span
									style="color: red; font-size: 9pt;">작성자</span> <%}
									%> <br> <span style="font-size: 9pt; color: gray;">
										<%= sdf.format(cdto.getWriteday()) %>
								</span> <% 
									//댓글 삭제는 로그인중이면서 로그인한 아이디와 같을 경우에만 삭제 아이콘 보이게 하기
									if(loginok!=null && cdto.getMyid().equals(myid)){%> <span
									class="cdel" idx="<%= cdto.getIdx() %>"
									style="font-size: 10pt; cursor: pointer; margin-left: 10px; color: #626262;">삭제</span>
									<%}
									%> <br> <span style="font-size: 11pt;"> <%= cdto.getContent().replace("\n", "<br>") %>
								</span> <br>
								</td>
							</tr>
							<%}
						%>
						</table>
					</div>
					<div class="comment">
						<% 
						if(loginok!=null){	//입력폼은 로그인한 경우에만 보이게 하기
						%>
						<div class="commentform">
							<form action="customer/commentinsert.jsp" method="post">
								<input type="hidden" name="num" value="<%= dto.getNum() %>">
								<input type="hidden" name="myid" value="<%= myid %>"> <input
									type="hidden" name="currentPage" value="<%= currentPage %>">
								<table style="font-family: 'IBM Plex Sans KR';">
									<tr>
										<td width="480"><textarea
												style="width: 830px; height: 70px;" name="content"
												required="required" class="form-control" placehorlder="인터넷은 우리가 함께 만들어가는 소중한 공간입니다. 댓글 작성 시 타인에 대한 배려와 책임을 담아주세요."></textarea></td>
										<td>
											<button type="submit" class="btn btn-info"
												style="width: 70px; height: 70px; color: white;">등록</button>
										</td>
									</tr>
								</table>
							</form>
						</div>
						<%}
						%>
					</div>
				</td>
			</tr>
		</table>
	</div>
</body>
</html>