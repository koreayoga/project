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
			<div><h3>Search ID</h3></div>			
				<c:choose>                                                                          
	            <c:when test="${empty vo}">                                                 
	                <h2>조회결과가 없습니다.</h2>
	                <br><br>                
					<button onclick="history.go(-1)" class="btn btn-third btn-m">Back</button>				
					<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}">                                        
	            </c:when>                                                                         
	            <c:otherwise>                                                                     
	                <div><h4>회원님의 아이디는</h4></div> 
	                <div style="margin-top:10px"><b style="font-size: 30px;">${vo.userid}</b><h4>입니다.</h4></div>                                              
	            	<br>				
	            	<button onclick="history.go(-1)" class="btn btn-third btn-m">Back</button>
					<button onclick="window.close()" class="btn btn-third btn-m">Close</button>				
					<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}">
	            </c:otherwise> 
	            </c:choose>
	            <div>
			</div>  
		</div>		
	</body>
</html>

