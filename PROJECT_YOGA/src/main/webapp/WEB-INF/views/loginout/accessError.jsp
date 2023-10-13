<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="sec"%>
<%@page import="java.util.*" %>
<!-- <!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd"> -->
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Error</title>
</head>
<body>
	<div style="align-content: center; align-items: center">
		<div>
			<h1>ACCESS DENIED ERROR PAGE</h1>
			<h2><c:out value="${SPRING_SECURITY_403_EXCEPTION.getMessage()}"/></h2>
			<h2><c:out value="${msg}"/></h2>
			<button class="btn btn-third btn-xl2" onclick="history.go(-1)">뒤로가기</button>
		</div>
	</div>
</body>
</html>