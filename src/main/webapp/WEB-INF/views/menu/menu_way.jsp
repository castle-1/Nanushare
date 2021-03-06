<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>

<!-- meta tags -->
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">

<title>Nanushare</title>
<link rel="shortcut icon" type="image/x-icon"
	href="${pageContext.request.contextPath}/resources/nanulogo_ico_convert.ico">
<!-- 웹페이지 탭 로고이미지 삽입  -->

<!-- CSS -->
<link rel="stylesheet" href="/resources/charity/css/bootstrap.css">
<link rel="stylesheet" href="/resources/charity/css/fontawesome-all.css">
<link rel="stylesheet" href="/resources/charity/css/flaticon.css">
<link rel="stylesheet" href="/resources/charity/css/slick-slider.css">
<link rel="stylesheet" href="/resources/charity/css/fancybox.css">
<link href="/resources/charity/css/jplayer.css" rel="stylesheet">
<link rel="stylesheet" href="/resources/charity/css/style.css">
<link rel="stylesheet" href="/resources/charity/css/color.css">
<link rel="stylesheet" href="/resources/charity/css/responsive.css">

<!-- font-awesome 부트스트랩 이모티콘 -->
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.8.2/css/all.min.css" />

<!-- 상단 로그인버튼 위치 -->
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css">

</head>

<style>
/*  a 태그 후버시 밑줄, 파랑 속성 제거 */
a:hover { 
 	text-decoration: none;
 	color:#333;
}
.charity-simple-blog-btn {
	border: 0;
}
#forimg {
	/* background-color: #e4edfe; */
	background-image: url('/resources/banner_imgs/map_banner.png');
	background-repeat:no-repeat;
	background-position: center;"
}
.black-transparent {
	opacity:50%;
}
</style>
<body>
	<!-- Header -->
	<%@ include file="/WEB-INF/views/mainMap/mainHeader.jsp"%>
	<!-- Header -->
	<!-- Sub Header -->
	<div id="forimg" class="charity-subheader">
		<!--  style="background-image: url(/resources/loginform/images/bg.jpg);"  -->
		<span class="black-transparent"></span>
		<div class="container">
			<div class="row">
				<div class="col-md-12"></div>
			</div>
		</div>
	</div>
	<!-- Sub Header -->
	<!-- Content -->
	<div class="charity-main-content">

		<!-- Main Section -->
		<div class="charity-main-section">
			<div class="container">
				<div class="row">
					<div class="col-md-12">
						<div class="charity-fancy-title">
							<h2>찾아오셰어</h2>
						</div>
						<!-- Main Section -->
						<div class="charity-main-section charity-aboutus-text-full">
							<div class="container">
								<div class="row">

									<div class="col-md-12">
										<div class="charity-aboutus-text">
											<i class="fas fa-phone"
												style="color: #FFAE73; font-size: 25px;"> 연락처</i>

											<h6>
												<br>대표전화 02-722-1481 <br>
												<br>
												<br>
											</h6>
											<br> <br> <i class="fas fa-clock"
												style="color: #FFAE73; font-size: 25px;"> 영업시간</i>
											<h6>
												<br>월-금 10:00 ~ 17:00 | 주말 및 공휴일 휴무 | 점심시간 오후 12:00 ~
												13:00<br>
												<br>
												<br>
											</h6>
											<br> <br> <i class="fas fa-map-marker-alt"
												style="color: #FFAE73; font-size: 25px;"> 주소</i>
											<h6>
												<br> 도로명 주소 : (우)03164 서울특별시 종로구 종로 2가 종로69<br>
											</h6>
											<p>
												<img src="/resources/my/찾아오셰어지도.PNG" height="2727"
													width="1680.75">
											</p>
										</div>
									</div>

								</div>
							</div>
						</div>
						<!-- Main Section -->
					</div>
				</div>

			</div>
		</div>
	</div>
	<!-- Main Section -->


	<!-- Search Modal -->
	<div class="modal fade searchmodal" id="searchModal" tabindex="-1"
		role="dialog">
		<div class="modal-dialog" role="document">
			<div class="modal-content">
				<div class="modal-body">
					<a href="/resources/charity/#" class="charity-close-btn"
						data-dismiss="modal" aria-label="Close"><span
						aria-hidden="true">&times;</span></a>
					<form>
						<input type="text" value="Type Your Keyword"
							onblur="if(this.value == '') { this.value ='Type Your Keyword'; }"
							onfocus="if(this.value =='Type Your Keyword') { this.value = ''; }">
						<input type="submit" value=""> <input type="button"
							value="취소" onClick="history.go(-2)"
							class="charity-simple-blog-btn"> <a
							href="${pageContext.request.contextPath}/my/mypage"
							class="charity-simple-blog-btn">저장</a> <i class="fa fa-search"></i>
					</form>
				</div>

			</div>
		</div>
	</div>


	<!-- Footer -->
	<%@ include file="/WEB-INF/views/mainMap/mainFooter.jsp"%>
	<!-- Footer -->

	<!-- jQuery -->
	<script src="/resources/charity/script/jquery.js"></script>
	<script src="/resources/charity/script/popper.min.js"></script>
	<script src="/resources/charity/script/bootstrap.min.js"></script>
	<script src="/resources/charity/script/slick.slider.min.js"></script>
	<script src="/resources/charity/script/progressbar.js"></script>
	<script src="/resources/charity/script/fancybox.min.js"></script>
	<script src="/resources/charity/script/jquery.countdown.min.js"></script>
	<script src="https://maps.googleapis.com/maps/api/js"></script>
	<script src="/resources/charity/script/jquery.jplayer.js"></script>
	<script src="/resources/charity/script/jplayer.playlist.js"></script>
	<script src="/resources/charity/script/functions-main.js"></script>
</body>
</html>