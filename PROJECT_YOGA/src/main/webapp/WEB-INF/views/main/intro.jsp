<%@include file="../includes/header.jsp"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
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
</head>

	<h1>시간표</h1>
	<hr class="divider-sh">
	<table>
		<tr>
			<th>시간</th>	<th>강의실</th><th>강사</th><th>월</th>	<th>화</th><th>수</th><th>목</th>	<th>금</th>
		<tr>
		<tr>
			<td rowspan="2">10시~11시</td><td>A</td><td>김**</td>	<td style="background-color: #edf1d6 ;"></td><td></td><td style="background-color: #edf1d6 ;"></td><td></td><td style="background-color: #edf1d6 ;"></td>
		</tr>
		<tr>
			<td>B</td><td>이**</td><td></td>	<td style="background-color: #edf1d6 ;"></td><td></td><td style="background-color: #edf1d6 ; color: rgb(255, 255, 255);"></td><td></td>
		</tr>
		<tr>
			<td rowspan="2">15시~16시</td><td>A</td><td>김**</td>	<td style="background-color: #edf1d6 ;"></td><td></td><td style="background-color: #edf1d6 ;"></td><td></td><td style="background-color: #edf1d6 ;"></td>
		</tr>
		<tr>
			<td>B</td><td>박**</td><td></td>	<td style="background-color: #edf1d6 ;"></td><td></td><td style="background-color: #edf1d6 ; color: rgb(255, 255, 255);"></td><td></td>
		</tr>
		<tr>
			<td rowspan="2">20시~21시</td><td>A</td><td>이**</td>	<td style="background-color: #edf1d6 ;"></td><td></td><td style="background-color: #edf1d6 ;"></td><td></td><td style="background-color: #edf1d6 ;"></td>
		</tr>
		<tr>
			<td>B</td><td>박**</td><td></td>	<td style="background-color: #edf1d6 ;"></td><td></td><td style="background-color: #edf1d6 ; color: rgb(255, 255, 255);"></td><td></td>
		</tr>			
	</table>
	
	<h1>강사/클래스 소개</h1>
	<hr class="divider-lg">		
       <div id="portfolio">
           <div class="container-fluid p-0">
               <div class="row g-0">
                   <div class="col-lg-4 col-sm-6">
                       <a class="portfolio-box" href="../resources/assets/img/portfolio/fullsize/yoga7.jpg" title="Project Name">
                           <img class="img-fluid" src="../resources/assets/img/portfolio/thumbnails/yoga7.jpg" alt="..." />
                           <div class="portfolio-box-caption">
                               <div class="project-category text-sig-brownD-50">Click me!</div>
                               <div class="project-name">Class A</div>
                           </div>
                       </a>
                   </div>
                   <div class="col-lg-4 col-sm-6">
                       <a class="portfolio-box" href="../resources/assets/img/portfolio/fullsize/yoga1.jpg" title="Project Name">
                           <img class="img-fluid" src="../resources/assets/img/portfolio/thumbnails/yoga1.jpg" alt="..." />
                           <div class="portfolio-box-caption">
                               <div class="project-category text-sig-brownD-50">Click me!</div>
                               <div class="project-name">Class A</div>
                           </div>
                       </a>
                   </div>
                   <div class="col-lg-4 col-sm-6">
                       <a class="portfolio-box" href="../resources/assets/img/portfolio/fullsize/yoga2.jpg" title="Project Name">
                           <img class="img-fluid" src="../resources/assets/img/portfolio/thumbnails/yoga2.jpg" alt="..." />
                           <div class="portfolio-box-caption">
                               <div class="project-category text-sig-brownD-50">Click me!</div>
                               <div class="project-name">Class A</div>
                           </div>
                       </a>
                   </div>
                   <div class="col-lg-4 col-sm-6">
                       <a class="portfolio-box" href="../resources/assets/img/portfolio/fullsize/yoga3.jpg" title="Project Name">
                           <img class="img-fluid" src="../resources/assets/img/portfolio/thumbnails/yoga3.jpg" alt="..." />
                           <div class="portfolio-box-caption">
                               <div class="project-category text-sig-brownD-50">Click me!</div>
                               <div class="project-name">Class B</div>
                           </div>
                       </a>
                   </div>
                   <div class="col-lg-4 col-sm-6">
                       <a class="portfolio-box" href="../resources/assets/img/portfolio/fullsize/yoga5.jpg" title="Project Name">
                           <img class="img-fluid" src="../resources/assets/img/portfolio/thumbnails/yoga5.jpg" alt="..." />
                           <div class="portfolio-box-caption">
                               <div class="project-category text-sig-brownD-50">Click me!</div>
                               <div class="project-name">Class B</div>
                           </div>
                       </a>
                   </div>
                   <div class="col-lg-4 col-sm-6">
                       <a class="portfolio-box" href="../resources/assets/img/portfolio/fullsize/yoga6.jpg" title="Project Name">
                           <img class="img-fluid" src="../resources/assets/img/portfolio/thumbnails/yoga6.jpg" alt="..." />
                           <div class="portfolio-box-caption p-3">
                               <div class="project-category text-sig-brownD-50">Click me!</div>
                               <div class="project-name">Class B</div>
                           </div>
                       </a>
                   </div>
               </div>
           </div>
       </div>
       
       <h1>오시는 길</h1>
       <hr class="divider-md">
       <section style="margin-top: 40px; margin-left: 25%" 
			 class="avia_codeblock_section  av-small-hide av-mini-hide avia_code_block_0"
			 itemscope="itemscope" itemtype="https://schema.org/CreativeWork">
		<div class='avia_codeblock' itemprop="text"">        			
		<!-- * 카카오맵 - 약도서비스
			 * 한 페이지 내에 약도를 2개 이상 넣을 경우에는
			 * 약도의 수 만큼 소스를 새로 생성, 삽입해야 합니다.-->
			 
			<!-- 1. 약도 노드 -->
			<div id="daumRoughmapContainer1630559081873" class="root_daum_roughmap root_daum_roughmap_landing"></div>

			<!-- 2. 설치 스크립트 -->
			<script charset="UTF-8" class="daum_roughmap_loader_script"	src="https://ssl.daumcdn.net/dmaps/map_js_init/roughmapLoader.js"></script>

			<!-- 3. 실행 스크립트 -->
			<script charset="UTF-8">
				new daum.roughmap.Lander({
					"timestamp" : "1630559081873",
					"key" : "27873",
					"mapWidth" : "640",
					"mapHeight" : "360"
				}).render();
			</script>
		</div>
	</section>			
<%@include file="../includes/footer.jsp"%>		