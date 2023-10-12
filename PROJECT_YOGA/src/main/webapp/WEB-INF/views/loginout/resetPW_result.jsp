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
		<title>비밀번호 재설정</title>    	
	</head>
	<body>
		<div class="search">
			<div><h3>Reset PW</h3></div>		
			<c:choose>                                                                          
	            <c:when test="${0 == cnt}">              	                                              
	                <h2>조회결과가 없습니다.</h2>
	                <br><br>
	                <!-- <input type="submit" class="btn btn-third btn-m" value="Search"> -->
					<button onclick="history.go(-1)" class="btn btn-third btn-m">Back</button>
					<!-- 비밀번호 암호화 -->
					<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}">				                                        
	            </c:when>
	            <c:otherwise> 					     		
					<p>임시비밀번호가 발급되었습니다.</p>
					<p>반드시 마이페이지에서 비밀번호를 변경해주시기 바랍니다.</p>    
					<br><br>
					<p class="mb-4">임시비밀번호는 <b>${newPwd}</b> 입니다.</p>
					<button onclick="history.go(-1)" class="btn btn-third btn-m">Back</button>
					<button onclick="window.close()" class="btn btn-third btn-m">Close</button>
					<!-- 비밀번호 암호화 -->
					<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}">    
				</c:otherwise>
			</c:choose>
		</div>			
	</body>
</html>

