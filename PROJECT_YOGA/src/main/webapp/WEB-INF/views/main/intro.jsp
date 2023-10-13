<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@include file="../includes/header.jsp"%>
<head>
<title>INTRO</title>
<style>
body {
	text-align: center;
}

table, th, td {
	border: 1px solid black;
}

table {
	width: 800px;
	height: 400px;
	margin: 0 auto;
	margin-top: 50px;
}

h1 {
	margin-top: 100px;
}

th, td {
	width: 100px;
}

div.test {
	width: 500px;
	height: 200px;
	text-align: center;
	margin: 200px auto;
	margin-bottom: 0;
	font-family: "Merriweather Sans", -apple-system, BlinkMacSystemFont,
		"Segoe UI", Roboto, "Helvetica Neue", Arial, "Noto Sans", sans-serif,
		"Apple Color Emoji", "Segoe UI Emoji", "Segoe UI Symbol",
		"Noto Color Emoji";
}
</style>
</head>

<h1>시간표</h1>
<hr class="divider-sh">
<table class="text-center" style="width: 60%; height: 500px">
	<tr>
		<th>시간</th>
		<th>강의실</th>
		<th>강사</th>
		<th>월</th>
		<th>화</th>
		<th>수</th>
		<th>목</th>
		<th>금</th>
	</tr>
	<tr>
		<td rowspan="2">10시~11시</td>
		<td>A</td>
		<c:forEach items="${courseList}" var="course">
			<c:if test="${course.ccode eq 'A1000'}">
				<td><c:out value="${course.cteacher}" /></td>
			</c:if>
		</c:forEach>
		<c:forEach items="${courseList}" var="course">
			<c:if test="${course.ccode eq 'A1000'}">
				<td style="background-color: #edf1d6;"><c:out
						value="${course.cname}" /></td>
				<td></td>
				<td style="background-color: #edf1d6;"><c:out
						value="${course.cname}" /></td>
				<td></td>
				<td style="background-color: #edf1d6;"><c:out
						value="${course.cname}" /></td>
			</c:if>
		</c:forEach>
	</tr>
	<tr>
		<td>B</td>
		<c:forEach items="${courseList}" var="course">
			<c:if test="${course.ccode eq 'B1000'}">
				<td><c:out value="${course.cteacher}" /></td>
			</c:if>
		</c:forEach>
		<c:forEach items="${courseList}" var="course">
			<c:if test="${course.ccode eq 'B1000'}">
				<td></td>
				<td style="background-color: #edf1d6;"><c:out
						value="${course.cname}" /></td>
				<td></td>
				<td style="background-color: #edf1d6;"><c:out
						value="${course.cname}" /></td>
				<td></td>
			</c:if>
		</c:forEach>
	</tr>
	<tr>
		<td rowspan="2">15시~16시</td>
		<td>A</td>
		<c:forEach items="${courseList}" var="course">
			<c:if test="${course.ccode eq 'A2000'}">
				<td><c:out value="${course.cteacher}" /></td>
			</c:if>
		</c:forEach>
		<c:forEach items="${courseList}" var="course">
			<c:if test="${course.ccode eq 'A2000'}">
				<td style="background-color: #edf1d6;"><c:out
						value="${course.cname}" /></td>
				<td></td>
				<td style="background-color: #edf1d6;"><c:out
						value="${course.cname}" /></td>
				<td></td>
				<td style="background-color: #edf1d6;"><c:out
						value="${course.cname}" /></td>
			</c:if>
		</c:forEach>
	</tr>
	<tr>
		<td>B</td>
		<c:forEach items="${courseList}" var="course">
			<c:if test="${course.ccode eq 'B2000'}">
				<td><c:out value="${course.cteacher}" /></td>
			</c:if>
		</c:forEach>
		<c:forEach items="${courseList}" var="course">
			<c:if test="${course.ccode eq 'B2000'}">
				<td></td>
				<td style="background-color: #edf1d6;"><c:out
						value="${course.cname}" /></td>
				<td></td>
				<td style="background-color: #edf1d6;"><c:out
						value="${course.cname}" /></td>
				<td></td>
			</c:if>
		</c:forEach>
	</tr>
	<tr>
		<td rowspan="2">20시~21시</td>
		<td>A</td>
		<c:forEach items="${courseList}" var="course">
			<c:if test="${course.ccode eq 'A3000'}">
				<td><c:out value="${course.cteacher}" /></td>
			</c:if>
		</c:forEach>
		<c:forEach items="${courseList}" var="course">
			<c:if test="${course.ccode eq 'A3000'}">
				<td style="background-color: #edf1d6;"><c:out
						value="${course.cname}" /></td>
				<td></td>
				<td style="background-color: #edf1d6;"><c:out
						value="${course.cname}" /></td>
				<td></td>
				<td style="background-color: #edf1d6;"><c:out
						value="${course.cname}" /></td>
			</c:if>
		</c:forEach>
	</tr>
	<tr>
		<td>B</td>
		<c:forEach items="${courseList}" var="course">
			<c:if test="${course.ccode eq 'B3000'}">
				<td><c:out value="${course.cteacher}" /></td>
			</c:if>
		</c:forEach>
		<c:forEach items="${courseList}" var="course">
			<c:if test="${course.ccode eq 'B3000'}">
				<td></td>
				<td style="background-color: #edf1d6;"><c:out
						value="${course.cname}" /></td>
				<td></td>
				<td style="background-color: #edf1d6;"><c:out
						value="${course.cname}" /></td>
				<td></td>
			</c:if>
		</c:forEach>
	</tr>
</table>

<h1>강의 소개</h1>
<hr class="divider-lg">
<div id="portfolio" style="margin-top: 50px">
	<div class="container-fluid p-0">
		<div class="row g-0">
			<div class="col-lg-4 col-sm-6">
				<a class="portfolio-box"
					href="../resources/assets/img/portfolio/fullsize/class1.JPG"
					title="[A스튜디오] 월수금 10~11시 김OO 아쉬탕가 초급반"> <img class="img-fluid"
					src="../resources/assets/img/portfolio/thumbnails/class1.JPG"
					alt="..." />
					<div class="portfolio-box-caption">
						<div class="project-category text-sig-brownD-50">Click me!</div>
						<div class="project-name">Class_Ashtanga A</div>
					</div>
				</a>
			</div>
			<div class="col-lg-4 col-sm-6">
				<a class="portfolio-box"
					href="../resources/assets/img/portfolio/fullsize/class3.JPG"
					title="[A스튜디오] 월수금 15~16시 김OO 아쉬탕가 중급반"> <img class="img-fluid"
					src="../resources/assets/img/portfolio/thumbnails/class3.JPG"
					alt="..." />
					<div class="portfolio-box-caption">
						<div class="project-category text-sig-brownD-50">Click me!</div>
						<div class="project-name">Class_Ashtanga B</div>
					</div>
				</a>
			</div>
			<div class="col-lg-4 col-sm-6">
				<a class="portfolio-box"
					href="../resources/assets/img/portfolio/fullsize/class5.JPG"
					title="[A스튜디오] 월수금 20~21시 이OO 빈야샤"> <img class="img-fluid"
					src="../resources/assets/img/portfolio/thumbnails/class5.JPG"
					alt="..." />
					<div class="portfolio-box-caption">
						<div class="project-category text-sig-brownD-50">Click me!</div>
						<div class="project-name">Class_Vinyasa</div>
					</div>
				</a>
			</div>
			<div class="col-lg-4 col-sm-6">
				<a class="portfolio-box"
					href="../resources/assets/img/portfolio/fullsize/class2.jpg"
					title="[B스튜디오] 화목 10~11시 이OO 아헹가"> <img class="img-fluid"
					src="../resources/assets/img/portfolio/thumbnails/class2.jpg"
					alt="..." />
					<div class="portfolio-box-caption">
						<div class="project-category text-sig-brownD-50">Click me!</div>
						<div class="project-name">Class_Iyengar</div>
					</div>
				</a>
			</div>
			<div class="col-lg-4 col-sm-6">
				<a class="portfolio-box"
					href="../resources/assets/img/portfolio/fullsize/class4.JPG"
					title="[B스튜디오] 화목 15~16시 박OO 비크람(핫요가)"> <img class="img-fluid"
					src="../resources/assets/img/portfolio/thumbnails/class4.JPG"
					alt="..." />
					<div class="portfolio-box-caption">
						<div class="project-category text-sig-brownD-50">Click me!</div>
						<div class="project-name">Class_Bikram</div>
					</div>
				</a>
			</div>
			<div class="col-lg-4 col-sm-6">
				<a class="portfolio-box"
					href="../resources/assets/img/portfolio/fullsize/class6.jpg"
					title="[B스튜디오] 화목 20~21시 박OO 플라잉요가"> <img class="img-fluid"
					src="../resources/assets/img/portfolio/thumbnails/class6.jpg"
					alt="..." />
					<div class="portfolio-box-caption p-3">
						<div class="project-category text-sig-brownD-50">Click me!</div>
						<div class="project-name">Class_Anti grabity</div>
					</div>
				</a>
			</div>
		</div>
	</div>
</div>

<h1>오시는 길</h1>
<hr class="divider-md">
<div class='avia_codeblock' itemprop="text">
	<div class="contactFlex">
		<div class="contactMap">
			<div style="width: 650px; height: 350px;" id="map"></div>
		</div>
		<div class="contactMap">
			<div class="mapContainer">
				<ul>
					<li>주소 : 청주시 상당구 사직대로 361번길 158-10, YOGA</li>
					<li>전화 : 043-259-2800</li>
					<li>팩스 : 043-259-2900</li>
				</ul>
				<hr />
				<p>
					<strong>주변 정류장 :</strong><br /> <em>방아다리 도보 4분</em><br />
				</p>
				<hr />
				<p>
					<strong>주변 버스:</strong><br /> 008, 011, 012, 018, 019, 40-2, 111,
					112, 113, 115, 115-1, 117, 211, 211-1, 211-2, 212, 212-1, 212-2,
					212-3, 213, 214, 215, 216, 216-1, 218, 412, 413, 414, 415, 416,
					416-1, 417, 417-1, 417-2, 418, 419, 511, 512, 512-1, 512-2, 512-3,
					513-2, 516, 517, 711, 712, 712-1, 713, 713-1, 715, 715-1, 716, 718,
					719, 720, 720-1, 721, 722, 722-1, 832, 841, 841-1, 843, 871, 872,
					913, 914, 915, 916-2, 918-1, 920, 921, 921-1, 922<br />
				</p>
			</div>
		</div>
	</div>
</div>

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
