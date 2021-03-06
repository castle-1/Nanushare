<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!doctype html>
<html lang="ko">

<head>
	
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
	
    <!-- meta tags -->
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    
    <!-- csrf_meta_tag_for_jsp
    https://stackoverflow.com/questions/37383730/how-to-add-csrf-token-to-ajax-request -->
	<meta name="_csrf" content="${_csrf.token}"/>
	<meta name="_csrf_header" content="${_csrf.headerName}"/>

    <title>나누셰어 - 나눔인증</title>

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
	    
    <!-- sweet alert cdn : https://sweetalert.js.org/guides/ -->
    <script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
	
	<!-- 새로고침 시 스크롤이 상단으로 manual = 복원안함 auto  = 복원 https://okky.kr/article/684414?note=1915071 -->
<!-- 	<script>history.scrollRestoration = "auto"</script> -->
	
	<!-- header -->
	<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css">
	
	<!-- new korean font from google -->
	<!-- NotoSansKR, Gothic A1 -->
	<link rel="preconnect" href="https://fonts.gstatic.com">
	<link href="https://fonts.googleapis.com/css2?family=Do+Hyeon&family=Gothic+A1:wght@100;200;300;400;500;600;700;800;900&family=Noto+Sans+KR:wght@100;300;400;500;700;900&display=swap" rel="stylesheet">
	
	<script type="text/javascript">
	
	// 댓글 수정 취소 
	function cancleEdit(rNum) {
		console.log("cancleEdit" + rNum);
		
		document.location.reload(true);
		
		/* 수정 취소해서 원래 상태로 돌리는게 아래처럼 하면 일단 작동은 함. 
		문제는 저렇게 하면 append된 버튼을 다시 누르려면 저 아래서 바로 함수를 다시 호출해야하는데 그렇게 해보니까 
		뭔가 다른게 잘 작동을 안하는거같아서 일단은 그냥 원래 위치기억하고 새로고침 시켰다. */
		
	/* 	// 이 부분 참고: https://www.codingfactory.net/10679
		$('#edit_acontent'+rNum).contents().unwrap().wrap( "<p id='modify"+ rNum +"'></p>" );	// 1번 
		
		$('#abt'+rNum).empty(); //2번 */
		
	 	/* htmls='';
		htmls += '<a class="a-updateView" onclick="answerEdit('+rid+','+rcontent+','+rNum+')">수정하기</a>' 
		htmls +=  
		
		$('#abt'+rNum).append(
			'<b><i class="fa fa-edit"></i><a class="a-updateView" onclick="answerEdit('+rid+','+rcontent+','+rNum+')">수정하기</a></b>' +
			'<b><i class="fa fa-eraser"></i><a class="a-del" href="${pageContext.request.contextPath}/board/shows/delete/'+rNum+'" >삭제하기</a><b>' 
		); */
		console.log("되는건가");
	};  
	
	// 댓글 수정 창으로
	function answerEdit(bIndex,rid,rcontent,rNum) {
		console.log("bIndex : "+bIndex);
		console.log("rid : "+rid);
		console.log("rcontent : "+rcontent);
		console.log("rNum : "+rNum);
		
		// csrf
		var token = $("meta[name='_csrf']").attr("content");
		var header = $("meta[name='_csrf_header']").attr("content");
		
		$(document).ajaxSend(function(e, xhr, options) {
			xhr.setRequestHeader(header, token);
		});
		
		$('#modify'+rNum).html( //1번
				"<textarea id='edit_acontent"+rNum+"' style='width:100%;height:500%;border:1;overflow:visible;text-overflow:ellipsis;'>"+rcontent+"</textarea>"
				/* +"<style>#edit_acontent {width:640px; height:80px; resize:none;} </style>" */
		);
			
		$('#abt'+rNum).html( //2번
			"<b><a href='javascript:void(0);' onclick='answerEditSave("+bIndex+","+rNum+")' id='btnEdit' class='fa fa-edit' style='color:#937768'> 수정완료</a></b> &nbsp;" 
			+ "<a href='javascript:void(0);'onclick='cancleEdit("+rNum+")' id='btnCancel' class='fa fa-eraser' style='color:#937768'><b>수정취소</b></a>"
			/* $(location).attr('href', "${pageContext.request.contextPath}/board/shows/content_view/" +bindex); */
		);
		
	};
	
	
	// 댓글 수정 send
	function answerEditSave(bIndex, rNum){ //3번
		var rcontent = $("#edit_acontent"+rNum).val();
		//location.href='answerEdit.do?idx='+rid+"&acontent="+rcontent; //(4번)
		var bindex = bIndex;
		var form = {
				rcontent : rcontent,
				r_num : rNum
		};
		
		$.ajax({
			type: 'put',
			url: '${pageContext.request.contextPath}/board/shows/replyModify',
			cache : false,
  			dataType: 'text',
  			data : JSON.stringify(form),
  			contentType: 'application/json; charset=utf-8',
  			success : function(result){
  				if(result == "SUCCESS"){
  					swal({
  						title :"댓글 수정 완료" , 
						icon : "success" , 
  						button :"확인",
  						//timer: 5000,
  					})
  					.then(function(){
 						//$(location).attr('href', "${pageContext.request.contextPath}/board/shows/content_view/" +bindex+aaa); // 주소 이동
 							
 						// 페이지 새로고침지 원래 위치로 돌아오기 https://devonaws.com/front-end/javascript/javascript-%ED%98%84%EC%9E%AC-%EC%8A%A4%ED%81%AC%EB%A1%A4-%EC%9C%84%EC%B9%98%EC%97%90%EC%84%9C-%EC%83%88%EB%A1%9C%EA%B3%A0%EC%B9%A8/
  						document.location.reload(true);
  					});
  				}
  			}, //success end
  			error : function (e) {
				console.log(e);
			}
		}); //ajax end
	};
		
	/* 인풋박스에 신청 날짜가 오늘 날짜로 입력되도록 하는 자바스크립트 코드  */
	/* This script and many more are available free online at
	The JavaScript Source!! http://javascript.internet.com
	Created by: Jean P. May, Jr. | http://www.wideopenwest.com/~thebearmay */
	 	
	function autoDate () {
			
		var tDay = new Date();
		var tMonth = tDay.getMonth()+1;
		var tDate = tDay.getDate();
		if ( tMonth < 10) tMonth = "0"+tMonth;
		if ( tDate < 10) tDate = "0"+tDate;
		document.getElementById("rdate").value = tDay.getFullYear()+"년 "+tMonth+"월 "+tDate+"일";
		//document.getElementById("rdate").value = tDay.getFullYear()+"/"+tMonth+"/"+tDate;
	};
		
	// Multiple onload function created by: Simon Willison
	// http://simonwillison.net/2004/May/26/addLoadEvent/
	function addLoadEvent(func) {
		var oldonload = window.onload;
		if (typeof window.onload != 'function') {
			window.onload = func;
		} else {
			window.onload = function() {
				if (oldonload) {
					oldonload();
				};
				func();
			};
		};
	};
	addLoadEvent(function() {
		autoDate();
	}); 

</script>

<style>
/*  a 태그 후버시 밑줄, 파랑 속성 제거 */
a:hover { 
 	text-decoration: none;
 	color:#333;
}
#forimg {
	background-color: #e4edfe;
	background-image: url('/resources/banner_imgs/people_banner.png');
	background-repeat:no-repeat;
	background-position: center;
}
.black-transparent {
	opacity:50%;
}
.charity-blog-social ul {
	margin:0px;
}
#resubmit.submit{
	cursor: pointer;
}
#resubmit.submit:hover{
	color:white;
	background-color: #78665A;
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
                <div class="col-md-12"> 
                      <!-- <h1>인증게시판</h1>
                    <p>show your support</p> -->
                </div>
            </div>
        </div>
    </div>
    <!-- Banner -->

    <!-- Content -->
    <div class="charity-fancy-title " style="margin-top:70px; margin-bottom:20px;">
		<h2> 나눔 인증 </h2>
	</div> 
    
    <div class="charity-main-content">

		<!-- Main Section -->
		<div class="charity-main-section">
			<div class="container">
				<div class="row">
					<div class="col-md-9">
						<div class="charity-rich-editor">
                          
                            <!-- 글 제목 -->
							<h1>${content_view.btitle}</h1> 
							<hr> 
							<!-- 대표 이미지(썸네일 등록한거는) 컨텐트 뷰 에서는 사용 안하기로 -->
							<%-- <figure class="charity-postthumb"><img src="${pageContext.request.contextPath}/resources/charity/extra-images/blog-detail-img.png" alt=""></figure> --%>
							
							<!-- 넘버링, 계산들 -->
							<div class="charity-blog-options" style="height:30px;">
                                <ul style="float:right">
                                	<li><i class="fa fa-user"></i>  ${content_view.member_id} &nbsp;  </li> <!-- 작성자 -->
                                	<li><i class="fa fa-folder-open"></i>  No. ${content_view.b_index} </li> <!-- 게시판 글번호 -->
                                    <li style="text-indent: 0.3em"><i class="fa fa-calendar"></i>  ${content_view.bdate}</li> <!-- 작성일 -->
                                    <li style="text-indent: 0.3em"><i class="fa fa-comments"></i> 댓글수 ${replyCount} </li> <!-- 댓글수 -->
                                    													<!-- 댓글 수 카운트는 아직 새로고침 해야 반영된다. -->
                                    <li style="text-indent: 0.3em"><i class="fa fa-mouse-pointer"></i> 조회수 ${content_view.bhit}</li> <!-- 글 조회수 -->
                                </ul>
                            </div>
                            
                            <!-- 글 내용 -->
                            <p>${content_view.bcontent}</p><br>
                           
                             
                            <!-- 버튼 -->
                            <div class="charity-post-tags" >
                              	<div class="charity-tags">
                              		<sec:authorize access="hasRole('ADMIN')">
	                            	<span style="color:orange;">관리자:</span>
	                            	<%-- <a href="/my/board/shows/modify_view?b_index=${content_view.b_index}" class="fa fa-edit" style="color:orange;"> 수정 </a> --%>
									<%-- <a href="/my/board/shows/modify_view/${content_view.b_index}" class="fa fa-edit" style="color:orange;"> 글수정&nbsp; </a>   --%>
	                            	<a id="del_btn" href="/my/board/shows/delete/${content_view.b_index}" class="fa fa-eraser" style="color:orange;"> 글삭제</a>
	                            	</sec:authorize>
	                           	</div>
                                <div class="charity-blog-social">
                                 	<span></span>
                                    <ul>
                                    	<li><a href="${pageContext.request.contextPath}/board/shows/list" class="fa fa-list-alt"> 게시글 목록보기</a></li>
                                    	<sec:authentication property="principal" var="pinfo" />
										<sec:authorize access="isAuthenticated()">
										<c:if test="${pinfo.username eq content_view.member_id}"> 
                                        	<li><a href="/my/board/shows/modify_view/${content_view.b_index}" class="fa fa-edit"> 수정</a></li>
                                        	<li><a id="del_btn" href="/my/board/shows/delete/${content_view.b_index}" class="fa fa-eraser"> 삭제</a></li>
                                        </c:if>
                                        </sec:authorize>
                                        <!-- onClick="bcontent_del();" -->
                                    </ul>
                                </div>
                            </div>
                        </div>
                        <!-- 버튼 -->
                       
                        <!-- 이전, 다음글 보기 -->
                      <%--   <div class="charity-prenxt-post">
                            <ul>
                                <li class="charity-prev-post">
                                    <figure>
                                        <a href="404.html"><img src="${pageContext.request.contextPath}/resources/charity/extra-images/post-img1.png" alt=""></a>
                                    </figure>
                                    <div class="charity-prev-artical">
                                        <a href="404.html" class="charity-post-arrow"><i class="fa fa-angle-double-left"></i> Previous Article</a>
                                        <h3><a href="404.html" class="prev_btn">Duis arcu lectus, interdum quisi sodales</a></h3>
                                    </div>
                                </li>
                                <!-- 다음글 -->
                                <li class="charity-next-post">
                                    <figure>
                                        <a href="404.html"><img src="${pageContext.request.contextPath}/resources/charity/extra-images/post-img2.png" alt=""></a>
                                    </figure>
                                    <div class="charity-next-artical">
                                        <a href="404.html" class="charity-post-arrow">Next Article <i class="fa fa-angle-double-right"></i></a>
                                        <h3><a href="404.html">Duis arcu lectus, interdum quisi sodales</a></h3>
                                    </div>
                                </li>
                            </ul>
                        </div> --%>
                        <!-- 이전, 다음글 보기 -->
                       
                        <!-- 댓글 -->
                        <div class="widget_title"><h2>댓글</h2></div><!-- Comments -->
                        <div class="comments-area">
                            
                            <!--// comments \\-->
                            <ul id="listComment"  class="comment-list">
                            
                             	<!-- prepend 자리 -->
                            	
                            	<c:if test="${empty listComment}">
									<p id="nothing" align="center">작성된 댓글이 없습니다</p>
								</c:if>
                             
                             	<c:if test="${! empty listComment}">
                             	<%-- <c:set var="listComment" value="${listComment}" /> --%> <!-- 이건 왜 쓰는건지 잘 모르겠당 -->
                             	<c:forEach var="vo" items="${listComment}">
	                                
	                                <li class="rlist">
	                                    <div class="thumb-list">
	                                    <!-- 랜덤이미지:  class="usre_img" 사용해서 함수실행하고 랜덤 이미지를 돌려가면서 뿌려준다. -->
	                                       <figure><img id="introImg" class="usre_img" src="${pageContext.request.contextPath}/resources/users/user01_sm.png"></figure> 
	                                        
	                                        <div class="text-holder">
	                                            <h6><c:out value="${vo.rid}"/></h6><!-- 작성자 -->
	                                            <div><c:out value="${vo.rdate}"/></div><!-- 작성일 -->
	                                            <p id="modify${vo.r_num}"><c:out value="${vo.rcontent}"/></p><!-- 댓글내용 -->	                                            
	                                            
	                                            <br>
	                                            <sec:authentication property="principal" var="pinfo" />
												<sec:authorize access="isAuthenticated()">
												<c:if test="${pinfo.username eq vo.rid || pinfo.getmember().getAuthname() eq '관리자'}">  
		                                            <div class="charity-blog-social" id="abt${vo.r_num}" >
			                                            <i class="fa fa-edit"></i><a class="a-updateView" href="javascript:void(0);" onclick="answerEdit('${vo.b_index}','${vo.rid}','${vo.rcontent}','${vo.r_num}')" style="color:#333" > <b>수정하기&nbsp;</b></a>   
		                                    		    <i class="fa fa-eraser"></i><a class="a-del" href="${pageContext.request.contextPath}/board/shows/delete/${vo.r_num}" style="color:#333"  ><b> 삭제하기</b></a>
	                                    		    </div>
	                                    		    
                                    		    </c:if>
                                    		    </sec:authorize>
	                                            <br> 

	                                        </div>  <!-- text-holder end -->
	                                    </div> <!-- thumb-list end -->
	                                </li> <!-- rlist end -->
	                                
                                </c:forEach>
                                </c:if>
                            </ul>
                            <!--// comments \\-->
                        </div>
                       
                        <!--// 댓글 작성 영역 comment-respond \\-->
                        <div class="widget_title"><h2>댓글을 남겨주세요.</h2></div><!-- Leave a Comment -->
                        <div class="comment-respond">
                            <form id="insertForm" action="${pageContext.request.contextPath}/board/shows/reply_insert" method="post">
                                <input type="hidden" id="b_index" name="b_index" value="${content_view.b_index}"/>
									<sec:authentication property="principal" var="pinfo" />
									<sec:authorize access="isAuthenticated()">
									<c:if test="${! empty  pinfo.username}"> 
	                                <p>
	                                    <label>작성자(아이디)</label>
	                                    <input type="text" id="rid" name="rid" value="<c:out value='${pinfo.username}'/>" readonly> <!-- 문제는 이렇게 바꾸니까 값이 안넘어간다 ㅠㅠ -->
	                                  <%--   <input type="text" id="rid" name="rid" value="<sec:authentication property="principal.member.member_id"/>"  readonly >  
	                                   			이거쓰면 로그인 안한 사람이 댓글 없는 컨텐트뷰에 들어올 때 에러남 --%>
	                                </p>
	                                </c:if>
                               	 	</sec:authorize> 
                                <p>
                                    <label>작성일</label>
                                    <input type="text" id="rdate" disabled >
                                </p>   
                                <p class="charity-respond-full-form">
                                    <label>댓글내용</label>
                                    <textarea id="rcontent" name="rcontent" placeholder="댓글을 작성하세요." class="commenttextarea"></textarea>
                                </p>
                                <p class="form-submit">
                                	<input id="resubmit" name="submit" class="submit" value="댓글작성" type="submit">
                                </p>
                                <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" />
                            </form>
                        </div>
                        <!--// 댓글 작성 영역 comment-respond \\-->
                        
                        <div style="float: right; margin-right:5px; "> <a href="${pageContext.request.contextPath}/board/shows/list" class="fa fa-list-alt" style="color:#333"> 나눔 인증 목록으로 </a></div>
                        
                    </div>
 					<!-- aside 제외한 왼쪽 컨텐츠 div 끝 -->

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
 
	<script>
	// 댓글 작성 누를 때 로그인 체크: 로그인이 되어있지 않으면 alert창이 뜨고 확인버튼을 누르면 loginPage로 이동한다.
	$(document).ready(function() {
		var rid = $("#rid").val();
		function checkLogin() {
			if (rid == undefined) {
				// 예쁜 alert창
				// 주소이동하는방법 참고: https://onecutwook.tistory.com/3
				// .then키워드는 확인 버튼을 클릭하고 나서 이후의 동작을 정의할 수 있다. => 이 화살표 연산자는 익스플로러에서 작동이 되지 않는다고한다.
				swal({
					text: "로그인 후 글을 작성해주세요.",
					icon: "error",
					button :"확인",
					//timer: 5000,
				})
				.then(function(){
					location.href = '/loginPage'
				});
				//alert("로그인 후 글을 작성해주세요.");
			};
		};
		//댓글 작성 로그인 체크
		$('#resubmit').click(function() {
			checkLogin();
		});
	});
	
	</script>

    <script type="text/javascript">
	   	 
   		// 랜덤 이미지 불러오기 (슬비씨 깃허브 참고: https://github.com/seulpi/TIL/blob/cfae84682eb65d8e85f76de11de663a17f14f22f/Quiz/spring_Answer11.md#5-view )
		$(function(){
	    	$('.usre_img').each(function (index, item) {	        	
	        	var imgUrl = '${pageContext.request.contextPath}/resources/users/user0' + Math.floor((Math.random() * 5) + 1) + '_sm.png';
	        	console.log(imgUrl);
	        	console.log($(item).attr("src"));
	        	$(item).attr("src", imgUrl);
		});
	    	
    	// 댓글 입력 및 ajax로 작성한 댓글 불러오기
    	 $("#insertForm").submit(function(event){
    		event.preventDefault();
    		
    		//alert("insert 시작");
    		// 전달할 값 넣기
    		var b_index = $("#b_index").val();
    		var rid = $("#rid").val();
    		var rcontent = $("#rcontent").val();
    		
    		// 작성된 댓글이 없습니다.
    		//var nothing = $('#nothing').val();
    		
    		// 오늘날짜 받기
            var tDay = new Date();
    		var tMonth = tDay.getMonth()+1;
    		var tDate = tDay.getDate();
    		
    		if ( tMonth < 10) tMonth = "0"+tMonth;
    		if ( tDate < 10) tDate = "0"+tDate;
          	
    		var date = (tDay.getFullYear()+"-"+tMonth+"-"+tDate); // 이거를 바로 쏴주면 sql에러가 났었다.
          
          	var rdate = new Date(date); //그래서 이렇게 변환해서 서버로 넣으니까 잘 들어간다. 하지만 ajax로 뷰단에 쏴줄때는 위의 date를 뿌려줘야 yyyy-mm-dd형식으로 잘 뿌려진다.
    		console.log("rdate= " + rdate + "date= " + date ) ;
    		
    		console.log(b_index,  rid, rcontent, rdate);
    		
    	 	var form = {
    				b_index: b_index,
    				rid : rid,
    				rcontent : rcontent,
    				rdate : rdate
    		};  
    	 	
    	 	// csrf
    	    var token = $("meta[name='_csrf']").attr("content");
            var header = $("meta[name='_csrf_header']").attr("content");
            $(document).ajaxSend(function(e, xhr, options) {
                xhr.setRequestHeader(header, token);
            });
           
     		$.ajax({
    			type:"POST",
    			url:"${pageContext.request.contextPath}/board/shows/reply_insert",
    			cache : false,
    			dataType: 'text',
    			contentType:'application/json; charset=UTF-8',
    			data: JSON.stringify(form),
    			success : function(r_num) {
    					//alert("r_num = " + r_num)
    					//alert(result.replyVO.r_num)
    					//alert(result.rvo.b_index)
    					
	    				swal({
						  title : "댓글 입력 완료" , 
						  icon : "success" , 
						  button : true 
						})
    					
    					htmls = '';
	    				
	    				
    					htmls += '<li>'
    					htmls += '<div class="thumb-list">'
    					htmls += '<figure><img id="introImg" class="usre_img" src="${pageContext.request.contextPath}/resources/users/user02_sm.png"></figure>'
    					htmls += '<div class="text-holder">'
    					htmls += '<h6>' + rid + '</h6>'
    					htmls += '<div>' + date + '</div>' /* rdate를 뿌리면 Mon Apr 12 2021 09:00:00 GMT+0900 (대한민국 표준시)가 나옴  */             
    					htmls += '<p id="modify'+r_num +'">' + rcontent + '</p>'
						htmls += '<div class="charity-blog-social" id="abt'+r_num +'">'
						htmls += '<i class="fa fa-edit"></i><b><a href="javascript:void(0);" onclick="answerEdit(\''+b_index+'\',\''+rid+'\',\''+rcontent+'\',\''+r_num+'\')" style="color:#333">수정하기 &nbsp;</a></b>'
						htmls += '<i class="fa fa-eraser"></i><a class="a-del" href="${pageContext.request.contextPath}/board/shows/delete/'+r_num+'" style="color:#333"><b>삭제하기</b></a></div>'
    					htmls += '</div>'
    					htmls += '</div>'
    					htmls += '</li>'
    						
    					$("#listComment").prepend(htmls); // 작성 결과 입력
    					
    					$('#rcontent').val(''); //인풋박스 초기화
    					$('#nothing').hide();
    					
    					
    					$(".a-del").click(function(event) { //id는 한번만 calss는 여러번 선택 가능
    			    		//하나의 id는 한 문서에서 한 번만 사용이 가능(가장 마지막 혹은 처음게 선택)
    			    		event.preventDefault(); 
    			    	
    			    		//alert("replyDel click");
    			    		console.log("replyDel click");
    			    		
    			    		// csrf
    			    	    var token = $("meta[name='_csrf']").attr("content");
    			            var header = $("meta[name='_csrf_header']").attr("content");
    			            $(document).ajaxSend(function(e, xhr, options) {
    			                xhr.setRequestHeader(header, token);
    			            });
    			            
    			    		var tr = $(this).parent().parent().parent().parent();
    			    		
    			    		$.ajax({
    			    			type : 'DELETE', //method
    			    			url : $(this).attr("href"),
    			    			cache : false,
    			    			success : function(result) {
    			    				console.log("result: " + result); 
    			    			
    			    					if (result == "SUCCESS") {
    			    					$(tr).remove();
    			    					//alert("삭제되었습니다.");
    			    					swal({
    									  title : "댓글이 삭제되었습니다." , 
    									  icon : "success" , 
    									  button : true 
    									})
    			    				}
    			    			},
    			    			errer : function(e) {
    			    				console.log(e);
    			    			}
    			    		}); //end of ajax
    			     	}); // 삭제 종료
	   					
    			     	
    				},
    				error : function(request, status, error) {
    					//alert("code:" + request.status + "\n" + "message:"
    					//		+ request.responseText + "\n" + "error:" + error);
    				} // ajax 에러 시 end
    				
    		}); //ajax end
    		
    	});//#insertForm end
    	
    	// 댓글 삭제
    	$(".a-del").click(function(event) { //id는 한번만 calss는 여러번 선택 가능.
    		//하나의 id는 한 문서에서 한 번만 사용이 가능(가장 마지막 혹은 처음게 선택). 
    		event.preventDefault(); 
    	
    		//alert("replyDel click");
    		console.log("replyDel click");
    		
    		// csrf
    	    var token = $("meta[name='_csrf']").attr("content");
            var header = $("meta[name='_csrf_header']").attr("content");
            $(document).ajaxSend(function(e, xhr, options) {
                xhr.setRequestHeader(header, token);
            });
            
    		var tr = $(this).parent().parent().parent().parent();//자바스크립트 클로저
    		
    		$.ajax({
    			type : 'DELETE', //method
    			url : $(this).attr("href"), //주소를 받아오는 것이 두 번째 포인트.
    			cache : false,
    			success : function(result) {
    				console.log("result: " + result);
    				
    					if (result == "SUCCESS") {
    					$(tr).remove();
    					//alert("삭제되었습니다.");
    					swal({
						  title : "댓글이 삭제되었습니다." , 
						  icon : "success" , 
						  button : true 
						})
    				}
    			},
    			errer : function(e) {
    				console.log(e);
    			}
    		}); //end of ajax
    		
     	}); // 삭제 종료
     
    });
    </script>	
	<!-- <a href='https://www.freepik.com/vectors/people'>People vector created by rawpixel.com - www.freepik.com</a> -->
    <!-- jQuery -->
    <script src="${pageContext.request.contextPath}/resources/charity/script/jquery.js"></script>
    <script src="${pageContext.request.contextPath}/resources/charity/script/popper.min.js"></script>
    <script src="${pageContext.request.contextPath}/resources/charity/script/bootstrap.min.js"></script>
    <script src="${pageContext.request.contextPath}/resources/charity/script/slick.slider.min.js"></script>
    <script src="${pageContext.request.contextPath}/resources/charity/script/progressbar.js"></script>
    <script src="${pageContext.request.contextPath}/resources/charity/script/fancybox.min.js"></script>
    <script src="${pageContext.request.contextPath}/resources/charity/script/jquery.countdown.min.js"></script>
    <script src="https://maps.googleapis.com/maps/api/js"></script>
    <script src="${pageContext.request.contextPath}/resources/charity/script/jquery.jplayer.js"></script>
    <script src="${pageContext.request.contextPath}/resources/charity/script/jplayer.playlist.js"></script>
    <script src="${pageContext.request.contextPath}/resources/charity/script/functions-main.js.js"></script>
</body>

</html>