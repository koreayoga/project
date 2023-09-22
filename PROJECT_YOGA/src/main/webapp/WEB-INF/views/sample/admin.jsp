<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@taglib uri="http://www.springframework.org/security/tags" prefix="sc" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Admin</title>
</head>
<body>
<a href="/sample/all">◀◀all page</a>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
&nbsp;&nbsp;&nbsp;
<a href="/sample/member">◀member page</a><p/> 
<h1>/sample/admin page</h1>

<p>principal : <sc:authentication property="principal"/></p>
<p>MemberVO : <sc:authentication property="principal.member"/></p>
<p>사용자 이름 : <sc:authentication property="principal.member.userName"/></p>
<p>사용자 아이디 : <sc:authentication property="principal.member.userid"/></p>
<p>사용자 권한리스트 : <sc:authentication property="principal.member.authList"/></p>

<a href="/customLogout">로그아웃</a>

</body>
</html>