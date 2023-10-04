<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta name="description" content="">
<meta name="author" content="">
<title>Login Page</title>
</head>
<body>
	<div class="container">
		<h3 class="panel-title">Please Sign In</h3>
		<form role="form" action="/login" method="post">
			<input class="form-control" type="text" name="username" placeholder="ID를 입력해주세요" autofocus><p/>				
			<input	class="form-control" type="password" name="password" placeholder="비밀번호를 입력해주세요" value=""> 
			<input type="checkbox" name="remember-me">기억!! 
			<a href="/" class="btn-1">Login</a> 
			<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}">
		</form>
	</div>
	
	<!-- jQuery -->
	<script src="/resources/vendor/jquery/jquery.min.js"></script>

	<!-- login버튼 기능구현 -->
	<script type="text/javascript">
		$(".btn-1").on("click", function(e) {
			e.preventDefault();
			$("form").submit();
		});
	</script>

	<!-- logout성공 기능구현 -->
	<c:if test="${param.logout != null}">
		<script>
			$(document).ready(function() {
				alert("로그아웃하였습니다.");
			});
		</script>
	</c:if>

</body>
</html>