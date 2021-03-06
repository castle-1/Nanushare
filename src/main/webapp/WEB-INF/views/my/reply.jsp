<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="sec"
	uri="http://www.springframework.org/security/tags"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>


<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<!-- 이건무조건 여기있어야함 -->
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<!-- jquery validation cdn 이거 두개 안되면 폼태그 끝나는 시점 바로 밑에 넣기-->
<!-- jquery 플러그인 이기때문에 jquery가 있어야 한다. -->
<script type="text/javascript"
	src="https://cdn.jsdelivr.net/jquery.validation/1.16.0/jquery.validate.min.js"></script>

<!-- jquery validation method cdn -->
<script type="text/javascript"
	src="https://cdn.jsdelivr.net/jquery.validation/1.16.0/additional-methods.min.js"></script>


<!-- meta tags -->
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<%-- <meta id="_csrf" name="_csrf" th:content="${_csrf.token}" />  에러 주범??  --%>

<!-- 헤더 안에 추가  -->
<!-- csrf 관련이슈 해결방법 : jsp에 meta 태그추가(csrf값 얻기위해) -->
<!-- js에서 csrf 토큰, 헤더등록 -->
<meta name="_csrf" content="${_csrf.token}">
<meta name="_csrf_header" content="${_csrf.headerName}">

<title>Nanushare</title>
<link rel="shortcut icon" type="image/x-icon"
	href="${pageContext.request.contextPath}/resources/nanulogo_ico_convert.ico">
<!-- 웹페이지 탭 로고이미지 삽입  -->



<!-- 탭처리 -->
<link rel="stylesheet"
	href="//unpkg.com/bootstrap@4/dist/css/bootstrap.min.css">
<script src='//unpkg.com/jquery@3/dist/jquery.min.js'></script>
<script src='//unpkg.com/popper.js@1/dist/umd/popper.min.js'></script>
<script src='//unpkg.com/bootstrap@4/dist/js/bootstrap.min.js'></script>

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

<link rel="stylesheet" href="/resources/charity/css/style_mypage_hj.css">


<link rel="stylesheet"
	href="https://pro.fontawesome.com/releases/v5.10.0/css/all.css"
	integrity="sha384-AYmEC3Yw5cVb3ZcuHtOA93w35dYTsvhLPVnYs9eStHfGJvOvKxVfELGroGkvsg+p"
	crossorigin="anonymous" />


<!-- header -->
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css">

</head>
<style>
li {
	list-style: none;
}

a:hover { 
    text-decoration: none;
}
</style>
<style>
#forimg {
	background-color: white;
	background-image: url('/resources/charity/qna/mypage2.png');
	background-size: 1600px;
	background-repeat: repeat;
	background-position: center;	
}

.black-transparent {
	opacity: 50%;
}

.charity-volunteer-form {
	background-color: #f9f9fb;
}
</style>

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
                  
                </div>
            </div>
        </div>
    </div>
	<!-- Banner -->
	<!-- Content -->
	<!-- Content와 MainSection은 무조건 있어야함 -->
	<div class="charity-main-content">
		<!-- Main Section -->
		<div class="charity-main-section">

			<!-- https://www.bootdey.com/snippets/view/Update-user-profile#preview -->
			<!--  col-md-10 으로 넓이 넓힘 -->
			<div class="container col-md-10">
				<div class="view-account">
					<section class="module">
						<div class="module-inner">

							<!-- sidebar -->
							<div class="side-bar"> 
								<!-- profile -->
								

	<div class="user-info" >
		<figure>
			<img id="introImg" class="usre_img"
				src="${pageContext.request.contextPath}/resources/users/user01_sm.png">
		</figure>
		<ul class="meta list list-unstyled">
			<li class="name"><h2>
					<sec:authentication property="principal.member.name" />
				</h2></li>
			<li class="email"><sec:authentication
					property="principal.member.member_id" /></a></li>
			<li class="activity"><sec:authentication
					property="principal.member" var="buttonhidden" /> <sec:authorize
					access="isAuthenticated()">

					<c:if test="${buttonhidden.signuppath == 'home'}">

						<button class="charity-simple-blog-btn w-100 text-white stats"
							type="submit"
							onclick="location.href ='${pageContext.request.contextPath}/my/myprofile'">
							프로필수정</button>

					</c:if>
				</sec:authorize> <sec:authentication property="principal.member" var="buttonhidden" />
				<sec:authorize access="isAuthenticated()">

					<c:if test="${buttonhidden.signuppath != 'home'}">

						<button class="charity-simple-blog-btn w-100 text-white stats"
							type="submit"
							onclick="location.href ='${pageContext.request.contextPath}/my/drop'">
							회원탈퇴</button>

					</c:if>
				</sec:authorize></li>
		</ul>
	</div>
	<nav class="side-menu">
	<ul class="nav">
		<li><a href="mypage"><span class="fa fa-user"> </span>&nbsp;&nbsp;Profile</a></li>
		<li><a href="ask"><span class="fa fa-question"> </span>&nbsp;&nbsp;나의
				문의 내역</a></li>
		<li><a href="content"><span class="fa fa-file"> </span>&nbsp;&nbsp;나의
				인증 내역</a></li>
		<li><a href="give"><span class="fa fa-handshake"> </span>&nbsp;&nbsp;나의
				나눔 내역</a></li>
		<li class="active"><a href="reply"><span class="fa fa-reply">
			</span>&nbsp;&nbsp;나의 댓글 내역</a></li>
		<li><a href="pay"><span class="fa fa-credit-card"> </span>&nbsp;&nbsp;나의
				결제 내역</a></li>
		<li><a href="point"><span class="fa fa-parking-circle"></span>&nbsp;&nbsp;나의
				포인트 내역</a></li>

	</ul>
	</nav>
	</div>

	<div class="content-panel">
		<script
			src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
		<div>&nbsp;</div>
		<div>&nbsp;</div>
		<div class="charity-fancy-title">
			<h2>나의 댓글 내역</h2>
		</div>

		<form id="boardForm" class="charity-volunteer-form" name="boardForm"
			style="margin-bottom: 0px; padding-bottom: 10px; background-color: white;">

			<table class="table taWWble-striped projects">
				<colgroup>
					<col width="20%" />
					<col width="40%" />
					<col width="40%" />


				</colgroup>
				<thead>
					<tr bgcolor="a5a5a5">
						<th>날짜</th>
						<th>인증게시판 제목</th>
						<th>나의 댓글</th>

						<!-- <th>아이디</th> -->

					</tr>
				</thead>
				<tbody>
					<c:if test="${empty list4}">
						<tr>
							<td colspan="5" align="center">작성된 댓글이 없습니다</td>
						</tr>
					</c:if>

					<!-- 나의댓글내역 -->
					<c:if test="${! empty list4}">
						<c:set var="list4" value="${list4}" />
						<c:forEach items="${list4}" var="dao4" varStatus="status">
							<c:forEach items="${dao4.reply}" var="dto4" varStatus="status">
								<sec:authentication property="principal" var="pinfo" />
								<sec:authorize access="isAuthenticated()">
									<c:if test="${pinfo.username eq dto4.rid}">
										<tr>
											<td>${dto4.rdate}</td>
											<td>${dao4.btitle}</td>
											<td><a id="a-content"
												href="${pageContext.request.contextPath}/board/shows/content_view/${dao4.b_index}">${dto4.rcontent}</a></td>
											<!-- 제목누르면 해당 글내용으로 이동링크 -->
										</tr>
									</c:if>
								</sec:authorize>
							</c:forEach>
						</c:forEach>
					</c:if>
				</tbody>
			</table>
		</form>


<!-- Pagination -->
 <c:if test="${! empty list4}">
						<div class="charity-pagination">
							<ul class="page-numbers">
								
								<!-- 이전페이지 버튼 -->
								<c:if test="${pageMaker.prev}">
									<li><a class="previous page-umbers" href="${pageContext.request.contextPath}/my/reply${pageMaker.makeQuery(pageMaker.startPage-1)}"><span aria-label="Next"><i class="fa fa-angle-left"></i>Previous Post</span></a></li>
								</c:if>
								
								<!-- 페이지 숫자 버튼들 -->
								<c:forEach begin="${pageMaker.startPage}" end="${pageMaker.endPage}" var="idx">
									<c:out value="${pageMaker.cri.pageNum == idx?'':''}" />
									<li><a class="page-umbers" href="${pageContext.request.contextPath}/my/reply${pageMaker.makeQuery(idx)}">${idx}</a></li>
								</c:forEach>
							
						                       	
								<!-- 다음페이지 버튼 -->
								<c:if test="${pageMaker.next && pageMaker.endPage > 0}">
									<li><a class="next page-umbers" href="${pageContext.request.contextPath}/my/reply${pageMaker.makeQuery(pageMaker.endPage+1)}"><span aria-label="Next">Next Post<i class="fa fa-angle-right"></i></span></a></li>
								</c:if>
							</ul>
						</div>
						</c:if>
						<!-- End of Pagination -->

	</div>
	</div>
	</section>
	</div>
	</div>

	<script>
		$("#mytabs>ul>li>a").each(function(i) {
			$(this).attr("href", "#mytab" + i)
		})
		$("#mytabs>div>div").each(function(i) {
			$(this).attr("id", "mytab" + i)
		})
	</script>

	<!-- Main Section -->

	</div>
	<!-- Content -->
	</div>

	<!-- Footer -->
	<%@ include file="/WEB-INF/views/mainMap/mainFooter.jsp"%>
	<!-- Footer -->

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
						<input type="submit" value=""> <i class="fa fa-search"></i>
					</form>
				</div>

			</div>
		</div>
	</div>


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
