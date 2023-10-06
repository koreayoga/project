<%@ page language="java" contentType="text/html; charset=UTF-8"	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="sec"%>

<%@ include file="../includes/header.jsp"%>

		<div class="row">
			<div class="col-lg-12">
				<h1 class="page-header">mypage</h1>
			</div>
			<!-- /.col-lg-12 -->
		</div>
		<!-- /.row -->
		<div class="row">
			<div class="col-lg-12">
				<div class="panel panel-default">
					<div class="panel-heading"> 00 <c:out value="${member.userid}"/></div>
					<!-- /.panel-heading -->
					<div class="panel-body">						
						
							
				
		<form name="myForm" method="get" action="member/get">
			<table style="width: 500px">
				<tr>
				    <td>아이디</td>
				    <td>
				    <input id="userid" name="userid" value='<c:out value="${member.userid}"/>' readonly="readonly"> </td>
				</tr>
				<tr>
				    <td>이름</td>
				    <td><input id="name" name="name" value='<c:out value="${member.username}"/>' readonly="readonly"> </td>
				</tr>
				<tr>
					<td>연락처</td>
					<td><input id="phone" name="phone" value='<c:out value="${member.phone}"/>' readonly="readonly"> </td>
				</tr>
				<tr>
					<td>생년월일</td>
					<td><input type="date" id="birth" name="birth" value='<c:out value="${member.birth}"/>' readonly="readonly"> </td>
				</tr>
				<tr>
					<td>주소</td>
					<td><input id="address" name="address" value='<c:out value="${member.address}"/>' readonly="readonly"> </td>
				</tr>
				<tr>
					<td>이메일</td>
					<td><input type="email" id="email" name="email" value='<c:out value="${member.email}"/>' readonly="readonly"> </td>
				</tr>	

				<tr>
				<td> <input type="button" value="내 정보수정" > </td>
				<td> <input type="reset" value="회원 탈퇴 "> </td>
				</tr>
			</table>
		</form>
	
							
					</div>
					<!-- /end panel-body -->
				</div>
				<!-- /end panel -->
			</div>
			<!-- /.col-lg-12 -->
		</div>
		<!-- /.row -->
		
		
	
<%@ include file="../includes/footer.jsp"%>