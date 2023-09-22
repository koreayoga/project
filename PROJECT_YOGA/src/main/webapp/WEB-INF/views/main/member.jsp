<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
<%@include file="../include/nav.jsp"%>
<title>MEMBER</title>
<link href="../resources/css/pageStyle.css" rel="stylesheet" />
</head>
<body>
	<div class="test">
		<form method="post">
			<table style="width: 500px">
				<tr>
					<td>아이디</td>
					<td><input id="id"></td>
					<td><input type="button" value="중복체크"></td>
				</tr>
				<tr>
					<td>이름</td>
					<td><input id="name"></td>
				</tr>
				<tr>
					<td>비밀번호</td>
					<td><input type="password" id="pwd"></td>
				</tr>
				<tr>
					<td>비밀번호 확인</td>
					<td><input type="password" id="pwdinfo"></td>
				</tr>
				<tr>
					<td>아이디</td>
					<td><input id="id"></td>
				</tr>
				<tr>
					<td>성별</td>
					<td>여성<input type="radio" name="gender"> 
						남성<input type="radio" name="gender"></td>
				</tr>
				<tr>
					<td>연락처</td>
					<td><input id="phone" value="010-0000-0000"></td>
				</tr>
				<tr>
					<td>생년월일</td>
					<td><input type="date" id="birth"></td>
				</tr>
				<tr>
					<td>주소</td>
					<td><input id="id"></td>
				</tr>
				<tr>
					<td>이메일</td>
					<td><input type="email" id="email"></td>
				</tr>
				<tr>
					<td>개인정보 및 약관동의서</td>
					<td><textarea>ㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁ
						ㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁ</textarea></td>
				</tr>
				<tr>
					<td><input type="hidden"></td>
					<td><input type="checkbox">동의서를 확인하였으며,이에 동의합니다.</td>
				</tr>
			</table>
		</form>
	</div>
<%@include file="../include/footer.jsp"%>		