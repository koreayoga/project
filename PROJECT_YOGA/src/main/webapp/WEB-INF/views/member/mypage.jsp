<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@include file="../includes/header.jsp"%>
<title>MYPAGE</title>
<link href="../resources/css/insert.css" rel="stylesheet" />
</head>
<body>
	<div class="testBox" style="text-align: center;">		
		<h1> MYPAGE </h1>
			<form id="userInfo" action="/member/update" method="get">
			<table class="testBox" style="width: 500px">
				<tr>
				    <td>아이디</td>			<td>${user.userid}</td>
				</tr>
				<tr>
				    <td>이름</td>				<td>${user.name}</td>
				</tr>							
				<tr>						
					<td>성별</td>				<td>${user.gender}</td>			
					<%-- <td>
						<c:choose>							
							<c:when test='${user.gender eq "F"}'>
								여자
							</c:when>
							<c:otherwise>
								남자
							</c:otherwise>
						</c:choose>	
					</td> --%>					
				</tr>
				<tr>
					<td>연락처</td>			<td>${user.phone}</td>
				</tr>
				<tr>
					<td>생년월일</td>			<td>${user.birth}</td>
				</tr>
				<tr>
					<td>주소</td>				<td>${user.address}</td>
				</tr>
				<tr>
					<td>이메일</td>			<td>${user.email}</td>
				</tr>
				<tr>
					<td>수강중인 강의</td>		<td><c:out value="강의가없다....."/></td>
				</tr>	
				<tr>
					<td colspan="2">						
        				<button type="submit" id="update" class="btn btn-third btn-m">수정</button>						
						<button onclick="history.go(-1)" class="btn btn-third btn-m">뒤로가기</button>				 					 		
				 	</td>
				</tr>
			</table>
			<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token }">
			</form>		
	</div>
	
<%@include file="../includes/footer.jsp"%>		

