<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
    <head>
	<%@include file="../include/nav.jsp"%>
	<title>CONTECT</title>
</head>
<body>
	<section style="margin-top: 200px;margin-left: 50px;"
		class="avia_codeblock_section  av-small-hide av-mini-hide avia_code_block_0"
		itemscope="itemscope" itemtype="https://schema.org/CreativeWork">
		<div class='avia_codeblock ' itemprop="text">
		<!-- * 카카오맵 - 약도서비스
			 * 한 페이지 내에 약도를 2개 이상 넣을 경우에는
			 * 약도의 수 만큼 소스를 새로 생성, 삽입해야 합니다.-->
			 
			<!-- 1. 약도 노드 -->
			<div id="daumRoughmapContainer1630559081873"
				class="root_daum_roughmap root_daum_roughmap_landing"></div>

			<!-- 2. 설치 스크립트 -->
			<script charset="UTF-8" class="daum_roughmap_loader_script"
				src="https://ssl.daumcdn.net/dmaps/map_js_init/roughmapLoader.js"></script>

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
	<%@include file="../include/footer.jsp"%>		
