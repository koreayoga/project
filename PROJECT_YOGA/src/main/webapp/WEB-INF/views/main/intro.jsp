<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
    <head>
	<%@include file="../includes/header.jsp"%>
	<title>INTRO</title>
<link href="../resources/css/styles.css" rel="stylesheet" />
</head>
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
	margin:0 auto;
	margin-top: 50px;
}

h1{
	margin-top: 150px;
}

th, td {
	width: 100px;
}

div.test{
	width: 500px;
	height: 200px;
	text-align: center;
	margin: 200px auto;
	margin-bottom: 0;
	font-family: "Merriweather Sans", -apple-system, BlinkMacSystemFont, "Segoe UI", Roboto, "Helvetica Neue", Arial, "Noto Sans", sans-serif, "Apple Color Emoji", "Segoe UI Emoji", "Segoe UI Symbol", "Noto Color Emoji";
}
</style>
<body>
		<h1>시간표</h1>
		<table>
			<tr>
				<th>시간</th>
				<th>강의실</th>
				<th>강사</th>
				<th>월</th>
				<th>화</th>
				<th>수</th>
				<th>목</th>
				<th>금</th>
			<tr>
			<tr>
				<td rowspan="2">10시~11시</td>
				<td>A</td>
				<td>김**</td>
				<td style="background-color: #f4623a; color: rgb(255, 255, 255);">월</td>
				<td>화</td>
				<td style="background-color: #f4623a; color: rgb(255, 255, 255);">수</td>
				<td>목</td>
				<td style="background-color: #f4623a; color: rgb(255, 255, 255);">금</td>
			</tr>
			<tr>
				<td>B</td>
				<td>이**</td>
				<td>월</td>
				<td style="background-color: #f4623a; color: rgb(255, 255, 255);">화</td>
				<td>수</td>
				<td style="background-color: #f4623a; color: rgb(255, 255, 255);">목</td>
				<td>금</td>
			</tr>
			<tr>
				<td rowspan="2">15시~16시</td>
				<td>A</td>
				<td>김**</td>
				<td style="background-color: #f4623a; color: rgb(255, 255, 255);">월</td>
				<td>화</td>
				<td style="background-color: #f4623a; color: rgb(255, 255, 255);">수</td>
				<td>목</td>
				<td style="background-color: #f4623a; color: rgb(255, 255, 255);">금</td>
			</tr>
			<tr>
				<td>B</td>
				<td>박**</td>
				<td>월</td>
				<td style="background-color: #f4623a; color: rgb(255, 255, 255);">화</td>
				<td>수</td>
				<td style="background-color: #f4623a; color: rgb(255, 255, 255);">목</td>
				<td>금</td>
			</tr>
			<tr>
				<td rowspan="2">20시~21시</td>
				<td>A</td>
				<td>이**</td>
				<td style="background-color: #f4623a; color: rgb(255, 255, 255);">월</td>
				<td>화</td>
				<td style="background-color: #f4623a; color: rgb(255, 255, 255);">수</td>
				<td>목</td>
				<td style="background-color: #f4623a; color: rgb(255, 255, 255);">금</td>
			</tr>
			<tr>
				<td>B</td>
				<td>박**</td>
				<td>월</td>
				<td style="background-color: #f4623a; color: rgb(255, 255, 255);">화</td>
				<td>수</td>
				<td style="background-color: #f4623a; color: rgb(255, 255, 255);">목</td>
				<td>금</td>
			</tr>
		</table>
		
		<h1>강사/클래스 소개</h1>
		       <!-- Portfolio-->
        <div id="portfolio" style="margin-bottom:30px;">
            <div class="container-fluid p-0">
                <div class="row g-0">
                    <div class="col-lg-4 col-sm-6">
                        <a class="portfolio-box" href="../resources/assets/img/portfolio/fullsize/1.jpg" title="Project Name">
                            <img class="img-fluid" src="../resources/assets/img/portfolio/thumbnails/1.jpg" alt="..." />
                            <div class="portfolio-box-caption">
                                <div class="project-category text-white-50">Category</div>
                                <div class="project-name">Project Name</div>
                            </div>
                        </a>
                    </div>
                    <div class="col-lg-4 col-sm-6">
                        <a class="portfolio-box" href="../resources/assets/img/portfolio/fullsize/2.jpg" title="Project Name">
                            <img class="img-fluid" src="../resources/assets/img/portfolio/thumbnails/2.jpg" alt="..." />
                            <div class="portfolio-box-caption">
                                <div class="project-category text-white-50">Category</div>
                                <div class="project-name">Project Name</div>
                            </div>
                        </a>
                    </div>
                    <div class="col-lg-4 col-sm-6">
                        <a class="portfolio-box" href="../resources/assets/img/portfolio/fullsize/3.jpg" title="Project Name">
                            <img class="img-fluid" src="../resources/assets/img/portfolio/thumbnails/3.jpg" alt="..." />
                            <div class="portfolio-box-caption">
                                <div class="project-category text-white-50">Category</div>
                                <div class="project-name">Project Name</div>
                            </div>
                        </a>
                    </div>
                    <div class="col-lg-4 col-sm-6">
                        <a class="portfolio-box" href="../resources/assets/img/portfolio/fullsize/4.jpg" title="Project Name">
                            <img class="img-fluid" src="../resources/assets/img/portfolio/thumbnails/4.jpg" alt="..." />
                            <div class="portfolio-box-caption">
                                <div class="project-category text-white-50">Category</div>
                                <div class="project-name">Project Name</div>
                            </div>
                        </a>
                    </div>
                    <div class="col-lg-4 col-sm-6">
                        <a class="portfolio-box" href="../resources/assets/img/portfolio/fullsize/5.jpg" title="Project Name">
                            <img class="img-fluid" src="../resources/assets/img/portfolio/thumbnails/5.jpg" alt="..." />
                            <div class="portfolio-box-caption">
                                <div class="project-category text-white-50">Category</div>
                                <div class="project-name">Project Name</div>
                            </div>
                        </a>
                    </div>
                    <div class="col-lg-4 col-sm-6">
                        <a class="portfolio-box" href="../resources/assets/img/portfolio/fullsize/6.jpg" title="Project Name">
                            <img class="img-fluid" src="../resources/assets/img/portfolio/thumbnails/6.jpg" alt="..." />
                            <div class="portfolio-box-caption p-3">
                                <div class="project-category text-white-50">Category</div>
                                <div class="project-name">Project Name</div>
                            </div>
                        </a>
                    </div>
                </div>
            </div>
        </div>
	<%@include file="../includes/footer.jsp"%>		