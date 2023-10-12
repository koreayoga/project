<%@page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@include file="../includes/header.jsp"%>
<title>MYPAGE</title>
<link href="../resources/css/insert.css" rel="stylesheet" />
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link href="https://fonts.googleapis.com/css2?family=Gaegu:wght@300;400&family=Jua&family=Orbit&display=swap" rel="stylesheet">


	<div class="testBox" style="text-align: center;">		
		<form id="userInfo" action="/member/update" method="get">
			<table id="info">
				<tr>
					<td colspan="3" style="padding-left: 20px"><h1> MYPAGE </h1><hr></td>					
				</tr>						
				<tr>
				    <th>아 이 디</th><td id="second">||</td><td>${user.userid}</td>
				</tr>
				<tr>
				    <th>이 름</th><td id="second">||</td><td>${user.name}</td>
				</tr>							
				<tr>						
					<th>성 별</th><td id="second">||</td>			
					<td>${user.gender=='F'?'여자':'남자'}</td>					
				</tr>
				<tr>
					<th>연 락 처</th><td id="second">||</td><td>${user.phone}</td>
				</tr>
				<tr>
					<th>생 년 월 일</th><td id="second">||</td><td>${user.birth}</td>
				</tr>
				<tr>
					<th>주 소</th><td id="second">||</td><td>${user.address}</td>
				</tr>
				<tr>
					<th>이 메 일</th><td id="second">||</td><td>${user.email}</td>
				</tr>
				<tr>
					<th>수 강 중 인&nbsp;&nbsp;강 의</th><td id="second">||</td><td>[${course.ccode}]${course.ctime}_${course.croom}&nbsp;<b>${course.cname}클래스</b></td>
				</tr>				
				<tr>
					<td colspan="3" id="buttonBox_2">						
        				<button type="submit" id="update" class="btn btn-third btn-xl2">수&nbsp;정&nbsp;하&nbsp;기</button>						
						<a href="/" class="btn btn-third btn-xl2">메&nbsp;인&nbsp;으&nbsp;로</a>				 					 		
				 	</td>
				</tr>
			</table>
			<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token }">
			</form>					
	</div>	
<%@include file="../includes/footer.jsp"%>		

