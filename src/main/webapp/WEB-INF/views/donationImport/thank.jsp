<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!doctype html>
<html lang="en">

<head>

<!-- meta tags -->
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">

<title>Charity About Us</title>

<!-- CSS -->
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/charity/css/bootstrap.css">
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/charity/css/fontawesome-all.css">
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/charity/css/flaticon.css">
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/charity/css/slick-slider.css">
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/charity/css/fancybox.css">
<link
	href="${pageContext.request.contextPath}/resources/charity/css/jplayer.css"
	rel="stylesheet">
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/charity/css/style.css">
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/charity/css/color.css">
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/charity/css/responsive.css">
<!-- header -->
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css">

<!-- 웹페이지 탭 로고이미지 삽입  -->
<link rel="shortcut icon" type="image/x-icon"
	href="${pageContext.request.contextPath}/resources/nanulogo_ico_convert.ico">

<!-- new korean font from google -->
<!-- NotoSansKR, Gothic A1 -->
<link rel="preconnect" href="https://fonts.gstatic.com">
<link
	href="https://fonts.googleapis.com/css2?family=Do+Hyeon&family=Gothic+A1:wght@100;200;300;400;500;600;700;800;900&family=Noto+Sans+KR:wght@100;300;400;500;700;900&display=swap"
	rel="stylesheet">

<style type="text/css">
/*  a 태그 후버시 밑줄, 파랑 속성 제거 */
a:hover { 
 	text-decoration: none;
 	color:#333;
}
#forimg {
	/* background-color: #db7a7c; */
	background-color: #dfebe9;
	background-image: url('/resources/banner_imgs/show_banner.png');
	background-repeat: no-repeat;
	background-position: center;
	/* background-size: 1500px; 
	width:100%;  */
}

.black-transparent {
	opacity: 50%;
}
</style>

<!-- 꽃가루 -->
<style>
canvas {
	z-index: 10;
	/* pointer-events: none; */
	position: fixed;
	top: 0;
	transform: scale(1.1);
}
</style>


</head>

<body>
	<!-- Header -->
	<%@ include file="/WEB-INF/views/mainMap/mainHeader.jsp"%>
	<!-- Header -->

	<!-- Banner -->
	<div id="forimg" class="charity-subheader">
		<span class="black-transparent"></span>
		<div class="container">
			<div class="row">
				<div class="col-md-12"></div>
			</div>
		</div>
	</div>
	<!-- Banner -->

	<!-- Content -->
	<!--    	<div class="charity-fancy-title " style="margin-top:70px; margin-bottom:20px;">
		<h2> 물품 나누기 </h2>
	</div>  -->

	<div class="charity-main-content">

		<!-- Main Section -->
		<div class="charity-main-section charity-aboutus-text-full">
			<div class="container">
				<div class="row">


			
					<canvas id="canvas"></canvas>


					<div class="col-md-7">
						<div class="charity-aboutus-text">
							<h1 style="text-align: center;">나눔해주셔서 감사합니다.</h1>
							<div>&nbsp;</div>
							<h3>
								<span style="color: #FFAE73;"><sec:authentication
										property="principal.member.name" /></span>님의 소중한 후원금(후원물품), 투명하고
								정직하게 사용하겠습니다.
							</h3>
							<ul class="charity-list-style-one">
								<div>&nbsp;</div>
								<div>&nbsp;</div>
								<div>&nbsp;</div>
								<h5>*나눔 내역은 마이페이지에서 확인하실 수 있습니다.*</h5>
							</ul>
							<!-- <h6>Donation So Far: <span>$ 6000</span></h6> -->
							<br> <a href="/main" class="charity-about-btn m-2">메인페이지</a><a
								href="/my/mypage" class="charity-about-btn m-2">마이페이지</a> <br>
						</div>
					</div>
					<div class="col-md-5">
						<img
							src="${pageContext.request.contextPath}/resources/donation/money_teamwork.jpg"
							alt="">
					</div>

				</div>
			</div>
		</div>
		<!-- Main Section -->

	</div>
	<!-- Content -->

	<!-- Footer -->
	<%@ include file="/WEB-INF/views/mainMap/mainFooter.jsp"%>
	<!-- Footer -->

	<!-- jQuery -->
	<script
		src="${pageContext.request.contextPath}/resources/charity/script/jquery.js"></script>
	<script
		src="${pageContext.request.contextPath}/resources/charity/script/popper.min.js"></script>
	<script
		src="${pageContext.request.contextPath}/resources/charity/script/bootstrap.min.js"></script>
	<script
		src="${pageContext.request.contextPath}/resources/charity/script/slick.slider.min.js"></script>
	<script
		src="${pageContext.request.contextPath}/resources/charity/script/progressbar.js"></script>
	<script
		src="${pageContext.request.contextPath}/resources/charity/script/fancybox.min.js"></script>
	<script
		src="${pageContext.request.contextPath}/resources/charity/script/jquery.countdown.min.js"></script>
	<script src="https://maps.googleapis.com/maps/api/js"></script>
	<script
		src="${pageContext.request.contextPath}/resources/charity/script/jquery.jplayer.js"></script>
	<script
		src="${pageContext.request.contextPath}/resources/charity/script/jplayer.playlist.js"></script>
	<script
		src="${pageContext.request.contextPath}/resources/charity/script/functions.js"></script>

<!-- 꽃가루 -->
<script src="${pageContext.request.contextPath}/resources/menu/confetti_v2.js"></script>
</body>

</html>