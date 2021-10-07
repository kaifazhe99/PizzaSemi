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
<h2>JSP는 HTML5 구조에 자바코드를 사용할수 있는 서버언어이다</h2>
<h2>Servlet 은 확장자가 java 이며 자바클래스 구조에<br>html,css,javascript 도 사용할수 있는 서버언어이다</h2>
<hr>
<h4>jsp 에서는 두가지의 주석처리가 가능하다</h4>
<!-- 주석1 : html 기본 주석:소스보기에서 보인다 -->
<%-- jsp 주석 : 소스보기에서 안보인다. 안에 자바코드가 있을경우 이 주석은 비실행
  위의 html 주석은 실행 --%>

<%!  //선언문
     //이곳에서 선언한 변수나 메서드는 클래스의 멤버변수나 메서드로 등록된다
     //그러므로 위치는 어디에 있던 상관이 없다
%>

<%  //스크립트릿
	//여기서 선언하는 변수는 지역변수로 등록이된다
	//그래서 이곳의 변수를 html 영역에서 사용하려면
	//선언한 곳보다는 아래에서 사용해야만 한다
%>

<%= "Happy"  %> <!-- 표현식,문자열출력 --> 
</body>
</html>










