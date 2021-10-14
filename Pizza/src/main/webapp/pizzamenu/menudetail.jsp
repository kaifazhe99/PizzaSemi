<%@page import="MemberDao.MemberDao"%>
<%@page import="data.dao.PizzamenuDao"%>
<%@page import="data.dto.PizzamenuDto"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>상세메뉴</title>
<link href="https://fonts.googleapis.com/css2?family=East+Sea+Dokdo&display=swap" rel="stylesheet">
<style type="text/css">
span.camera {
	font-size: 1.3em;
	cursor: pointer;
}

ul.pdetail{
list-style:none;
 text-align: center;
 font-size:1.7em;
 font-family: 'East Sea Dokdo';
}
</style>
<%
//num 읽기
String num=request.getParameter("num");


//db에서 num에 대당하는 dto얻기
PizzamenuDao dao=new PizzamenuDao();
PizzamenuDto dto=dao.getData(num);

//세션으로부터 아이디를 얻는다
String myid = (String) session.getAttribute("myid");
String loginok=(String)session.getAttribute("loginok");


MemberDao mdao = new MemberDao();
String pnum= mdao.getMemberNum(myid);
%>
<script type="text/javascript">

	//이미지 미리보기 할 함수
	function readUrl(input) {
		if (input.files[0]) {
			var reader = new FileReader();
			reader.onload = function(e) {
				$("#showimg").attr("src", e.target.result);
			}
			reader.readAsDataURL(input.files[0]);
		}
	}
	
	//삭제
	function fnDel(num) {
//alert("num: " + pnum); 
		if(confirm("정말 삭제하시겠습니까?")==true) {
			location.href = "pizzamenu/deleteaction.jsp?num=" + num;
		}else{ //취소
			return false;
		}
		
	}

	
	

</script>
</head>
<body>
<div id="work_banner" class="banner-wrapper bg-light w-100 py-5"
    style="background-image: url('pizzaimg/cookpizza.png');">
        <div class="banner-vertical-center-work container text-light d-flex justify-content-center align-items-center py-5 p-0">
          
            <div class="banner-content col-lg-8 col-12 m-lg-auto text-center">
              
              <%
             if(loginok!=null && myid.equals("admin")){%>
                <h1 class="banner-heading h2 display-3 pb-5 typo-space-line-center">상세메뉴 관리</h1>
                <h3 class="h4 pb-2">메뉴 내용 수정, 삭제 페이지</h3>
               <br>
                <button type="submit" class="btn rounded-pill btn-light px-4 me-4 btnadd"
                onclick="location.href='index.jsp?main=pizzamenu/updateform.jsp?num=<%=num%>'">메뉴 수정</button>
               	<button type="submit" class="btn rounded-pill btn-danger px-4 me-4"
               	onclick="fnDel('<%=num%>')">삭제</button>
             <%}else{%>
             <h1 class="banner-heading h2 display-3 pb-5 typo-space-line-center">상세메뉴</h1>
             
                <%}%>
           </div>
           
        </div>
    </div>
	<!-- Start Work Sigle -->
    <section class="container py-5">

        <div class="row pt-5" style="text-align: center;">
            <div class="worksingle-content col-lg-8 m-auto text-left justify-content-center">
                <h2 class=""
                style="font-size:3em;"><%=dto.getPname()%></h2>
                <p class="worksingle-footer text-muted">
                    <%=dto.getPrice()%>
                </p>
            </div>
        </div><!-- End Blog Cover -->

        <div class="row justify-content-center pb-4">
            <div class="col-lg-8">
                <div><center>
                    <img class="img-fluid border rounded" src="save/<%=dto.getPhotoname()%>" alt="Card image cap"
                    style="max-width: 500px;"></center>
                </div>
                <br>
                <div class="worksingle-slide-footer row">
                    <p class="typo-space-line-center" style="font-size:1.4em; text-align: center;">
                    <%=dto.getContent()%>
                </p>
                </div>
                <br><br>
                <div>
                 <p>
                    <ul class="pdetail">
                    <li style="text-decoration: underline; text-underline-position: under; font-size:1.7em;">피자캠프만의 특징!</li>
                    <br>
                    <li style="text-decoration: overline underline; text-underline-position: under;
                    font-size:2em; background-color: #FAFAD2">매일매일 만들어 신선하고 쫄깃 고소한 도우!</li>
                    <br>
                    <li>최고의 도우 맛을 위해 최적의 비율로 매일 반죽하여 냉장저온(1~3°C) 숙성한 도우!
수분 보유량이 우수하고 도우 입자 사이의 공기층이 적절히 형성된 3일~7일 차 도우를 사용해 전문 피자메이커가 핸드토스드(Hand Tossed) 방식으로 만들어 특유의 쫄깃하고 포실포실한 식감과 맛, 향을 제공합니다.</li>
                    <br>
                    <li style="text-decoration: overline underline; text-underline-position: under;
                    font-size:2em; background-color: #FAFAD2">깊고 풍부한 맛, 시그니처 치즈!</li>
                    <br>
                    <li>연구 개발된 시그니처 치즈는 미국 농무성에서 인정한 최상 A등급 프리미엄 우유로 생산되어 최고의 맛과 풍미를 자랑하는 모차렐라 피자치즈 입니다. 게다가 페타크림치즈, 체더치즈, 콰트로치즈퐁듀, 보코치니 등 고급프리미엄 피자치즈를 사용함으로써 피자의 품격을 높여 더욱 맛있는 피자를 완성하였습니다.</li>
                    <br>
                    <li style="text-decoration: overline underline; text-underline-position: under;
                    font-size:2em; background-color: #FAFAD2">신선한 캘리포니아산 프리미엄 토마토 소스!</li>
                    <br>
                    <li>캘리포니아에 위치한 대규모 (35만 에이커) 토마토 농장)에서 70일 동안 잘 익은 토마토는 빠른시간 (4~6시간)내 모든 가공 처리가 이루어져 신선함이 살아있습니다. 캘리포니아산 토마토는 과육이 풍부해 피자 소스로 만들었을 때 당도, 산미, 감칠맛이 극상의 조화를 이루기 때문에 피자 맛에 깊이를 더합니다.</li>
                     </ul>
                </p> 
		</div>
		</div>
		&nbsp;
		<div style="text-align: center;">
		<button type="submit" class="btn btn-danger rounded-pill px-md-5 px-4 py-2 radius-0 text-light"
				onclick="" >주문하기</button>
				<button type="submit" class="btn btn-danger rounded-pill px-md-5 px-4 py-2 radius-0 text-light"
				onclick="location.href='index.jsp?main=pizzamenu/menulist.jsp'"
				>목록</button>
		</div>
		
	</section>
	<!-- End Contact -->
</body>
</html>