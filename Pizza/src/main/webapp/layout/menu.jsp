<%@page import="MemberDao.MemberDao"%>
<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html>
<html>
<head>
    <title>Purple Buzz HTML Template with Bootstrap 5 Beta 1</title>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link rel="apple-touch-icon" href="mainmenu/img/apple-icon.png">
    <link rel="shortcut icon" type="image/x-icon" href="mainmenu/img/favicon.ico">
    <!-- Load Require CSS -->
    <link href="mainmenu/css/bootstrap.min.css" rel="stylesheet">
    <!-- Font CSS -->
    <link href="mainmenu/css/boxicon.min.css" rel="stylesheet">
    <link href="https://fonts.googleapis.com/css2?family=Open Sans:wght@300;400;600&display=swap" rel="stylesheet">
    <link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@700&display=swap" rel="stylesheet">
    <!-- Load Tempalte CSS -->
    <link rel="stylesheet" href="mainmenu/css/templatemo.css">
    <!-- Custom CSS -->
    <link rel="stylesheet" href="mainmenu/css/custom.css">
</head>
<%
//세션으로부터 아이디를 얻는다
String myid = (String) session.getAttribute("myid");
String loginok=(String)session.getAttribute("loginok");
//db로 부터 아이디에 해당하는 이름을 얻는다
MemberDao dao = new MemberDao();
String name = dao.getName(myid);
%>


<body>
   <!-- Header -->
    <nav id="main_nav" class="navbar navbar-expand-lg navbar-light bg-white shadow">
        <div class="container d-flex justify-content-between align-items-center">
            <a class="navbar-brand h1" href="index.jsp">
            <img src="mainmenu/img/logo.png" style="width: 55px;">
                <span class="pizzafont" style="vertical-align: middle;">피자캠프</span>
            </a>
            <button class="navbar-toggler border-0" type="button" data-bs-toggle="collapse" data-bs-target="#navbar-toggler-success" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
                <span class="navbar-toggler-icon"></span>
            </button>

            <div class="align-self-center collapse navbar-collapse flex-fill  d-lg-flex justify-content-lg-between" id="navbar-toggler-success">
                <div class="flex-fill mx-xl-5 mb-2">
                    <ul class="nav navbar-nav d-flex justify-content-between mx-xl-5 text-center text-dark">
                        <li class="nav-item">
                            <a class="nav-link btn-outline-warning rounded-pill px-3" href="index.jsp?main=pizzamenu/menulist.jsp">메뉴</a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link btn-outline-warning rounded-pill px-3" href="index.jsp?main=map/pizzamap.jsp">매장위치</a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link btn-outline-warning rounded-pill px-3" href="">이벤트</a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link btn-outline-warning rounded-pill px-3" href="index.jsp?main=customer/customerlist.jsp">커뮤니티</a>
                        </li>
                    </ul>
                </div>
                <div class="navbar align-self-center d-flex">
                    <a class="nav-link text-dark" href="#"><i class='bx bx-cart bx-sm text-danger'></i>장바구니</a>
                    <% if(loginok!=null){
                    	%>
                    	<a class="nav-link text-dark" href="index.jsp?main=login/loginmain.jsp"><i class='bx bx-user-circle bx-sm text-danger'></i><%=name+"님" %></a>
                    	<button type="button" class="btn btn-danger" style="width: 100px;"
							onclick="location.href='login/logoutaction.jsp'">로그아웃</button>
                    <%}else{%>
                    <a class="nav-link text-dark" href="index.jsp?main=login/loginmain.jsp"><i class='bx bx-user-circle bx-sm text-danger'></i>로그인</a>
                    <%}%>
                </div>
            </div>
        </div>
    </nav>
    <!-- Close Header -->
</body>
</html>