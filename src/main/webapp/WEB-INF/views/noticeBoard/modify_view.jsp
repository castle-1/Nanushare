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


<meta name="_csrf" content="${_csrf.token}">
<meta id="_csrf_header" name="_csrf_header"
	content="${_csrf.headerName}">

<title>myprofile_edit</title>

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

<!-- 부트스트랩 아이콘 -->
<link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.8.2/css/all.min.css" />


<!-- ckeditor -->
	<script src = "${pageContext.request.contextPath}/resources/ckeditor/ckeditor.js"></script>
	
	
</head>

<style>
.charity-simple-blog-btn {
	border: 0;
}

​h3 {
	text-align: center;
}
</style>
<body>
	<!-- Header -->
	<%@ include file="/WEB-INF/views/mainMap/mainHeader.jsp"%>
	<!-- Header -->

  <!-- Content -->
    <div class="charity-main-content">

        <!-- Main Section -->
		<div class="charity-main-section">
			<div class="container">
				<div class="row">
					<div class="col-md-9">
					 <form id="updateForm"
				action="${pageContext.request.contextPath}/board/notice/modify" method="post">
							<!-- <form action="/board/shows/modify" id="modify" method="post" > -->
							<input type="hidden" id="b_index" name="b_index" value="${modify_view.b_index}" >
	                       <div class="charity-contact-form">
	                           <h4><span>Title</span><input type="text" id="btitle" name="btitle" value="${modify_view.btitle}"></h4><hr><br>
	                           <%-- <h4>Images</h4>
	                           <figure class="charity-postthumb"><img src="${pageContext.request.contextPath}/resources/charity/extra-images/blog-detail-img.png" alt=""></figure> --%>
	                           <div class="charity-blog-options">
	                                <ul style="float:right">
	                                	<li><i class="fa fa-folder-open"></i>  No. ${modify_view.b_index}</li> 
	                                    <li style="text-indent: 0.3em"><i class="fa fa-calendar"></i><time datetime="2008-02-14 20:00">  ${modify_view.bdate}</time></li>
	                                   <!--  <li style="text-indent: 0.3em"><i class="fa fa-comments"></i><a href="404.html">  23 comments</a></li> -->
	                                    <li style="text-indent: 0.3em"><i class="fa fa-mouse-pointer"></i> 조회수 ${modify_view.bhit}</li>
	                                </ul>
	                           </div>
	                           <h4>Content</h4>
	                           <%-- <p><textarea class="form-control" name="bcontent" rows="20" style="width:100%;">${modify_view.bcontent}</textarea></p><br> --%>
	                           <p><textarea id="bcontent" name="bcontent">${modify_view.bcontent}</textarea></p><br><br>
							  
							   <!-- 에디터 -->
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
		                        
							   <br><hr>
								<!-- 글삭제는 첨부파일,댓글 다 지워야 가능하다. 수정해야함 -->
	                           
							   <button type="submit" id="modify" class="charity-sub-btn"><i class="fa fa-save"> 수정완료</i></button>
							   <button type="button" class="charity-sub-btn"><i class="fa fa-arrow-left"  onclick="location.href='${pageContext.request.contextPath}/board/notice/${modify_view.b_index}'">수정취소</i></button>							 
	                        </div>
	                        <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" />
                        </form>
                        
                    	<!--   a href="plist" -->
                        <div style="float: right; margin-right:5px; text-color:2a786b;"><a href="list" class="fa fa-list-alt" > 나눔 인증 게시판 돌아가기 </a></div>
                        <br><br>
                       
                        <!-- 댓글 보일지 말지 고민중  -->
                        <!-- 댓글 보일지 말지 고민중  -->
                        
                    </div>

                    <!-- 우측 배너  aside -->
					<%@ include file="/WEB-INF/views/board_show/aside.jsp"%>
					<!-- aside end -->
					
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

	<!-- 자주묻는질문 -->
	<script type="text/javascript"
		src="/resources/faq/js/jquery-1.10.2.min.js"></script>
	<script type="text/javascript"
		src="/resources/faq/bootstrap/js/bootstrap.min.js"></script>

</body>
</html>