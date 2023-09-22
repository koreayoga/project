<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="description" content="">
    <meta name="author" content="">
	<title>Login Page</title>
	<!-- Bootstrap Core CSS -->
    <link href="/resources/vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">
    <!-- MetisMenu CSS -->
    <link href="/resources/vendor/metisMenu/metisMenu.min.css" rel="stylesheet">
    <!-- Custom CSS -->
    <link href="/resources/dist/css/sb-admin-2.css" rel="stylesheet">
    <!-- Custom Fonts -->
    <link href="/resources/vendor/font-awesome/css/font-awesome.min.css" rel="stylesheet" type="text/css">
</head>
<body>	
	<div class="container">
        <div class="row">
            <div class="col-md-4 col-md-offset-4">
                <div class="login-panel panel panel-default">
                    <div class="panel-heading">
                        <h3 class="panel-title">Please Sign In</h3>
                    </div>
                    <div class="panel-body">
						<form role="form" action="/login" method="post">
							<fieldset>
								<div class="form-group">
									ID : <input class="form-control" type="text" name="username" placeholder="ID를 입력해주세요" autofocus> 
								</div>
								<div class="form-group">
									PW : <input class="form-control" type="password" name="password" placeholder="비밀번호를 입력해주세요" value="">
								</div>
								<div class="checkbox">
									<label>
										<input type="checkbox" name="remember-me" >기억!!
									</label>
								</div>
								<!-- 기존의 기본 로그인버튼(submit) -->
								<!-- <div>
									<input type="submit">
								</div> -->
								<!-- javascript로 기능을 하는 버튼 생성 -->
								<a href="index.html" class="btn btn-lg btn-success btn-block">Login</a>
							</fieldset>
							<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}">
                        </form>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <div align="center">
	<h2><c:out value="${error}"/></h2>
	<h2><c:out value="${logout}"/></h2>
	</div>
	 <!-- jQuery -->
    <script src="/resources/vendor/jquery/jquery.min.js"></script>

    <!-- Bootstrap Core JavaScript -->
    <script src="/resources/vendor/bootstrap/js/bootstrap.min.js"></script>

    <!-- Metis Menu Plugin JavaScript -->
    <script src="/resources/vendor/metisMenu/metisMenu.min.js"></script>

    <!-- Custom Theme JavaScript -->
    <script src="/resources/dist/js/sb-admin-2.js"></script>
    
    <!-- login버튼 기능구현 -->
    <script type="text/javascript">
    	$(".btn-success").on("click", function(e){ 
			e.preventDefault();
			$("form").submit();
		});
    </script>
    
     
    
    <!-- logout성공 기능구현 -->
    <c:if test="${param.logout != null}">
    	<script>
    		$(document).ready(function(){
    			alert("로그아웃하였습니다.");
    		});
    	</script>
    </c:if>
 
</body>
</html>