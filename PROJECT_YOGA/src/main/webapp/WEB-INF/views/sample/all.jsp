<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="sc"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
<head>
<meta charset="UTF-8">
<title>All</title>
</head>
<body>
<a href="/sample/member">member page▶</a> 
&nbsp;&nbsp;&nbsp;
<a href="/sample/admin">admin page▶▶</a><p/>
<h1>/sample/all page</h1>

<sc:authorize access="isAnonymous()">
	<a href="/customLogin">로그인</a>
</sc:authorize>

<sc:authorize access="isAuthenticated()">

	<p>principal : <sc:authentication property="principal"/></p>
	<p>MemberVO : <sc:authentication property="principal.member"/></p>
	<p>사용자 이름 : <sc:authentication property="principal.member.userName"/></p>
	<p>사용자 아이디 : <sc:authentication property="principal.member.userid"/></p>
	<p>사용자 권한리스트 : <sc:authentication property="principal.member.authList"/></p>

	<a href="/customLogout">로그아웃</a>
</sc:authorize>

</body>
</html>