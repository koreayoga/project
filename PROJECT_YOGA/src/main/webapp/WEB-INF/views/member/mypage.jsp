<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@include file="../includes/header.jsp"%>
<title>MYPAGE</title>

<link href="../resources/css/insert.css" rel="stylesheet" />
</head>
<body>
	<div class="testBox" style="text-align: center;">		
		<h1> MYPAGE </h1>
			<table class="testBox" style="width: 500px">
				<tr>
				    <td>아이디</td>
				    <td><c:out value="${user.userid}"/></td>
				</tr>
				<tr>
				    <td>이름</td>	 
				    <td><c:out value="${user.name}"/></td>
				</tr>								
				<tr>						
					<td>성별</td>
					<td><c:out value="${user.gender}"/></td>					
				</tr>
				<tr>
					<td>연락처</td>
					<td><c:out value="${user.phone}"/></td>
				</tr>
				<tr>
					<td>생년월일</td>
					<td><c:out value="${user.birth}"/></td>
				</tr>
				<tr>
					<td>주소</td>
					<td><c:out value="${user.address}"/></td>
				</tr>
				<tr>
					<td>이메일</td>
					<td><c:out value="${user.email}"/></td>
				</tr>
				<tr>
					<td>수강중인 강의</td>
					<td><c:out value="강의가없다....."/></td>
				</tr>	
				<tr>
					<td colspan="2"> 
						<button onclick="window.location.href='/member/update'" class="btn btn-third btn-m">회원정보수정</button>
						<button onclick="history.go(-1)" class="btn btn-third btn-m">뒤로가기</button>				 					 		
				 	</td>
				</tr>
			</table>
			<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token }">		
	</div>
	
<%@include file="../includes/footer.jsp"%>		

