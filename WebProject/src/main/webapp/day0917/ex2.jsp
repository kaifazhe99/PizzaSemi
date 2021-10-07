<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link href="https://fonts.googleapis.com/css2?family=Dokdo&family=Gaegu&family=Gugi&family=Nanum+Pen+Script&display=swap" rel="stylesheet">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
<script src="https://code.jquery.com/jquery-3.5.0.js"></script>
</head>
<body>
<h3>멤버변수 출력</h3>
<b>이름:<%=name%></b><br>
<b>나이:<%=age%>세</b><br>
<%!
	//서블릿으로 변환시 멤버변수로 등록
	String name="캔디";
	int age=23;
	
	//메서드 등록
	public String getCheck(){
		if(age>=20)
			return "성인입니다";
		else
			return "미성년자입니다";
	}
%>
<%=name%> 님의 나이는 <%=age%>세입니다<br>
<%=getCheck()%>
<hr>

<%
	String hp="010-5656-8989";
	String addr="서울 강남구";
	
	//내장객체 out 을 이용한 출력도 가능-브라우저로 출력
	out.print(name+"님의 핸드폰 번호는 "+hp+" 입니다<br>");
%>
<h5>핸드폰:<%=hp%></h5>
<h5>주소 : <%=addr %></h5>
</body>
</html>







