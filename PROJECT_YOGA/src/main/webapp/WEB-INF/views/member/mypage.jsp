<%@page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@include file="../includes/header.jsp"%>
<head>
<title>MYPAGE</title>
<link href="../resources/css/info.css" rel="stylesheet" />
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link href="https://fonts.googleapis.com/css2?family=Gaegu:wght@300;400&family=Jua&family=Orbit&display=swap" rel="stylesheet">
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<style>
	.modal {
		display: none;
		position: fixed;
		z-index: 1;
		left: 0;
		top: 0;
		width: 100%;
		height: 100%;
		background-color: rgba(0, 0, 0, 0.4);
	}
	
	.modal-content {
		background-color: #fefefe;
		margin: 15% auto;
		padding: 20px;
		border: 1px solid #888;
		width: 50%;
	}
	
	.close {
		color: #aaaaaa;
		float: right;
		font-size: 28px;
		font-weight: bold;
	}
</style>
</head>
	<div class="testBox" style="text-align: center;">		
		<!-- <form id="userInfo" action="/member/update" method="get"> -->
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
					<td colspan="3" id="buttonBox_3">						
        				<a href="/member/update" id="update" class="btn btn-third btn-xl2">수정하기</a>						
						<a href="/" class="btn btn-third btn-xl2">메인으로</a>
						<button class="btn btn-third btn-xl2" onclick="pwPrompt()">탈퇴하기</button>				 					 		
				 	</td>
				</tr>
			</table>
			<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token }">
			<!-- </form> -->					
	</div>	
	<div id="pwmodal" class="modal">
        <div class="modal-content">
            <label for="password">비밀번호를 입력하세요:</label>
            <input type="password" id="inputpw">
            <button onclick="checkPw()">확인</button>
            <button onclick="closePrompt()">닫기</button>
        </div>
    </div>
	<script>	
	function pwPrompt() {
	    var modal = document.getElementById("pwmodal");
	    modal.style.display = "block";	 
	}

	function closePrompt() {
	    var modal = document.getElementById("pwmodal");
	    modal.style.display = "none";
	}

	function checkPw() {
	    //var inputPw = document.getElementById("inputpw");
	    var inputPw = $("#inputpw").val();
		console.log("123"+inputPw2);
		console.log("${user.userid}");

	    if(inputPw != '') {
			
			var userid = "${user.userid}";
			var param = {"userid":userid, "userpw":inputPw}
			
				$.ajax({			
					async: true,
					type: 'POST',
					data: JSON.stringify(param),
					beforeSend: function(xhr) {
						xhr.setRequestHeader("${_csrf.headerName}", "${_csrf.token}");
					},
					url: "/member/delete",
					dataType: "text",
					contentType: "application/json; charset=UTF-8",
					success: function(data) {	
						if(data == "success") {					
							alert("탈퇴가 처리되었습니다.");
							closePrompt();
							location.href="/";
						} else {
							alert("비밀번호가 맞지 않습니다.");
							checkPw();
						}	
					},
					error:function(request, status, error){
				        alert("오류가 발생했습니다. 다시 시도해주십시오.");
				        //checkPw();
				    }		
				})		
		} else {
			alert("비밀번호를 입력해주세요.");
			checkPw();
		}		
	}
	
</script>
<!-- <script>
function deleteMem() {	
	
	var inputPw = prompt("비밀번호를 입력해주세요.");
	
	if(inputPw.trim() != '') {
		
		var userid = $("#userid").val();
		var param = {"ID":userid, "PW":inputPw}
		
			$.ajax({			
				async: true,
				type: 'POST',
				data: JSON.stringify(param),
				beforeSend: function(xhr) {
					xhr.setRequestHeader("${_csrf.headerName}", "${_csrf.token}");
				},
				url: "/member/delete",
				dataType: "text",
				contentType: "application/json; charset=UTF-8",
				success: function(data) {	
					if(data == "success") {					
						alert("탈퇴가 처리되었습니다.");
						closePasswordPrompt();
						location.href="/";
					} else {
						alert("비밀번호가 맞지 않습니다.");
						deleteMem();
					}	
				},
				error:function(request, status, error){
			        alert("오류가 발생했습니다. 다시 시도해주십시오.");
			        deleteMem();
			    }		
			})		
	} else {
		alert("비밀번호를 입력해주세요.");
		deleteMem();
	}
}
</script> -->			
<%@include file="../includes/footer.jsp"%>		

