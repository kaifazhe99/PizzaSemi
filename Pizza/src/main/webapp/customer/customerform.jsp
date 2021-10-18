<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link href="https://fonts.googleapis.com/css2?family=Black+Han+Sans&display=swap" rel="stylesheet">
<script src="https://code.jquery.com/jquery-3.5.0.js"></script>	
<%
	//프로젝트의 경로
	String root=request.getContextPath();
%>
<!-- se2 폴더에서 js 파일 가져오기 -->
<script type="text/javascript" src="<%=root%>/se2/js/HuskyEZCreator.js"
	charset="utf-8"></script>

<script type="text/javascript" src="<%=root%>/se2/photo_uploader/plugin/hp_SE2M_AttachQuickPhoto.js"
	charset="utf-8"></script>
</head>
<body>
<div style="height: 500px; margin-bottom: 250px;" align="center">
<form action="customer/customeraction.jsp" method="post">
<br><br>
	<h2 style="font-family: 'Black Han Sans';">고객의 소리</h2>
	<br>
	<table class="table table-bordered" style="width: 900px; 
		border-right:white;border-top:#e0e0e0;border-left:white;border-bottom:#e0e0e0;">
		<tr>
			<th bgcolor="orange" width="100" valign="middle" style="text-align: center;">제&nbsp;&nbsp;&nbsp;목</th>
			<td align="left">
				<input type="text" name="subject" class="form-control"
					required="required" style="width: 100%;">
			</td>
		</tr>
		<tr >
			<td colspan="2">
				<textarea name="content" id="content"		
					required="required"			
					style="width: 100%;height: 400px;display: none;"></textarea>		
			
			</td>
		</tr>
		<tr>
			<td colspan="2" align="center">
				<button type="button" class="btn btn-primary"
					style="width: 120px;"
					onclick="submitContents(this)">저장</button>
				
				<button type="button" class="btn btn-primary"
					style="width: 120px;"
					onclick="location.href='index.jsp?main=customer/customerlist.jsp'">취소</button>
			</td>
		</tr>		
	</table> 
</form>
</div>
<!-- 스마트게시판에 대한 스크립트 코드 넣기 -->
<script type="text/javascript">
var oEditors = [];

nhn.husky.EZCreator.createInIFrame({

    oAppRef: oEditors,

    elPlaceHolder: "content",

    sSkinURI: "<%=request.getContextPath()%>/se2/SmartEditor2Skin.html",

    fCreator: "createSEditor2"

}); 

//‘저장’ 버튼을 누르는 등 저장을 위한 액션을 했을 때 submitContents가 호출된다고 가정한다.

function submitContents(elClickedObj) {

    // 에디터의 내용이 textarea에 적용된다.

    oEditors.getById["content"].exec("UPDATE_CONTENTS_FIELD", [ ]);

 

    // 에디터의 내용에 대한 값 검증은 이곳에서

    // document.getElementById("textAreaContent").value를 이용해서 처리한다.
    try {
        elClickedObj.form.submit();
    } catch(e) { 

    }

}

// textArea에 이미지 첨부

function pasteHTML(filepath){
    var sHTML = '<img width="600" src="<%=request.getContextPath()%>/save/'+filepath+'">';
    oEditors.getById["content"].exec("PASTE_HTML", [sHTML]); 

}
</script>

</body>
</html>