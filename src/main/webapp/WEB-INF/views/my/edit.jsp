<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="sec"
	uri="http://www.springframework.org/security/tags"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<script src='https://code.jquery.com/jquery-3.3.1.min.js'></script>
<html>
<head>
<!-- meta tags -->
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta name="_csrf" content="${_csrf.token}">
<meta name="_csrf_header" content="${_csrf.headerName}">

<title>NanuShare</title>
<link rel="shortcut icon" type="image/x-icon"
	href="${pageContext.request.contextPath}/resources/nanulogo_ico_convert.ico">
<!-- 웹페이지 탭 로고이미지 삽입  -->

<!-- sweet alert cdn : https://sweetalert.js.org/guides/ -->
    <script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>

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
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>

<!-- 상단 로그인버튼 위치 -->
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css">

<style type="text/css">
.error {
	color: red;
}

a:hover { 
    text-decoration: none;
}
</style>

<!-- <script type="text/javascript">
	$(function() {

		var token = $("meta[name='_csrf']").attr("content");
		var header = $("meta[name='_csrf_header']").attr("content");
		$(document).ajaxSend(function(e, xhr, options) {
			xhr.setRequestHeader(header, token);
		});

		/* 비밀번호 */

		/* ajax를 통한 회원정보 수정처리 */
		$('#mjoin')
				.submit(
						function(event) {
							event.preventDefault();

							var name = $("#name").val();
							var member_id = $("#member_id").val();
							var subemail = $("#subemail").val();
							var pw = $("#pw").val();

							var memberJoin = {
								"name" : name,
								"member_id" : member_id,
								"subemail" : subemail,
								"pw" : pw

							};

							$.ajax({
										type : 'PUT',
										data : JSON.stringify(memberJoin),
										url : "${pageContext.request.contextPath}/my/myprofile/edit/check",
										cache : false,
										contentType : 'application/json',
										/* 	 data:{
												 name: name,
										         pw: pw,
										         member_id : member_id,
										         subemail : email                   
											 } */
										async : "false",
										datatype : 'json',
										success : function(validateForm) {
											console.log(result);
											if (result == true) {
												console.log("success");
												alert("회원 정보가 수정되었습니다. 다시 로그인해주세요.");
												$(location).attr('href',
																"${pageContext.request.contextPath}/my/mypage");
												/* 성공했을때 넘어가는 페이지 */
											}else{
												alert("정보를 알맞게 다시 입력해주세요");
												
											}
										},

										error : function(e) {
											alert("필수 입력 사항을 입력해주세요.");
											console.log(e);
										}

									});//ajax end
						});// mjoin end
	});//function end
</script> -->


<style>
#charity-contact-form {
	left: 50%;
	top: 50%;
	position: absolute;
	margin-left: -220px;
	margin-top: -170px;
}

/* .charity-simple-blog-btn {
	border: 0;
}
 */
input {
	width: 200px;
	height: 100px;
	font-size: 20px;
}

li {
	/* li 점 없애기 */
	list-style: none;
	list-style-type: none;
}

.buttonbutton {
	text-align: center;
}

label {
	display: block;
	/* width: 90px; */
	text-align: left;
}

input {
	width: 300px;
	-moz-box-sizing: border-box;
	box-sizing: border-box;
	/* To harmonize the look & feel of text field border */
	border: 1px solid #999;
}
</style>


</head>

<body>
	<!-- Header -->
	<%@ include file="/WEB-INF/views/mainMap/mainHeader.jsp"%>
	<!-- Header -->


	<!-- Sub Header -->
	<div class="charity-subheader">
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
							<h2>프로필 수정</h2>
						</div>
						<div style="margin: 0 auto" align="center">
							<form id="mjoin" name="mjoin" action="${pageContext.request.contextPath}/my/mypage" method="get" novalidate>
								<!-- onsubmit="return check()" -->

								<ul class="charity-contact-form">
									<li><label>아이디 </label> <input type="text"
										name="member_id" id="member_id"
										value="<sec:authentication property="principal.member.member_id"/>"
										readonly required /></li>
									<li><label>이름</label> <input type="text" name="name"
										id="name"
										value="<sec:authentication property="principal.member.name" />"
										required></li>
									<li><label>서브 이메일</label><input type="text"
										name="subemail" id="subemail"
										value="<sec:authentication property="principal.member.subemail" />"
										required></li>
									<li><label>변경할 비밀번호 입력</label><input type="password"
										placeholder="Password" name="pw" id="pwd1"
										class="form-control" required></li>
									<li><label>비밀번호 확인</label><input type="password"
										placeholder="Confirm Password" name="pwConfirm" id="pw"
										class="form-control" required></li>
								</ul>

								<div class="buttonbutton">
									<button type="submit" class="charity-simple-blog-btn">수정완료</button>
									<button type="button" onclick="location.href='${pageContext.request.contextPath}/my/drop'"
										class="charity-simple-blog-btn">회원 탈퇴</button>
									<button type="button" onclick="location.href='/my/mypage'"
										class="charity-simple-blog-btn">처음으로</button>
								</div>
								<div>&nbsp;</div>
								<input type="hidden" name="${_csrf.parameterName}"
									value="${_csrf.token}" />
							</form>


						</div>

						<!-- jquery validation cdn-->
						<!-- jquery 플러그인 이기때문에 jquery가 있어야 한다. -->
						<script type="text/javascript"
							src="https://cdn.jsdelivr.net/jquery.validation/1.16.0/jquery.validate.min.js"></script>

						<!-- jquery validation method cdn -->
						<script type="text/javascript"
							src="https://cdn.jsdelivr.net/jquery.validation/1.16.0/additional-methods.min.js">
							
						</script>


						<script>
							$("#mjoin").validate({

												rules : { /* 각 태그의 규칙을 설정 */
													/*함수 정의 https://offbyone.tistory.com/50 참고주소 */
													/* 비밀번호 특수문자 https://yoo-hyeok.tistory.com/82  */
													/* 공식 문서 https://jqueryvalidation.org/ */
													/* html의 input태그의 name=""에 설정한 값과 같아야한다.  */
													subemail : {
														required : true,
														email : true,

													},
													pw : {
														required : true,
														passwordCK : true,
														minlength : 4, /* 최소글자 */
														maxlength : 12
													/* 최대12 글자 */
													},
													pwConfirm : {
														required : true,
														equalTo : '#pwd1'
													},
													name : {
														required : true,
														minlength : 2
													}
												},// rules end

												messages : { /* rules에서 설정한 규칙을 위배할시 나오는 메세지 */

													subemail : {
														required : '이메일을 입력해 주세요.',
														email : '이메일 형식으로 입력해 주세요. ex)xxxx@gmail.com'
													},
													pw : {
														required : '비밀번호를 입력해 주세요.',
														passwordCK : '비밀번호는 4~12자로 영문자, 숫자, 특수문자를 조합하여 입력해야 합니다. ex)?는 사용할 수 없습니다.',
														minlength : '비밃런호는 최소 4글자 이상 입력해 주세요.',
														maxlength : '비밃런호는 최대 12글자 까지 입력이 가능합니다.'
													},
													pwConfirm : {
														required : '비밀번호를 입력해 주세요.',
														equalTo : "비밀번호가 일치하지 않습니다."
													},
													name : {
														required : '이름을 입력해 주세요.',
														minlength : '2글자 이상 입력해 주세요.'
													}
												},// message end

												errorElement : 'span',
												errorClass : 'error',
												errorPlacement : function(error, element) {
													if (element.is(":text")
															|| element
																	.is(":password")) {
														element.parent().after(
																error);
													} else {
														element.after(error);
													}
												},
												messages:{
													
													submitHandler:function(){
														
														var token = $("meta[name='_csrf']").attr("content");
														var header = $("meta[name='_csrf_header']").attr("content");
														$(document).ajaxSend(function(e, xhr, options) {
															xhr.setRequestHeader(header, token);
														});

														/* 비밀번호 */

														/* ajax를 통한 회원정보 수정처리 */
														$('#mjoin').submit(
																		function(event) {
																			event.preventDefault();

																			var name = $("#name").val();
																			var member_id = $("#member_id").val();
																			var subemail = $("#subemail").val();
																			var pw = $("#pw").val();

																			var memberJoin = {
																				"name" : name,
																				"member_id" : member_id,
																				"subemail" : subemail,
																				"pw" : pw

																			};

																			$.ajax({
																						type : 'PUT',
																						data : JSON.stringify(memberJoin),
																						url : "${pageContext.request.contextPath}/my/myprofile/edit/check",
																						cache : false,
																						contentType : 'application/json',
																						/* 	 data:{
																								 name: name,
																						         pw: pw,
																						         member_id : member_id,
																						         subemail : email                   
																							 } */
																						async : "false",
																						datatype : 'json',
																						success : function(validateForm) {
																							console.log(result);
																							if (result == true) {
																								console.log("success");
																								swal({
																									title : "회원 정보가 수정되었습니다. 다시 로그인해주세요." , 
																									icon : "success" , 
																									button : true 
																								});
																								
																								$(location).attr('href',
																												"${pageContext.request.contextPath}/my/mypage");
																								/* 성공했을때 넘어가는 페이지 */
																							}else{
																								swal({
																									title : "정보를 알맞게 다시 입력해주세요", 
																									icon : "error" , 
																									button : true 
																								});
																																																
																							}
																						},

																						error : function(e) {
																							
																							swal({
																								title : "필수 입력 사항을 입력해주세요.", 
																								icon : "error" , 
																								button : true 
																							});
																							console.log(e);
																						}

																					});//ajax end
																		});// mjoin end
														
														
													}
												}

											}); //validate end
							$.validator.addMethod(
											"passwordCK",
											function(value, element) {
												return this.optional(element)
														|| /^.*(?=.*\d)(?=.*[a-zA-Z])(?=.*[!@#$%^&+=]).*$/
																.test(value);
											});
						</script>

					</div>
				</div>
			</div>
		</div>
	</div>
</body>
</html>
<!-- Main Section -->
<!-- Content -->

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