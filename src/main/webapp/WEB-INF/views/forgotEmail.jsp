<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<!doctype html>
<html lang="ko">

<head>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>

<!-- jquery validation cdn-->
<!-- jquery 플러그인 이기때문에 jquery가 있어야 한다. -->
<script type="text/javascript" src="https://cdn.jsdelivr.net/jquery.validation/1.16.0/jquery.validate.min.js"></script>

<!-- jquery validation method cdn -->
<script type="text/javascript" src="https://cdn.jsdelivr.net/jquery.validation/1.16.0/additional-methods.min.js">
</script>

<!-- 웹페이지 탭 로고이미지 삽입  -->
<link rel="shortcut icon" type="image/x-icon" 
	href="${pageContext.request.contextPath}/resources/nanulogo_ico_convert.ico"> <!-- 웹페이지 탭 로고이미지 삽입  -->

<!-- bootstrap -->	
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>

<!-- sweet alert cdn : https://sweetalert.js.org/guides/ -->
<script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>

<%-- <sec:csrfMetaTags/> --%>
<!-- 헤더 안에 추가  -->
<!-- csrf 관련이슈 해결방법 : jsp에 meta 태그추가(csrf값 얻기위해) -->
<!-- js에서 csrf 토큰, 헤더등록 -->
<meta name="_csrf" content="${_csrf.token}">
<meta name="_csrf_header" content="${_csrf.headerName}">

<title>이메일 찾기</title>

<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
<link href="https://fonts.googleapis.com/css?family=Lato:300,400,700&display=swap" rel="stylesheet">
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
<link rel="stylesheet" href="/resources/signUpForm/css/style.css">

<<<<<<< HEAD
<script type="text/javascript">
    $(function() {
    	var token = $("meta[name='_csrf']").attr("content");
        var header = $("meta[name='_csrf_header']").attr("content");
        $(document).ajaxSend(function(e, xhr, options) {
            xhr.setRequestHeader(header, token);
        });
        
        $('#findEmail').click(function() { // 버튼 클릭시 입력한 이메일로 아이디에 해당하는 이메일을 해당 이메일로 전송
            var mail = $("#subemail").val(); // 인증받을 이메일 주소
            if (mail == "") {
            	swal({
					title : "메일 주소가 입력되지 않았습니다." , 
					icon : "success" , 
					button : true 
				});
            } else {
                $.ajax({
                    type: 'post',
                    url: '${pageContext.request.contextPath}/sendFindEmail',
                    data: {
                        mail: mail
                    },
                    dataType: 'json',
                    async: "false",
                    success: function(data) {
                        console.log(data.findEmail);
                        findEmail = data.findEmail;
                        if (mail != "") {
                        	swal({
        						title : "아이디가 해당 메일로 전송되었습니다." , 
        						icon : "success" , 
        						button : true 
        					});
                           
=======
    <link rel="stylesheet" href="/resources/signUpForm/css/style.css">
    
    
    <style type="text/css">
    	body{
    		background-image : url("/resources/loginform/images/img_10.jpg");
			/* background-image: url("https://source.unsplash.com/user/upcastle1/likes/1600x900"); */
			background-size: cover;
			/*opacity: 0.7; */
			/* background-color: rgba(255,255,255,0.1); */
			
		}
		
    	.error {
    		color : red;   	
    	}
    </style>
    
   

   <script type="text/javascript">
        $(function() {
        	
        	var token = $("meta[name='_csrf']").attr("content");
            var header = $("meta[name='_csrf_header']").attr("content");
            $(document).ajaxSend(function(e, xhr, options) {
                xhr.setRequestHeader(header, token);
            });
            
        	
            
            $('#findEmail').click(function() { // 버튼 클릭시 입력한 이메일로 아이디에 해당하는 이메일을 해당 이메일로 전송
                var mail = $("#subemail").val(); // 인증받을 이메일 주소
                if (mail == "") {
                	swal({
						title : "메일 주소가 입력되지 않았습니다." , 
						icon : "success" , 
						button : true 
					});
                    
                } else {
                    $.ajax({
                        type: 'post',
                        url: '${pageContext.request.contextPath}/sendFindEmail',
                        data: {
                            mail: mail
                        },
                        dataType: 'json',
                        async: "false",
                        success: function(data) {
                            console.log(data.findEmail);
                            findEmail = data.findEmail;
                            if (mail != "") {
                            	swal({
            						title : "아이디가 해당 메일로 전송되었습니다." , 
            						icon : "success" , 
            						button : true 
            					});
                               
                            }
>>>>>>> #dev_si_donaValidation
                        }
                    }

                });
            }
            
            /* if (mail != "") {
                alert("아이디가 해당 메일로 전송되었습니다.");
            } */
        }); //certification end
    });
</script>
    
<style type="text/css">
body{
	background-image: url("https://source.unsplash.com/user/upcastle1/likes/1600x900");
	background-size: cover;
	/*opacity: 0.7; */
	/* background-color: rgba(255,255,255,0.1); */
}
/* 바디 배경색 투명도 */
body::after{
	/* position: absolute; */
    top: 0;
    left: 0;
    right: 0;
    bottom: 0;
    content: '';
  /*   height:120%; */
    background:black;
	z-index: -1;
	opacity:0.6;
}
.heading-section {
	color:white;
}

.error {
  	color : red;   	
}

/* 인풋박스 스타일 */
.form-control {
    background: transparent;
    border: none;
    height: 55px;
    color: white;
    border: 1px solid transparent;
    background: rgba(255, 255, 255, 0.1);
    border-radius: 40px;
}
.form-control::-webkit-input-placeholder {
   /* Chrome/Opera/Safari */
   color: rgba(255, 255, 255, 0.8) !important;
   font-size: 14px;
  /*  font-family: 'YiSunShinDotumM';  */
}

/* placeholder color */
.form-control::-moz-placeholder {
   /* Firefox 19+ */
   color: rgba(255, 255, 255, 0.8) !important; 
   font-size: 14px;
}
.form-control:-ms-input-placeholder {
   /* IE 10+ */
   color: rgba(255, 255, 255, 0.8) !important; 
   font-size: 14px;
}
.form-control:-moz-placeholder {
   /* Firefox 18- */
   color: rgba(255, 255, 255, 0.8) !important;
   font-size: 14px; 
}
.form-group .icon {
    position: absolute;
    top: 50%;
    left: 17px;
    margin-top: 7px;
    color: rgba(255, 255, 255, 0.7);
}

/* 인풋박스 제목 */
.form-group label {
	font-family: 'YiSunShinDotumM';
/*     text-transform: uppercase; */
    /* font-weight: bold; */
    font-weight: 500;
    font-size: 15px;
    letter-spacing: 1px;
    color: white;
    display:inline;
    margin-left:17px;
}

/* Find Email btn */
.btn.btn-primary {
	margin-top:10px;
	font-weight: bold;
	font-size:14px;
	text-transform: uppercase;
    background: #FFAE73 !important;
    border: 1px solid #FFAE73 !important;
    color: white !important;
}
.btn.btn-primary:hover {
    /* background: #C1AFAB !important; */
    background: #fbceb5 !important;
    border: 1px solid #fbceb5 !important;
    color: #333 !important;
    font-weight: bold;
     text-transform: uppercase; 
}
</style>

</head>

<body class="img js-fullheight">
<section class="ftco-section">
        <div class="container">
            <div class="row justify-content-center">
                <div class="col-md-6 text-center mt-5 mb-3">
                    <h1 class="heading-section">
                   		<img src="/resources/nanulogo_ico_convert.ico" style="width:8%; margin-bottom:10px; margin-right:5px;">
                     	 Nanushare Find Email
                    </h1>
                </div>
            </div>
            <div class="row justify-content-center">
                <div class="col-md-7 col-lg-5">
                    <div class="login-wrap">
                        
                        <form id="findEmail" action="${pageContext.request.contextPath}/main" 
                        	class="signup-form" method="post"  novalidate> 
                        	<!-- novalidate -> 브라우저에서 제공하는 validate를 끄겠다. 그리고 jquery validation plugin 사용 -->
							<fieldset>
							<!-- <legend>Input Information</legend> legend 태그는 제목 설정 태그 -->
							
                            <div class="form-group mb-3">                           	
                                <label class="label" for="subemail">이메일 주소</label>                                                                                                                               
                                <input type="text" id="subemail" name="subemail" class="form-control" placeholder="이메일을 입력해 주세요." >                                                          
                                <span class="icon fa fa-paper-plane-o"></span>                                
                            </div>                         

                            <div class="form-group">
                                <button type="submit" id="submit-btn" class="form-control btn btn-primary submit px-3">Find Email</button>
                            </div>
                            </fieldset>
                            <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" />
                        </form>
                        <script>
							$("#findEmail").validate({
								rules:{ 
									subemail :{
										required : true, /* 필수인가? true는 yes를 의미 */
										email : true /* 이메일 형식인가? */
									}									
									
								},
								messages:{ /* rules에서 설정한 규칙을 위배할시 나오는 메세지 */
									subemail :{
									required : '이메일을 입력해 주세요.',
										email : '이메일 형식으로 입력해 주세요. ex)xxxx@gmail.com'
									}									
								},
								errorElement : 'span', /* 디폴트는 lable 태그 lable->span 으로 수정 */
								errorClass : 'error', /* 디폴트 클래스 이름은 error, 클래스 이름을 변경할 수 있다.*/
								
								errorPlacement : function(error, element) { 
									if(element.is(":text") || element.is(":password")){
										element.parent().after(error);
									}else{
										element.after(error);
									}
								}
							}); 
						</script>
                       
                    </div>
                </div>
            </div>
        </div>
    </section>

    <script src="/resources/signUpForm/js/jquery.min.js"></script>
    <script src="/resources/signUpForm/js/popper.js"></script>
    <script src="/resources/signUpForm/js/bootstrap.min.js"></script>
    <script src="/resources/signUpForm/js/main.js"></script>
    
    <script src="/resources/loginform/js/jquery.min.js"></script>
    <script src="/resources/loginform/js/popper.js"></script>
    <script src="/resources/loginform/js/bootstrap.min.js"></script>
    <script src="/resources/loginform/js/main.js"></script>

</body>

</html>