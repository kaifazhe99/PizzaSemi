<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">
span.camera {
	font-size: 1.3em;
	cursor: pointer;
}
</style>
<script type="text/javascript">
	$(function() {
		$("span.camera").click(function() {
			$("#photo").trigger("click");
		});
	});

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
</script>
</head>
<body>
	<!-- Start Banner Hero -->
	<div id="work_banner" "class="banner-wrapper bg-light w-100 py-5"
		style="background-image: url('pizzaimg/cookpizza.png');">
		<div
			class="banner-vertical-center-work container text-light d-flex justify-content-center align-items-center py-5 p-0">
			<div class="banner-content col-lg-8 col-12 m-lg-auto text-center">
				<h1 class="banner-heading h2 display-3 pb-5 semi-bold-600 typo-space-line-center">메뉴
					등록</h1>
			</div>
		</div>
	</div>
	<!-- End Banner Hero -->
	<!-- Start Contact -->
	<section class="container py-5">
		<div class="row pb-4">
			<i class='display-6 bx bx-news'></i> <br>
			<br>
			<!-- Start Contact Form -->
			<div class="col-lg-8 ">
				<form action="pizzamenu/addaction.jsp" method="post" enctype="multipart/form-data"
					class="form-inline" name="menuaddfrm">

					<div class="col-lg-6 mb-4">
						<div class="form-floating">
							<input type="text" class="form-control"
								id="floatingname" name="pname" required="required">
							<label for="floatingname light-300">메뉴명</label>
						</div>
					</div>
					<!-- End Input Name -->
					<div class="col-lg-6 mb-4">
						<div class="form-floating">
							<input type="text" class="form-control"
								id="floatingphone" name="price" required="required">
							<label for="floatingphone light-300">가격</label>
						</div>
					</div>
					<!-- End Input Phone -->

					<div class="col-12">
						<div class="form-floating mb-3">
							<input type="text" class="form-control"
								name="content" required="required"> <label
								for="floatingsubject light-300">메뉴 설명</label>
						</div>
					</div>
					<!-- End Input Subject -->
					&nbsp;<b>이미지 등록</b> <span
						class="pricing-table-icon bx bx-package camera"></span> <input
						type="file" name="photo" id="photo" style="visibility: hidden;"
						onchange="readUrl(this)">
					<!-- 이미지 미리보기할 위치 -->
					<br>
					<br>
					<img id="showimg"
						style="position: static; max-width: 400px;">
					<br>
					<br>
					<div class="col-12">
				<button type="submit" class="btn btn-danger rounded-pill px-md-5 px-4 py-2 radius-0 text-light">메뉴
							등록</button>
				<button type="submit" class="btn btn-danger rounded-pill px-md-5 px-4 py-2 radius-0 text-light"
				onclick="location.href='index.jsp?main=pizzamenu/menulist.jsp'">목록</button>
							<br>
							<br>
					</div>
				</form>
			</div>
			<!-- End Contact Form -->
		</div>
	</section>
	<!-- End Contact -->
</body>
</html>