<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
    <head>
	<%@include file="../include/nav.jsp"%>
	<title>LOGIN</title>
	<link href="../resources/css/pageStyle.css" rel="stylesheet" />
	</head>			
	<div class="test">
		<h1>Login</h1>
		<form method="post" action="home.jsp">
			<input style="width: 250px;"id="id" value="아이디를 입력해주세요"><br/>
			<input style="width: 250px;" type="password" id="pw" value="비밀번호를 입력해주세요"><br/>
			<input type="checkbox" id="check"> 로그인 정보를 기억하겠습니다.<br/>
			<input class="log" type="submit" value="로그인">
			<input class="log" type="submit" value="회원가입">
		</form>
		<a href="searchID.jsp">아이디 찾기</a>
		<a href="searchPW.jsp">비밀번호 찾기</a>
	</div>
	<%@include file="../include/footer.jsp"%>		
