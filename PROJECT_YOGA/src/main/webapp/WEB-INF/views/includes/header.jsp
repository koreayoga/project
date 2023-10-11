<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="sec"%>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="utf-8" />
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
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
        <!-- Core theme CSS (includes Bootstrap)-->
        <link href="../resources/css/styles.css" rel="stylesheet" />
        <link href="../resources/css/pageStyle.css" rel="stylesheet" />
        <link href="../resources/css/footerstyles.css" rel="stylesheet" />
        <link href="../resources/css/navstyletest.css" rel="stylesheet" />
    	 
    	<!-- Bootstrap Core CSS (BookCSS CORE/Menu/DB/DB-response/Custom CSS/Custom Font -->
		<!-- <link href="/resources/vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">
		<link href="/resources/vendor/metisMenu/metisMenu.min.css" rel="stylesheet">
		<link href="/resources/vendor/datatables-plugins/dataTables.bootstrap.css" rel="stylesheet">
		<link href="/resources/vendor/datatables-responsive/dataTables.responsive.css" rel="stylesheet">
		<link href="/resources/dist/css/sb-admin-2.css" rel="stylesheet">
		<link href="/resources/vendor/font-awesome/css/font-awesome.min.css" rel="stylesheet" type="text/css"> -->
				
    </head>
    <body id="page-top">       
      <!-- 비회원/미로그인상태 Navigation-->
      <sec:authorize access="isAnonymous()">
        <nav class="navbar navbar-expand-lg navbar-light fixed-top py-3" id="Nav">
            <div class="container px-4 px-lg-5">
                <a class="navbar-brand" href="/main/home">YOGA</a>
                <button class="navbar-toggler navbar-toggler-right" type="button" data-bs-toggle="collapse" data-bs-target="#navbarResponsive" aria-controls="navbarResponsive" aria-expanded="false" aria-label="Toggle navigation"><span class="navbar-toggler-icon"></span></button>
                <div class="collapse navbar-collapse" id="navbarResponsive">
                    <ul class="navbar-nav ms-auto my-2 my-lg-0">                    	
                    	<li class="nav-item"><a class="nav-link" href="/loginout/login">LOGIN</a></li>
                       	<li class="nav-item"><a class="nav-link" href="/member/insert">MEMBER</a></li>
                       	<li class="nav-item"><a class="nav-link" href="/main/intro">INTRO</a></li>
                        <li class="nav-item"><a class="nav-link" href="/board/list">BOARD</a></li>
                        <li class="nav-item"><a class="nav-link" href="/Lesson/lesson">LESSON</a></li>                    
                    </ul>
                </div>
            </div>
        </nav>  
      </sec:authorize>
      <!-- 회원 Navigation-->
      <sec:authorize access="isAuthenticated() and principal.username!='admin'" >
        <nav class="navbar navbar-expand-lg navbar-light fixed-top py-3" id="Nav">
            <div class="container px-4 px-lg-5">
                <a class="navbar-brand" href="/main/home">YOGA</a>
                <button class="navbar-toggler navbar-toggler-right" type="button" data-bs-toggle="collapse" data-bs-target="#navbarResponsive" aria-controls="navbarResponsive" aria-expanded="false" aria-label="Toggle navigation"><span class="navbar-toggler-icon"></span></button>
                <div class="collapse navbar-collapse" id="navbarResponsive">
                    <ul class="navbar-nav ms-auto my-2 my-lg-0">
                       	<li class="nav-item"><a class="nav-link" href="/loginout/logout">LOGOUT</a></li>
                       	<!-- 아직 마이페이지 경로가 없기때문에 임시로 insert로 매핑 -->
                       	<li class="nav-item"><a class="nav-link" href="/member/mypage">MYPAGE</a></li>                
                        <li class="nav-item"><a class="nav-link" href="/main/intro">INTRO</a></li>
                        <li class="nav-item"><a class="nav-link" href="/board/list">BOARD</a></li>
                        <li class="nav-item"><a class="nav-link" href="/Lesson/lesson">LESSON</a></li>                    
                    </ul>
                </div>
            </div>
        </nav>  
      </sec:authorize>
      <!-- 회원등급 : 관리자 Navigation-->
      <sec:authorize access="isAuthenticated() and principal.username=='admin'" >      	 
        <nav class="navbar navbar-expand-lg navbar-light fixed-top py-3" id="Nav">
            <div class="container px-4 px-lg-5">
                <a class="navbar-brand" href="/main/home">YOGA</a>
                <button class="navbar-toggler navbar-toggler-right" type="button" data-bs-toggle="collapse" data-bs-target="#navbarResponsive" aria-controls="navbarResponsive" aria-expanded="false" aria-label="Toggle navigation"><span class="navbar-toggler-icon"></span></button>
                <div class="collapse navbar-collapse" id="navbarResponsive">
                    <ul class="navbar-nav ms-auto my-2 my-lg-0">                    	                    	
                       	<li class="nav-item"><a class="nav-link" href="/loginout/logout">LOGOUT</a></li>
                       	<!-- 임시 : memberlist >> admin.list로 바꿔야함 -->
                        <li class="nav-item"><a class="nav-link" href="/member/list">ADMIN</a></li>
                        <li class="nav-item"><a class="nav-link" href="/main/intro">INTRO</a></li>
                        <li class="nav-item"><a class="nav-link" href="/board/list">BOARD</a></li>
                        <li class="nav-item"><a class="nav-link" href="/Lesson/lesson">LESSON</a></li>                    
                    </ul>
                </div>
            </div>
        </nav>  
      </sec:authorize>
      
      <!-- <div id="page-wrapper"> -->
	  <script src="https://code.jquery.com/jquery-3.7.0.min.js" integrity="sha256-2Pmvv0kuTBOenSvLm6bvfBSSHrUJ+3A7x6P5Ebd07/g=" crossorigin="anonymous"></script> 