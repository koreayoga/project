<%@page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@include file="../includes/header.jsp"%>
<title>UPDATE INFO</title>
<link href="../resources/css/insert.css" rel="stylesheet" />
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link href="https://fonts.googleapis.com/css2?family=Gaegu:wght@300;400&family=Jua&family=Orbit&display=swap" rel="stylesheet">

	<div class="testBox">
		<form role="form" name="regForm" method="post" action="/member/update" id="userInfo">			
			<table id="info">
				<tr>
					<td colspan="3" style="height:0px; padding-left: 20px"><h1> MY&nbsp;&nbsp;INFO </h1><hr></td>					
				</tr>
				<tr>
					<th>아 이 디</th><td id="second">||</td><td><input id="userid" name="userid" value="${user.userid}" readonly></td>				     
				</tr>
				<tr>
				    <th>이 름</th><td id="second">||</td><td><input id="name" name="name" value="${user.name}" readonly></td>
				</tr>				
				<tr>
				    <th>비 밀 번 호</th><td id="second">||</td><td><input type="password" id="userpw" name="userpw" value="${user.userpw}"> 
				    <label for="userpw" style="font-size:small; color: red">*숫자,영문자,특수문자(@,#,$,%) 포함 6~8자</label></td>
				</tr>
				<tr>
				    <th>비 밀 번 호 확 인</th><td id="second">||</td><td><input type="password" id="repw" name="repw" value="${user.userpw}"></td>
				</tr>
				<tr>
					<th>성 별</th><td id="second">||</td><td><input id="name" name="name" value="${user.gender}" readonly></td>
				</tr>
				<tr>
					<th>연 락 처</th><td id="second">||</td><td><input id="phone" name="phone" value="${user.phone}"></td>
				</tr>
				<tr>
					<th>생 년 월 일</th><td id="second">||</td><td><input type="date" id="birth" name="birth"  value="${user.birth}" readonly></td>
				</tr>
				<tr>
					<th>주 소</th><td id="second">||</td><td><input id="address" name="address" value="${user.address}"></td>
				</tr>
				<tr>
					<th>이 메 일</th><td id="second">||</td><td><input type="email" id="email" name="email" value="${user.email}">
					<label for="userpw" style="font-size:small; color: red">*예) yoga@gmail.com</label></td>
				</tr>
				<tr>
					<td id="buttonBox_3" colspan="3"> 
						<button id="update" class="btn btn-third btn-xl2" onclick="inputCheck()" data-oper="update">수정완료</button>
						<button class="btn btn-third btn-xl2" onclick="history.go(-1)">뒤로가기</button>	 
						<button id="quit" class="btn btn-third btn-xl2" >탈퇴하기</button> 
					</td>
				</tr>
			</table>
			<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}">
		</form>
	</div>
	
	
<!-- ============SCRIPT=====================SCRIPT=========================SCRIPT============================SCRIPT======================= -->			
<script>
$(document).ready(function(){
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
	

	var formObj = $("form[role='form']");
	//완료 버튼 클릭시 수정 진행==========================================================
	$("button[id='update']").on("click", function(e){
		e.preventDefault();
          
        console.log("완료 버튼 클릭");
        
        inputCheck(); 
        formObj.submit();
            
	});
 /*
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
 */
</script>

<script type="text/javascript"> 

	
 </script>
	
	
	
<%@include file="../includes/footer.jsp"%>		