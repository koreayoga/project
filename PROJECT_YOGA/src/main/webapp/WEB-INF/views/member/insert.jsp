<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
<%@include file="../includes/header.jsp"%>
<title>MEMBER</title>
<link href="../resources/css/pageStyle.css" rel="stylesheet" />
</head>
<body>
	<div class="test">
		<form name="regForm" method="post" action="member/insert">
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
	
	
<!-- ============SCRIPT=====================SCRIPT=========================SCRIPT============================SCRIPT======================= -->			

<script type="text/javascript">
function checkId() {
	    $.ajax({
	        url: "/member/checkId",
	        type: "post",
	        dataType: "json",
	        data: { "userid": $("#userid").val() },
	        success: function (result) {
	            if (result == 1) {
	                alert("중복된 아이디입니다.");
	                $("#join").hide();
	            }else if(result == 0)  {
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
    // 아이디, 비밀번호, 이름, 생년월일, 주소, 이메일 등 사용자가 입력한 데이터를 가져옵니다.
    var userid = document.getElementById("userid").value;
    var userpw = document.getElementById("userpw").value;
    var repw = document.getElementById("repw").value;
    var name = document.getElementById("name").value;
    var birth = document.getElementById("birth").value;
    var address = document.getElementById("address").value;
    var email = document.getElementById("email").value;
    
    // 아이디, 비밀번호, 이름, 생년월일, 주소, 이메일이 비어 있는지 확인합니다.
    if (userid === "" || userpw === "" || repw === "" || name === "" || birth === "" || address === "" || email === "") {
        alert("모든 필드를 입력하세요.");
        return;
    }

    // 패스워드와 패스워드 확인이 일치하는지 확인합니다.
    if (userpw !== repw) {
        alert("패스워드가 일치하지 않습니다.");
        return;
    }

    // 생년월일이 오늘 이후인지 확인합니다.
    var bDay = new Date(birth);
    var toDay = new Date();
    if (bDay > toDay) {
        alert("오늘 이후의 생년월일을 입력하셨습니다.");
        return;
    }

    // 아이디와 이메일의 형식을 확인합니다.
    var reg_id = /^[a-zA-Z][0-9a-zA-Z].{4,6}$/;
    if (!reg_id.test(userid)) {
        alert("아이디 작성 오류");
        return;
    }

    var reg_email = /^[a-zA-Z0-9._-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]+$/;
    if (!reg_email.test(email)) {
        alert("이메일 작성 오류");
        return;
    }

    // 모든 검사가 통과되면 폼을 서버로 제출합니다.
    document.regForm.submit();
}
 

 
 </script>
	
	
	
<%@include file="../includes/footer.jsp"%>		