<%@page import="MemberDto.MemberDto"%>
<%@page import="MemberDao.MemberDao"%>
<%@page import="java.util.List"%>
<%@page import="data.dto.PizzamenuDto"%>
<%@page import="data.dao.PizzamenuDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <title>피자 메뉴</title>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link rel="apple-touch-icon" href="assets/img/apple-icon.png">
    <link rel="shortcut icon" type="image/x-icon" href="assets/img/favicon.ico">
    <!-- Load Require CSS -->
    <link href="assets/css/bootstrap.min.css" rel="stylesheet">
    <!-- Font CSS -->
    <link href="assets/css/boxicon.min.css" rel="stylesheet">
    <link href="https://fonts.googleapis.com/css2?family=Open+Sans:wght@300;400;600&display=swap" rel="stylesheet">
    <!-- Load Tempalte CSS -->
    <link rel="stylesheet" href="assets/css/templatemo.css">
    <!-- Custom CSS -->
    <link rel="stylesheet" href="assets/css/custom.css">

</head>
<link href="https://fonts.googleapis.com/css2?family=Black+Han+Sans&display=swap" rel="stylesheet">
<style type="text/css">
.modal-header, h4, .close {
    background-color: #5cb85c;
    color:white !important;
    text-align: center;
    font-size: 30px;
  }
  .modal-footer {
    background-color: #f9f9f9;
  }
  
 
	.btnadd{
	font-family: "Noto Sans KR";
	}
	


</style>
	
<%
PizzamenuDao dao=new PizzamenuDao();
//메뉴 가져오기
List<PizzamenuDto> list=dao.getAllDatas();


//세션으로부터 아이디를 얻는다
String myid = (String) session.getAttribute("myid");
String loginok=(String)session.getAttribute("loginok");


MemberDao mdao = new MemberDao();
String num= mdao.getMemberNum(myid);
%>

<body>
    <!-- Start Banner Hero -->
    <div id="work_banner" class="banner-wrapper bg-light w-100 py-5"
    style="background-image: url('pizzaimg/cookpizza.png');">
        <div class="banner-vertical-center-work container text-light d-flex justify-content-center align-items-center py-5 p-0">
          
            <div class="banner-content col-lg-8 col-12 m-lg-auto text-center">
              
              <%
             if(loginok!=null && myid.equals("admin")){%>
                <h1 class="banner-heading h2 display-3 pb-5 typo-space-line-center">메뉴 관리</h1>
                <h3 class="h4 pb-2">메뉴 등록</h3>
               <br>
                <button type="submit" class="btn rounded-pill btn-light px-4 me-4 btnadd" onclick="location.href='index.jsp?main=pizzamenu/menuaddform.jsp'"
                >메뉴 등록</button>
                <button type="submit" class="btn rounded-pill btn-danger text-light px-4 btnupdel" onclick="location.href='pizzamenu/poutaction.jsp'">관리자 로그아웃</button>
             <%}else{%>
             <h1 class="banner-heading h2 display-3 pb-5 typo-space-line-center">메뉴</h1>
             
                <%}%>
           </div>
           
        </div>
    </div>
    <!-- End Banner Hero -->
<br>
<br>
    <!-- Start Our Work -->
        <div class="">
            <div class="text-center col-auto">
            	<a class="filter-btn btn rounded-pill btn-outline-danger border-0 m-md-2 px-md-4">전체메뉴</a>
                <a class="filter-btn btn rounded-pill btn-outline-danger border-0 m-md-2 px-md-4">피자</a>
                <a class="filter-btn btn rounded-pill btn-outline-danger border-0 m-md-2 px-md-4">사이드메뉴</a>
                <a class="filter-btn btn rounded-pill btn-outline-danger border-0 m-md-2 px-md-4">음료/기타</a>
            </div>
        </div>
        <!-- 메뉴출력 -->

 <section class="container overflow-hidden py-5">
        <div class="row gx-5 gx-sm-4 gx-lg-5 gy-lg-5 gy-4 pb-4 projects" >
		<%
        for(PizzamenuDto dto:list){%>
              <a class="col-sm-6 col-lg-4 text-decoration-none project marketing social business">
                <div class="service-work card mb-5 mx-5 m-sm-0">
                    <img class="card-img-top photo" src="save/<%=dto.getPhotoname()%>">
                    <div class="card-body">
                        <h5 class="card-title text-dark"><%=dto.getPname()%></h5>
                        <h5 class="card-title text-dark"><%=dto.getPrice()%></h5>
      
                        <span class="text-decoration-none text-primary">
                             <i class='bx bxs-hand-right ms-1' style="font-size: 1.1em;"
                             onclick="location.href='index.jsp?main=pizzamenu/menudetail.jsp?num=<%=dto.getNum()%>'">detail</i>
                          </span>
                    </div>
                </div>
 			
            </a>
	<%}
        %>
</div>
</section>



    <!-- Bootstrap -->
    <script src="assets/js/bootstrap.bundle.min.js"></script>
    <!-- Lightbox -->
    <script src="assets/js/fslightbox.js"></script>
    <script>
        fsLightboxInstances['gallery'].props.loadOnlyCurrentSource = true;
    </script>
    <!-- Load jQuery require for isotope -->
    <script src="assets/js/jquery.min.js"></script>
    <!-- Isotope -->
    <script src="assets/js/isotope.pkgd.js"></script>
    <!-- Page Script -->
    <script>
        $(window).load(function() {
            // init Isotope
            var $projects = $('.projects').isotope({
                itemSelector: '.project',
                layoutMode: 'fitRows'
            });
            $(".filter-btn").click(function() {
                var data_filter = $(this).attr("data-filter");
                $projects.isotope({
                    filter: data_filter
                });
                $(".filter-btn").removeClass("active");
                $(".filter-btn").removeClass("shadow");
                $(this).addClass("active");
                $(this).addClass("shadow");
                return false;
            });
           
        });
    </script>
    <!-- Templatemo -->
    <script src="assets/js/templatemo.js"></script>
    <!-- Custom -->
    <script src="assets/js/custom.js"></script>

</body>
</html>