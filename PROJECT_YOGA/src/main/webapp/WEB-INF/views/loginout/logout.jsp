<%@page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
	<head>
	    <meta charset="utf-8">
	    <meta http-equiv="X-UA-Compatible" content="IE=edge">
	    <meta name="viewport" content="width=device-width, initial-scale=1">
	    <meta name="description" content="">
	    <meta name="author" content="">
	    <link href="../resources/css/info.css" rel="stylesheet" />
		<link href="../resources/css/styles.css" rel="stylesheet" />
		<link rel="preconnect" href="https://fonts.googleapis.com">
		<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
		<link href="https://fonts.googleapis.com/css2?family=Gaegu:wght@300;400&family=Jua&family=Orbit&display=swap" rel="stylesheet">
		<title>Logout Page</title>
		<style type="text/css">
			div.logout {
				position : absolute;
				top : 20%;
				width: 100%;
				text-align: center;
				align-content: 50%;
				align-items: 50%;			
			}
			
			.logout h1 {
				font-family:'Orbit', sans-serif;			
				text-align: center;
				font-size: 3rem;	
				margin-bottom: 50px;			
			}	
		</style>
	</head>
	<body>
		<div class="logout">				
			<h1>로그아웃하시겠습니까?</h1>				
			<div>
				<form role="form" action="/loginout/logout" method="post">
					<fieldset>
						<a href="/main/home" class="btn btn-third btn-xl2">Logout</a>
					</fieldset>
					<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}">
				</form>
			</div>		
		</div>

	 	<!-- jQuery -->
	    <script src="/resources/vendor/jquery/jquery.min.js"></script>

	    <!-- logout버튼 기능구현 -->
	    <script>
	    	$(".btn-xl2").on("click", function(e){ 
				e.preventDefault();
				$("form").submit();			
			});
	    </script>	    
	</body>
</html>



