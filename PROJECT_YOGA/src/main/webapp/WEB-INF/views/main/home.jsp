<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@include file="../includes/navhome.jsp"%>

<!-- Masthead-->
<header class="masthead">
	<div class="container px-4 px-lg-5 h-100">
		<div
			class="row gx-4 gx-lg-5 h-100 align-items-center justify-content-center text-center">
			<div class="col-lg-8 align-self-end">
				<h1 class="text-white font-weight-bold">Relaxing life</h1>
				<hr class="divider" />
			</div>
			<div class="col-lg-8 align-self-baseline">
				<sec:authorize access="isAuthenticated()">
					<p class="text-white-75 mb-5">
						<sec:authentication property="principal" var="pinfo" />
						<a style="text-decoration: none;"> ${user.name}</a>님 환영합니다.
					</p>
					<a class="btn btn-primary btn-xl" href="main/intro">INTRO</a>
				</sec:authorize>
				<sec:authorize access="isAnonymous()">
					<p class="text-white-75 mb-5">
						<sec:authentication property="principal" var="pinfo" />
						회원가입 하시면 더욱 다양한 정보를 확인하실수 있습니다.
					</p>
					<a class="btn btn-primary btn-xl" href="../member/insert"
						style="font-weight: 500;">MEMBER</a>
				</sec:authorize>
			</div>
		</div>
	</div>
</header>
<!-- About-->
<section class="page-section bg-primary" id="about">
	<div class="container px-4 px-lg-5">
		<div class="row gx-4 gx-lg-5 justify-content-center">
			<div class="col-lg-8 text-center">
				<h2 class="text-white mt-0">A Healing Place for your Body and
					Mind</h2>
				<hr class="divider divider-light" />
				<p class="text-white-75 mb-4">YOGA</p>
				<a class="btn btn-light btn-xl2" href="/Lesson/lesson"
					style="color: #a9907e; font-size: 20px; font-weight: bolder;">수강신청
					하러가기</a>
			</div>
		</div>
	</div>
</section>
<!-- Portfolio-->
<div id="portfolio">
	<div class="container-fluid p-0">
		<div class="row g-0">
			<div class="col-lg-4">
				<a class="portfolio-box"
					href="../resources/assets/img/portfolio/fullsize/yoga7.jpg"
					title="Project Name"> <img class="img-fluid"
					src="../resources/assets/img/portfolio/thumbnails/yoga7.jpg"
					alt="..." />
					<div class="portfolio-box-caption">
						<div class="project-category text-sig-brownD-50">Click me!</div>
						<div class="project-name">Class A</div>
					</div>
				</a>
			</div>
			<div class="col-lg-4">
				<a class="portfolio-box"
					href="../resources/assets/img/portfolio/fullsize/yoga1.jpg"
					title="Project Name"> <img class="img-fluid"
					src="../resources/assets/img/portfolio/thumbnails/yoga1.jpg"
					alt="..." />
					<div class="portfolio-box-caption">
						<div class="project-category text-sig-brownD-50">Click me!</div>
						<div class="project-name">Class A</div>
					</div>
				</a>
			</div>
			<div class="col-lg-4">
				<a class="portfolio-box"
					href="../resources/assets/img/portfolio/fullsize/yoga2.jpg"
					title="Project Name"> <img class="img-fluid"
					src="../resources/assets/img/portfolio/thumbnails/yoga2.jpg"
					alt="..." />
					<div class="portfolio-box-caption">
						<div class="project-category text-sig-brownD-50">Click me!</div>
						<div class="project-name">Class A</div>
					</div>
				</a>
			</div>
			<div class="col-lg-4">
				<a class="portfolio-box"
					href="../resources/assets/img/portfolio/fullsize/yoga3.jpg"
					title="Project Name"> <img class="img-fluid"
					src="../resources/assets/img/portfolio/thumbnails/yoga3.jpg"
					alt="..." />
					<div class="portfolio-box-caption">
						<div class="project-category text-sig-brownD-50">Click me!</div>
						<div class="project-name">Class B</div>
					</div>
				</a>
			</div>
			<div class="col-lg-4">
				<a class="portfolio-box"
					href="../resources/assets/img/portfolio/fullsize/yoga5.jpg"
					title="Project Name"> <img class="img-fluid"
					src="../resources/assets/img/portfolio/thumbnails/yoga5.jpg"
					alt="..." />
					<div class="portfolio-box-caption">
						<div class="project-category text-sig-brownD-50">Click me!</div>
						<div class="project-name">Class B</div>
					</div>
				</a>
			</div>
			<div class="col-lg-4">
				<a class="portfolio-box"
					href="../resources/assets/img/portfolio/fullsize/yoga6.jpg"
					title="Project Name"> <img class="img-fluid"
					src="../resources/assets/img/portfolio/thumbnails/yoga6.jpg"
					alt="..." />
					<div class="portfolio-box-caption p-3">
						<div class="project-category text-sig-brownD-50">Click me!</div>
						<div class="project-name">Class B</div>
					</div>
				</a>
			</div>
		</div>
	</div>
</div>
<!-- notice-->
<section id="notice">
	<div class="container noticeContact">
		<div class="row gx-4 gx-lg-5 justify-content-center">
			<div class="col-lg-8 col-xl-6 text-center">
				<h2 class="mt-0" style="color: #609966">Time Table</h2>
				<hr class="divider" />
			</div>
			<table class="text-center" style="width: 950px; height: 350px;">
				<tr>
					<th style="width:9%">시간</th>
					<th style="width:7%">강의실</th>
					<th style="width:9%">강사</th>
					<th style="width:15%">월</th>
					<th style="width:15%">화</th>
					<th style="width:15%">수</th>
					<th style="width:15%">목</th>
					<th style="width:15%">금</th>
				</tr>
				<tr>
					<td rowspan="2">10시~11시</td>
					<td>A</td>
					<c:forEach items="${courseList}" var="course">
						<c:if test="${course.ccode eq 'A1000'}">
							<td><c:out value="${course.cteacher}"/></td>
						</c:if>
					</c:forEach>
					<c:forEach items="${courseList}" var="course">
						<c:if test="${course.ccode eq 'A1000'}">
							<td style="background-color: #edf1d6;"><c:out value="${course.cname}"/></td>
							<td></td>
							<td style="background-color: #edf1d6;"><c:out value="${course.cname}"/></td>
							<td></td>
							<td style="background-color: #edf1d6;"><c:out value="${course.cname}"/></td>
						</c:if>
					</c:forEach>
				</tr>
				<tr>
					<td>B</td>
					<c:forEach items="${courseList}" var="course">
						<c:if test="${course.ccode eq 'B1000'}">
							<td><c:out value="${course.cteacher}"/></td>
						</c:if>
					</c:forEach>
					<c:forEach items="${courseList}" var="course">
						<c:if test="${course.ccode eq 'B1000'}">
							<td></td>
							<td style="background-color: #edf1d6;"><c:out value="${course.cname}"/></td>
							<td></td>
							<td style="background-color: #edf1d6;"><c:out value="${course.cname}"/></td>
							<td></td>
						</c:if>
					</c:forEach>
				</tr>
				<tr>
					<td rowspan="2">15시~16시</td>
					<td>A</td>
					<c:forEach items="${courseList}" var="course">
						<c:if test="${course.ccode eq 'A2000'}">
							<td><c:out value="${course.cteacher}"/></td>
						</c:if>
					</c:forEach>
					<c:forEach items="${courseList}" var="course">
						<c:if test="${course.ccode eq 'A2000'}">
							<td style="background-color: #edf1d6;"><c:out value="${course.cname}"/></td>
							<td></td>
							<td style="background-color: #edf1d6;"><c:out value="${course.cname}"/></td>
							<td></td>
							<td style="background-color: #edf1d6;"><c:out value="${course.cname}"/></td>
						</c:if>
					</c:forEach>
				</tr>
				<tr>
					<td>B</td>
					<c:forEach items="${courseList}" var="course">
						<c:if test="${course.ccode eq 'B2000'}">
							<td><c:out value="${course.cteacher}"/></td>
						</c:if>
					</c:forEach>
					<c:forEach items="${courseList}" var="course">
						<c:if test="${course.ccode eq 'B2000'}">
							<td></td>
							<td style="background-color: #edf1d6;"><c:out value="${course.cname}"/></td>
							<td></td>
							<td style="background-color: #edf1d6;"><c:out value="${course.cname}"/></td>
							<td></td>
						</c:if>
					</c:forEach>
				</tr>
				<tr>
					<td rowspan="2">20시~21시</td>
					<td>A</td>
					<c:forEach items="${courseList}" var="course">
						<c:if test="${course.ccode eq 'A3000'}">
							<td><c:out value="${course.cteacher}"/></td>
						</c:if>
					</c:forEach>
					<c:forEach items="${courseList}" var="course">
						<c:if test="${course.ccode eq 'A3000'}">
							<td style="background-color: #edf1d6;"><c:out value="${course.cname}"/></td>
							<td></td>
							<td style="background-color: #edf1d6;"><c:out value="${course.cname}"/></td>
							<td></td>
							<td style="background-color: #edf1d6;"><c:out value="${course.cname}"/></td>
						</c:if>
					</c:forEach>
				</tr>
				<tr>
					<td>B</td>
					<c:forEach items="${courseList}" var="course">
						<c:if test="${course.ccode eq 'B3000'}">
							<td><c:out value="${course.cteacher}"/></td>
						</c:if>
					</c:forEach>
					<c:forEach items="${courseList}" var="course">
						<c:if test="${course.ccode eq 'B3000'}">
							<td></td>
							<td style="background-color: #edf1d6;"><c:out value="${course.cname}"/></td>
							<td></td>
							<td style="background-color: #edf1d6;"><c:out value="${course.cname}"/></td>
							<td></td>
						</c:if>
					</c:forEach>
				</tr>
			</table>
		</div>
	</div>
	<div class="container noticeContact">
		<div class="row gx-4 gx-lg-5 justify-content-center">
			<div class="col-lg-8 col-xl-6 text-center">
				<h2 class="mt-0" style="color: #609966">Contact Us</h2>
				<hr class="divider" />
			</div>
			<div class="text-center" style="width: 700px; height: 350px;" id="map"></div>
		</div>
	</div>
</section>
<script type="text/javascript"
	src="//dapi.kakao.com/v2/maps/sdk.js?appkey=a9531572ad5a526f8e3b9abf79a0038e"></script>
<script>
	var container = document.getElementById('map'), option = {
		center : new kakao.maps.LatLng(36.64381054056646, 127.48745627405158),
		level : 3,
	};

	var map = new kakao.maps.Map(container, option);

	var marker = new kakao.maps.Marker({
		map : map,
		position : new kakao.maps.LatLng(36.64381054056646, 127.48745627405158)
	});

	var content = '<div class="wrap" style="background-color: white; width: 60px; height: 26px;border-radius: 3px; text-align:center; border: 1px solid rgb(224, 219, 219);">'
			+ '<a style="text-decoration: none; font-size: 15px;" href="https://map.kakao.com/?urlX=608977&urlY=873987&itemId=968661366&q=%ED%95%9C%EA%B5%AD%EC%95%84%EC%9D%B4%ED%8B%B0%EC%A0%84%EB%AC%B8%ED%95%99%EC%9B%90&srcid=968661366&map_type=TYPE_MAP&from=roughmap">'
			+ '<b>YOGA</b>' + '</a>' + '</div>';

	var overlay = new kakao.maps.CustomOverlay({
		content : content,
		map : map,
		position : marker.getPosition(),
		yAnchor : 2.7
	});

	overlay.setMap(map);
</script>
<%@include file="../includes/footer.jsp"%>
