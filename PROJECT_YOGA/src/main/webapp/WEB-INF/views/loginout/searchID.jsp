<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<% request.setCharacterEncoding("utf-8"); %> 
<!DOCTYPE html>
<html>
<head>
	<meta charset="utf-8" />
	<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />
	<meta name="description" content="" />
	<meta name="author" content="" />
	<!-- Favicon-->
	<link rel="icon" type="image/x-icon" href="../resources/assets/favicon.ico" />
	<!-- Bootstrap Icons-->
	<link href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.5.0/font/bootstrap-icons.css" rel="stylesheet" />
	<!-- Google fonts-->
	<link href="https://fonts.googleapis.com/css?family=Merriweather+Sans:400,700" rel="stylesheet" />
	<link href="https://fonts.googleapis.com/css?family=Merriweather:400,300,300italic,400italic,700,700italic" rel="stylesheet" type="text/css" />
	<!-- SimpleLightbox plugin CSS-->
	<link href="https://cdnjs.cloudflare.com/ajax/libs/SimpleLightbox/2.1.0/simpleLightbox.min.css" rel="stylesheet" />
	<!-- Core theme CSS -->
	<link href="../resources/css/styles.css" rel="stylesheet" />
	<link href="../resources/css/pageStyle.css" type="text/css" rel="stylesheet" />
	<link href="../resources/css/navstyletest.css" type="text/css" rel="stylesheet" />
	<!-- header / footer js-->
	<script src="../resources/js/scripts.js"></script>
	<!-- jQuery -->
	<script src="/resources/vendor/jquery/jquery.min.js"></script>
	<title>아이디찾기</title>    	
</head>
<body>
<div class="search">
		<div>
		<h3>Search ID</h3>		
		</div>		
			<form role="form" method="post" action="/loginout/searchID2" name="find">				
				<!-- 필요 정보입력 -->
				<div>   				
					<input class="searchInput" id="name" name="name" placeholder="이름을 적어주세요" required autofocus>	<p/>
					<input class="searchInput" type="email" id="email" name="email" placeholder="이메일주소를 입력해주세요" required>
				</div>
				<!--아이디찾기버튼 -->
				<div>
					<input type="submit" class="btn btn-third btn-m" value="Search">
					<!-- 비밀번호 암호화 -->
					<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}">
				</div>
			</form>
		</div>		
	</body>
</html>

