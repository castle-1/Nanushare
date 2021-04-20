<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="sec"
	uri="http://www.springframework.org/security/tags"%>
<!-- blog detail 사용 css style도 여기서 찾을 것  .charity-form-btn 생성함 color에도 추가함-->
<!doctype html>
<html lang="ko">

<head>
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
	
	<!-- ckeditor -->
	<script src = "${pageContext.request.contextPath}/resources/ckeditor/ckeditor.js"></script>
    
    <!-- meta tags -->
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    
    
    <meta name="_csrf" content="${_csrf.token}">
    <meta id="_csrf_header" name="_csrf_header" content="${_csrf.headerName}">
    
    <!-- 작성 폼 스크립트 -->
	<script type="text/javascript">
		$(document).ready(function(){
			
			var token = $("meta[name='_csrf']").attr("content");
			var header = $("meta[name='_csrf_header']").attr("content");
			
			$("#writeForm").submit(function(event){         
	           event.preventDefault();
	          
	           var btitle = $("#btitle").val();
	           var bcontent = $("#bcontent").val();
	           
	           var form = {
	        		 btitle: btitle,
	        		 bcontent: bcontent
	           };
	           
	           $.ajax({
	             type : "POST",
	             url : $(this).attr("action"),
	             cache : false,
	             contentType:'application/json; charset=utf-8',
	             data: JSON.stringify(form), 
	             //데이터를 전송하기 전에 헤더에 csrf값을 설정 (같이 넘겨줘야 post 403 error가 없다)
	             beforeSend : function(csrf) {   
	            	csrf.setRequestHeader(header, token)
	             },
	             success: function (result) {       
	               if(result == "SUCCESS") {
	            	   alert("성공")
	                  $(location).attr('href', '${pageContext.request.contextPath}/board/qna')                            
	               }                       
	             },
	             error: function (e) {
	            	 console.log(e);
	                location.reload(); // 실패시 새로고침하기
	             }
	         })            
	       });       
	   	});
		
	</script>
	
	<style>
		.charity-simple-blog-btn {
			border: 0;
		}
		
		​h3 {
			text-align: center;
		}
		
	</style>

    <title>나누셰어 - 문의하기</title>

    <!-- CSS -->
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/charity/css/bootstrap.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/charity/css/fontawesome-all.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/charity/css/flaticon.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/charity/css/slick-slider.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/charity/css/fancybox.css">
    <link href="${pageContext.request.contextPath}/resources/charity/css/jplayer.css" rel="stylesheet">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/charity/css/style.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/charity/css/color.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/charity/css/responsive.css">

	<!-- 웹페이지 탭 로고이미지 삽입  -->
	<link rel="shortcut icon" type="image/x-icon" href="${pageContext.request.contextPath}/resources/nanulogo_ico_convert.ico"> 
	
</head>

<body>


    <!-- Header -->
    <%@ include file="/WEB-INF/views/mainMap/mainHeader.jsp"%>
    <!-- Header -->
    
    <!-- Banner -->
    <div class="charity-subheader">
        <span class="black-transparent"></span>
        <div class="container">
            <div class="row">
                <div class="col-md-12">
                    <h1>문의 하기</h1>
                    <p>show your support</p>
                </div>
            </div>
        </div>
    </div>
    <!-- Banner -->
    

    <!-- Content -->
    <div class="charity-main-content">

        <!-- Main Section -->
        <div class="charity-main-section">
            <div class="container">
                <div class="row">
              		 <div class="col-md-9">
               
                       <form id="writeForm" action="${pageContext.request.contextPath}/board/qna/qnaWrite" >
                     	   
	                       <div class="charity-contact-form">
	                       		<h4><span>ID</span></h4>
	                       		<h5><sec:authentication property="principal.member.member_id" /></h5> <br/>
	                           <h4><span>Title</span></h4>
	                           <input type="text" id="btitle" name="btitle" placeholder="제목을 작성하세요." >
	                           <br>
	                           <br>	                          
	                           <br><br>
	                           <h4>Content</h4>
	                           <p><textarea id="bcontent" name="bcontent" placeholder="내용을 작성하세요."></textarea></p>
	                             <script type="text/javascript">
                        
			                        var ckeditor_config = {
			        						resize_enaleb : false, //에디터 크기조절 x
			        						height:"450",
			        						enterMode : CKEDITOR.ENTER_BR,
			        						shiftEnterMode : CKEDITOR.ENTER_P,
			        						filebrowserUploadUrl : '<c:url value="${pageContext.request.contextPath}/my/board/shows/imageUpload" />?${_csrf.parameterName}=${_csrf.token}'
			        					};
			                            CKEDITOR.replace('bcontent', ckeditor_config);
			                            
			                            
			                           
		                        </script>
	                           <br><br>
							   <br><hr>

	                          <%--  <button type="button" class="charity-sub-btn"><i class="fa fa-eraser" onclick="location.href='delete?b_index=${modify_view.b_index}'"> 글삭제</i></button> --%>
							   <button type="submit" class="charity-sub-btn"><i class="fa fa-save"> 작성완료</i></button>
							   <button type="reset" class="charity-sub-btn"><i class="fa fa-undo"> 다시쓰기</i></button>
							   <!-- charity-main-btn -->
							   <!-- 버튼에 링크걸기 https://m.blog.naver.com/rain483/220529222723 -->
	                        </div>
	                        <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" />
	                        <input type="hidden" id="_csrf_header" name="_csrf_header" value="${_csrf.headerName}" />
                        </form>
                      
                        
                      	<!--   a href="plist" -->
                        <div style="float: right; margin-right:5px; text-color:2a786b;"> <a href="${pageContext.request.contextPath}/board/qna" class="fa fa-list-alt" > 문의 게시판 돌아가기 </a></div>
                        <br><br>
                 
                    </div>		     
		
			        <!-- aside -->
			    	<%@ include file="/WEB-INF/views/board_show/aside.jsp"%>
			    	<!-- aside -->
    	
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
    <script src="${pageContext.request.contextPath}/resources/charity/script/jquery.js"></script>
    <script src="${pageContext.request.contextPath}/resources/charity/script/popper.min.js"></script>
    <script src="${pageContext.request.contextPath}/resources/charity/script/bootstrap.min.js"></script>
    <script src="${pageContext.request.contextPath}/resources/charity/script/slick.slider.min.js"></script>
    <script src="${pageContext.request.contextPath}/resources/charity/script/progressbar.js"></script>
    <script src="${pageContext.request.contextPath}/resources/charity/script/fancybox.min.js"></script>
    <script src="${pageContext.request.contextPath}/resources/charity/script/jquery.countdown.min.js"></script>
    <script src="${pageContext.request.contextPath}/resources/charity/script/jquery.jplayer.js"></script>
    <script src="${pageContext.request.contextPath}/resources/charity/script/jplayer.playlist.js"></script>
    <script src="${pageContext.request.contextPath}/resources/charity/script/functions.js"></script>
</body>

</html>