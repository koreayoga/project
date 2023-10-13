<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="sec"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
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
	<title>회원탈퇴</title>    	
</head>
<body>
<div class="search">
		<div>
		<h3>REMOVE ACCOUNT</h3>		
		</div>		
			<form role="form" action="/member/delete" method="post" id="delete">				
				<!-- 로그인 정보입력 -->
				<div>
					<input class="searchInput" type="password" id="userpw" name="userpw" placeholder="비밀번호를 적어주세요" autofocus>	<p/>
				</div>
				<!-- 로그인 버튼 생성 -->
				<div>
					<button href="javascript:void(0)" onclick="fnSubmit(); return false;" class="btn btn-third btn-xl2">탈퇴하기</button>
					<!-- 비밀번호 암호화 -->
					<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}">
				</div>								
			</form>
		</div>
		<script>
			$(document).ready(function() {
				var msg = "${msg}";
				if(msg != ""){
					alert(msg);    
				}
				
				var result = '<c:out value="${result}"/>';
				checkAlert(result);
		
				function checkAlert(result) {
					if (result === '' || history.state) {
						return;
					}
					if (result === 'success') {
						alert("탈퇴가 정상적으로 처리되었습니다.");
					} else {
						alert("탈퇴처리에 실패하였습니다.<br>다시 시도해주십시오.");
					}
				}
			});
			
			function fnSubmit() { 
				if ($("#userpw").val() == null || $("#userpw").val() == "") {
					alert("회원님의 비밀번호를 입력해주세요.");
					$("#userpw").focus(); 
					return false;
				} 
			 
				if (confirm("탈퇴하시겠습니까?")) {			 
					$("#delete").submit();				 
					return false;
				}
			}		 
		</script>
	</body>
</html>