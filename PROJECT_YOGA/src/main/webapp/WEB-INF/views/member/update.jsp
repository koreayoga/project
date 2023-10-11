<%@ page language="java" contentType="text/html; charset=UTF-8"	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@include file="../includes/header.jsp"%>
<title>UPDATE INFO</title>
<link href="../resources/css/insert.css" rel="stylesheet" />
	<div class="testBox">
		<form role="form" name="regForm" method="post" action="/member/update" id="userInfo">			
			<table style="width: 500px">
				<tr>
				    <td>아이디</td> <td><input id="userid" name="userid" value="${user.userid}" readonly></td>				     
				</tr>
				<tr>
				    <td>이름</td> <td><input id="name" name="name" value="${user.name}" readonly></td>
				</tr>
				<tr>
				    <td>비밀번호</td> <td><input type="password" id="userpw" name="userpw" value="${user.userpw}"> <p style="font-size:small;">1개의 숫자,영문자,특수문자(@,#,$,%)이 포함된 6~8자</p></td>
				</tr>
				<tr>
				    <td>비밀번호 확인</td> <td><input type="password" id="repw" name="repw" value="${user.userpw}"></td>
				</tr>
				<tr>
					<td>성별</td> <td>${user.gender}</td>
				</tr>
				<tr>
					<td>연락처</td> <td><input id="phone" name="phone" value="${user.phone}"></td>
				</tr>
				<tr>
					<td>생년월일</td>	<td><input type="date" id="birth" name="birth"  value="${user.birth}" readonly></td>
				</tr>
				<tr>
					<td>주소</td> <td><input id="address" name="address" value="${user.address}"></td>
				</tr>
				<tr>
					<td>이메일</td> <td><input type="email" id="email" name="email" value="${user.email}"><p style="font-size:small;">예: yoga@gmail.com</p></td>
				</tr>
				<tr>
					<td colspan="2"> 
						<button id="update" class="btn btn-third btn-m" data-oper="update">수정완료</button>
						<button onclick="history.go(-1)" class="btn btn-third btn-m">뒤로가기</button>	 
						<button id="quit" onclick="inputCheck()">탈퇴하기</button> 
					</td>
				</tr>
			</table>
			<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}">
		</form>
	</div>
	
	
<!-- ============SCRIPT=====================SCRIPT=========================SCRIPT============================SCRIPT======================= -->			
<script>
$(document).ready(function(){
	var formObj = $("form[role='form']");
	//완료 버튼 클릭시 수정 진행==========================================================
	$("button[id='update']").on("click", function(e){
		e.preventDefault();
          
        console.log("완료 버튼 클릭");
        
        inputCheck(); 
        formObj.submit();
            
	});
 
	var csrfHeaderName ="${_csrf.headerName}";
    var csrfTokenValue ="${_csrf.token}"; 
        
    $("input[type='file']").change(function(e){
            
    
            var formData = new FormData();
            var inputFile = $("input[name='uploadFile']");
            var files = inputFile[0].files;
    
            
            for(var i=0; i<files.length; i++){
                //확인 메서드에서 false가 나오면 안됨
                if(!checkExtension(files[i].name, files[i].size)){
                    return false;
                }
                //append:요소추가
                formData.append("uploadFile",files[i]);
            }
            //ajax로 서버(uploadAjaxAction)에 전송
            $.ajax({
                url: '/uploadAjaxAction',
                processData: false, 
                contentType: false,
                //ajax로 csrf토큰 전송
                beforeSend: function(xhr){
                    xhr.setRequestHeader(csrfHeaderName, csrfTokenValue);
                },
                data: formData,
                type: 'POST',
                dataType: 'json',
                success: function(result){
                    console.log(result)
                    showUploadResult(result);
                }
            }); // End ajax
            
        }); //End change
 
</script>

<script type="text/javascript"> 

	var reg_email = /^[a-zA-Z0-9._-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]+$/;
	var reg_pw = /(?=.*[0-9])(?=.*[a-zA-Z])(?=.*?[@#$%]).{6,8}/;
	
	function inputCheck() {
	    //수정한 데이터 수집(비밀번호, 연락처, 주소, 이메일)
	    var userpw = document.getElementById("userpw").value;
	    var repw = document.getElementById("repw").value;        
	    var phone = document.getElementById("phone").value;
	    var address = document.getElementById("address").value;
	    var email = document.getElementById("email").value;
	    
	    //비밀번호, 연락처, 주소, 이메일 입력란이 비어 있는지 확인. default는 DB에서 불러옴.
	    if (userpw === "" || repw === "" || phone === "" || address === "" || email === "") {
	        alert("모든 필드를 입력하세요.");
	        return;
	    }
	
	    //패스워드와 패스워드 확인이 일치여부 확인.
	    if (userpw !== repw) {
	        alert("패스워드가 일치하지 않습니다.");        
	        return;
	    }
	
	    //이메일의 작성규칙 확인.    
	    var reg_email = /^[a-zA-Z0-9._-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]+$/;
	    if (!reg_email.test(email)) {
	        alert("이메일 형식 오류");
	        return;
	    }
	
	    //제출
	    document.regForm.submit();
	} 
 </script>
	
	
	
<%@include file="../includes/footer.jsp"%>		