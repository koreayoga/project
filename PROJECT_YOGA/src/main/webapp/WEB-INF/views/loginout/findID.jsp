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
	<title>아이디 찾기</title>    	
</head>
<body>
<div class="search">
		<div>
		<h3>Find ID</h3>		
		</div>
			<!-- 이름과 전화번호가 일치하지 않을 때-->
			<c:if test="${check == 1}">
				<script>
					opener.document.find.name.value = "";
					opener.document.find.email.value = "";
				</script>
				<label>일치하는 정보가 존재하지 않습니다.</label>
			</c:if>
	
			<!-- 이름과 비밀번호가 일치하지 않을 때 -->
			<c:if test="${check == 0 }">
				<label>찾으시는 아이디는' ${id}'입니다.</label>
				<div>
					<input class="btn btn-lg btn-secondary btn-block text-uppercase" type="button" value="OK" onclick="close()">
				</div>
			</c:if>			
		</div>
		<script type="text/javascript">
			function close(){
				self.close();
			}
		</script>
	</body>
</html>

