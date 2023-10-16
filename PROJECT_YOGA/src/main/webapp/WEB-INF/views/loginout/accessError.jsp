<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="sec"%>
<%@page import="java.util.*" %>
<!-- <!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd"> -->
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<link href="../resources/css/info.css" rel="stylesheet" />
	<link href="../resources/css/styles.css" rel="stylesheet" />
	<link rel="preconnect" href="https://fonts.googleapis.com">
	<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
	<link href="https://fonts.googleapis.com/css2?family=Gaegu:wght@300;400&family=Jua&family=Orbit&display=swap" rel="stylesheet">
	<style type="text/css">
		div.error {
			position : absolute;
			top : 20%;
			width: 100%;
			align-content: 50%;
			align-items: 50%;			
		}
		
		.error table, td {
			text-align: center;
			font-family:'Orbit', sans-serif;			
			font-size: 3rem;
			width : 100%					
		}		
	</style>
	<title>Error</title>
</head>
<body>
	<div class="error">
		<table>
			<tr>
				<td>
					<div style="padding-bottom:80px;"><b>ACCESS DENIED ERROR PAGE</b></div>
					<c:out value="${SPRING_SECURITY_403_EXCEPTION.getMessage()}"/>
					현재페이지에 <c:out value="${msg}"/>	<br>					 
					
					<div style="margin-top:20px; font-size: 1rem">*게시글 작성은 '강사'등급 이상부터 가능합니다.</div>
				</td>
			</tr>				
			<tr>
				<td style="padding-top: 50px;"><button class="btn btn-third btn-xl2" onclick="history.go(-1)">뒤로가기</button></td>
			</tr>
		</table>
	</div>
</body>
</html>
