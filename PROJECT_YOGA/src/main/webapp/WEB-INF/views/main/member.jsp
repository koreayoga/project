<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
<%@include file="../includes/header.jsp"%>
<title>MEMBER</title>
<link href="../resources/css/pageStyle.css" rel="stylesheet" />


<script type="text/javascript">

function checkId() {
    $.ajax({
        url: "/insert/checkId",
        type: "post",
        dataType: "json",
        data: { "userid": $("#userid").val() },
        success: function (data) {
            if (data.result == "duplicate") {
                alert("중복된 아이디입니다.");
                $("#join").hide();
            }else if (data.result == "available") {
                $("#checkId").attr("value", "Y");
                alert("사용 가능한 아이디입니다.");
                $("#join").show();
            }
        },
        error: function () {
            alert("서버 오류가 발생했습니다."); // 오류 처리 추가
        }
    });
}
 
 function inputCheck() {
		if(document.regForm.userid.value==""){
		alert("아이디를 입력하세요");
		document.regForm.userid.focus();
		return;
		}
		if(document.regForm.userpw.value==""){
		alert("패스워드를 입력하세요");
		document.regForm.userpw.focus();
		return;
		}
		if(document.regForm.repw.value==""){
		alert("패스워드를 확인하세요");
		document.regForm.repw.focus();
		return;
		}
		if(document.regForm.name.value==""){
		alert("이름을 입력하세요");
		document.regForm.name.focus();
		return;
		}
		if(document.regForm.gender.value==""){
		alert("성별을 선택하세요");
		return;
		}
		if(document.regForm.phone.value==""){
		alert("연락처를 입력하세요");
		document.regForm.phone.focus();
		return;
		}
		if(document.regForm.birth.value==""){
		alert("생일을 입력하세요");
		document.regForm.birth.focus();
		return;
		}
		if(document.regForm.address.value==""){
		alert("주소를 입력하세요");
		document.regForm.address.focus();
		return;
		}
		if(document.regForm.email.value==""){
		alert("이메일을 입력하세요");
		document.regForm.email.focus();
		return;
		}

		var bDay = new Date(document.regForm.birth.value);
		var toDay = new Date();

		if (bDay > toDay) {
		alert("오늘 이후의 생년월일을 입력하셨습니다.");
		document.regForm.birth.focus();
		return;
		}

		if(document.regForm.userpw.value != document.regForm.repw.value){
		alert("패스워드가 일치하지 않습니다.");
		document.regForm.repw.focus();
		return;
		}

		let reg_id = /^[a-zA-Z][0-9a-zA-Z].{4,6}$/;
		if(!reg_id.test(document.regForm.userid.value)) {
		alert("아이디 작성 오류");
		document.regForm.userid.focus();
		return;
		}

		let reg_pwd = /(?=.*[0-9])(?=.*[a-zA-Z])(?=.*?[@#$%]).{6,8}/
		if(!reg_pwd.test(document.regForm.userpw.value)) {
		alert("패스워드 작성 오류");
		document.regForm.userpw.focus();
		return;
		}
		let reg_email = /^[a-zA-Z0-9._-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]+$/
		if(!reg_email.test(document.regForm.email.value)) {
		alert("이메일 작성 오류");
		document.regForm.email.focus();
		return;
		}

		document.regForm.submit();
		}
 

 
 </script>


</head>
<body>
	<div class="test">
		<form name="regForm" method="post" action="/memeber/insert">
			<table style="width: 500px">
				<tr>
				    <td>아이디</td>
				    <td><input id="userid" name="userid"></td>
				    <td><input type="button" value="중복체크" onclick="checkId()"></td>
				</tr>
				<tr>
				    <td>이름</td>
				    <td><input id="name" name="name"></td>
				</tr>
				<tr>
				    <td>비밀번호</td>
				    <td><input type="password" id="userpw" name="userpw"></td>
				</tr>
				<tr>
				    <td>비밀번호 확인</td>
				    <td><input type="password" id="repw" name="repw"></td>
				</tr>
				<tr>
					<td>성별</td>
					<td>여성<input type="radio" name="gender"> 
						남성<input type="radio" name="gender"></td>
				</tr>
				<tr>
					<td>연락처</td>
					<td><input id="phone" value="010-0000-0000" name="phone"></td>
				</tr>
				<tr>
					<td>생년월일</td>
					<td><input type="date" id="birth" name="birth"></td>
				</tr>
				<tr>
					<td>주소</td>
					<td><input id="address" name="address"></td>
				</tr>
				<tr>
					<td>이메일</td>
					<td><input type="email" id="email" name="email"></td>
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

				<tr>
				<td> <input id="join" type="button" value="회원가입" onclick="inputCheck()"> </td>
				<td> <input type="reset" value="다시쓰기"> </td>
				</tr>
			</table>
		</form>
	</div>
	

	
<%@include file="../includes/footer.jsp"%>		