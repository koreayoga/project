<%@page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@include file="../includes/header.jsp"%>
<title>UPDATE INFO</title>
<link href="../resources/css/insert.css" rel="stylesheet" />
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link href="https://fonts.googleapis.com/css2?family=Gaegu:wght@300;400&family=Jua&family=Orbit&display=swap" rel="stylesheet">
<div style="width: 80%;">
	<table class="table table-bordered" style="text-align: center;">
		<thead>
			<tr><td colspan="10"><h1>회원관리</h1></td></tr>
			<tr>
				<th style="width:11%">아이디</th>
				<th style="width:5%">이름</th>
				<th style="width:5%">성별</th>
				<th style="width:12%">핸드폰</th>
				<th style="width:10%">생일</th>
				<th style="width:21%">주소</th>
				<th style="width:20%">이메일</th>
				<th style="width:5%">권한</th>
				<th style="width:5%">수정</th>
				<th style="width:5%">삭제</th>
			</tr>
		</thead>
		<c:forEach items="${list}" var="member">
			<tr>
				<td><c:out value="${member.userid}" /></td>
				<td><c:out value="${member.name}" /></td>
				<td><c:out value="${member.gender=='F'?'여':'남'}" /></td>
				<td><c:out value="${member.phone}" /></td>
				<td><c:out value="${member.birth}" /></td>
				<td><c:out value="${member.address}" /></td>
				<td><c:out value="${member.email}" /></td>
				<td><c:out value="${member.auth}" /></td>
				<td>
					<button class="edit-btn" data-userid="${member.userid}">수정</button>
				</td>
				<td>
					<button class="delete-btn" data-userid="${member.userid}">삭제</button>
				</td>
			</tr>
		</c:forEach>
	</table>
</div>



<!-- Modal -->
<div id="myModal" class="modal" style="display: none;">
	<div class="modal-content">
		<span class="close" id="closeModalBtn">&times;</span>
		<form role="form" name="updateForm" method="post"
			action="/member/updateAdmin">
			<!-- Member information input fields -->
			<input type="text" id="userid" name="userid"> <input
				type="text" id="auth" name="auth" placeholder="권한"> <input
				type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}">
			<!-- Other necessary input fields -->
			<button id="updateAdmin" data-oper="updateAdmin">업데이트</button>
		</form>
	</div>
</div>


<!-- ============SCRIPT=====================SCRIPT=========================SCRIPT============================SCRIPT======================= -->

<script>


$(document).ready(function () {
	$(".edit-btn").click(function () {
      var userid = $(this).data("userid");
        $("#userid").val(userid);
        $("#myModal").css("display", "block");
     });
	
    $("#closeModalBtn").click(function () {
        $("#myModal").css("display", "none");
     });

//UPDATE BUTTON.
        $("#updateBtn").click(function () {
            var userid = $("#userid").val();
            var auth = $("#auth").val();
            var member = {
                userid: userid,
                auth: auth
            };
            var formObj = $("form[role='form']");
        	$("button[id='updateAdmin']").on("click", function(e){
                formObj.submit()
        	});
        	
//DELETE BUTTON.
            $(".delete-btn").click(function () {
                var userid = $(this).data("userid");
                if (confirm("정말로 이 회원을 삭제하시겠습니까?")) {
                	 $.ajax({
                         type: "POST",
                         url: "/member/delete",
                         data: JSON.stringify(member),
                         contentType: "application/json",
                         success: function (response) {
                             if (response === "success") {
                                 // Handle success
                                 $("#myModal").css("display", "none");
                                 // You can also reload the table to reflect changes here
                             } else {
                                 // Handle error
                                 alert("실패");
                             }
                         }
                     });
                }//if (confirm)
            });//$(".delete-btn") 
        });//$("#updateBtn")
    });
    
    


    // Ajax Spring Security Header
    $(document).ajaxSend(function(e, xhr, options){
       xhr.setRequestHeader("${_csrf.headerName}", "${_csrf.token}");
    });
    
/*     //Ajax Spring Security Header
    $(document).ajaxSend(function(e, xhr, options){
       xhr.setRequestHeader(csrfHeaderName, csrfTokenValue);
    }); */
    
</script>
