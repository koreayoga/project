<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@include file="../includes/header.jsp"%>
<% request.setCharacterEncoding("utf-8"); %>
<% response.setCharacterEncoding("utf-8"); %>
<title>MEMBER</title>
<link href="../resources/css/insert.css" rel="stylesheet" />
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link href="https://fonts.googleapis.com/css2?family=Gaegu:wght@300;400&family=Jua&family=Orbit&display=swap" rel="stylesheet">
   <div class="insertBox">
      <form name="regForm" method="post" action="/member/insert">
         <table id="insert">
         	<tr>
				<td colspan="3" style="height:0px; padding-left: 20px"><h1 id="head"> 회 원 가 입 </h1><hr style="width: 860px"></td>					
			</tr>
            <tr>
                <th>아 이 디</th><td id="second">||</td><td><input id="userid" name="userid" autofocus>
                <input type="button" id="check" class="btn-third btn-xs" onclick="checkId()" value="중복체크">
                <label for="userid" style="font-size:small; color: red">영문자 6~8자리</label>
                </td>                
            </tr>
            <tr>
                <th>이 름</th><td id="second">||</td><td><input id="name" name="name"></td>
            </tr>
            <tr>
                <th>비 밀 번 호</th>
                <td id="second">||</td>
                <td><input type="password" id="userpw" name="userpw"><label for="userpw" style="font-size:small; color: red">&nbsp;&nbsp;*숫자,영문자,특수문자(@,#,$,%) 포함 6~8자</label></td>
            </tr>
            <tr>
                <th>비 밀 번 호 확 인</th>
                <td id="second">||</td>
                <td><input type="password" id="repw" name="repw"></td>
            </tr>
            <tr>
               <th>성 별</th>
               <td id="second">||</td>
               <td>여성<input type="radio" name="gender" value="F"> 남성<input type="radio" name="gender" value="M"></td>
            </tr>
            <tr>
               <th>연 락 처</th>
               <td id="second">||</td>
               <td><input id="phone" name="phone"></td>
            </tr>
            <tr>
               <th>생 년 월 일</th>
               <td id="second">||</td>
               <td><input type="date" id="birth" name="birth"></td>
            </tr>
            <tr>
               <th>주 소</th>
               <td id="second">||</td>
               <td><input id="address" name="address"></td>
            </tr>
            <tr>
               <th>이 메 일</th>
               <td id="second">||</td>
               <td><input type="email" id="email" name="email"><label for="userpw" style="font-size:small; color: red">&nbsp;&nbsp;*예) yoga@gmail.com</label></td>
            </tr>            
            <tr>
               <td colspan="3" style="text-align: center;"><b>개인정보 및 약관동의서</b><hr style="width:860px; margin-top: 10px"></td>
            </tr>
            <tr>               
               <td colspan="3" style="height: 300px"><textarea style="width: 860px; height:300px; border: 0px solid transparent;" readonly><%@include file="agree.jsp"%></textarea></td>
            </tr>
            <tr>
               <!-- <td><input type="hidden"></td> -->               
               <td colspan="3" style="text-align: center"><input type="checkbox" required><b>동의서를 확인하였으며, 이에 동의합니다.</b></td>
            </tr>

            <tr>
	            <td id="buttonBox_2" colspan="3"> 
		            <input id="join" type="button" value="회원가입" onclick="inputCheck()">
	    	        <input type="reset" value="다시쓰기"> 
    	        </td>
            </tr>
         </table>
         <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}">
      </form>
   </div>
   
<!-- ============SCRIPT=====================SCRIPT=========================SCRIPT============================SCRIPT======================= -->         

<script type="text/javascript">
	var reg_id = /^[a-zA-Z][0-9a-zA-Z].{4,6}$/; 
	var reg_email = /^[a-zA-Z0-9._-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]+$/;
	var reg_pw = /(?=.*[0-9])(?=.*[a-zA-Z])(?=.*?[@#$%]).{6,8}/;
	function checkId() {
	   if($("#userid").val()==""){
	      alert("아이디를 입력하세요.");
	      return;
	   }else if(!reg_id.test($("#userid").val())){
	      alert("6~8자의 영문자로 시작하는 아이디를 입력하세요.");
	      return;
	   }
       $.ajax({
           url: "/member/checkId",
           type: "post",
           dataType: "json",
           data: { "userid": $("#userid").val() },
           success: function (result) {
               if (result == 1) {
                   alert("중복된 아이디입니다.");
                   //$("#join").hide();
               }else if(result == 0)  {
                   $("#checkId").attr("value", "Y");
                   alert("사용 가능한 아이디입니다.");
                   //$("#join").show();
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
	    //var reg_id = /^[a-zA-Z][0-9a-zA-Z].{4,6}$/;
	    if (!reg_id.test(userid)) {
	        alert("아이디 작성 오류");
	        return;
	    }
	
	    var reg_email = /^[a-zA-Z0-9._-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]+$/;
	    if (!reg_email.test(email)) {
	        alert("이메일 작성 오류");
	        return;
	    }
	    
	    var reg_pw = /(?=.*[0-9])(?=.*[a-zA-Z])(?=.*?[@#$%]).{6,8}/;
	    if (!reg_pw.test(userpw)) {
	        alert("비밀번호 규칙 오류");
	        return;
	    }
	    // 모든 검사가 통과되면 폼을 서버로 제출합니다.
	    document.regForm.submit();
	    alert(userid+"님 회원가입을 축하드립니다.");
	} 
 </script>      
<%@include file="../includes/footer.jsp"%>
