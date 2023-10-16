<%@page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@include file="../includes/header.jsp"%>
<!DOCTYPE html>
<html>
<head>
<title>UPDATE INFO</title>

<style>
.modal {
  display: none;
  position: fixed;
  top: 0;
  left: 0;
  width: 100%;
  height: 100%;
  background-color: rgba(0, 0, 0, 0.5);
}

.modal-content {
  position: absolute;
  top: 50%;
  left: 50%;
  transform: translate(-50%, -50%);
  width: 300px; /* 모달 창의 폭을 조정하세요 */
  height: 300px; /* 모달 창의 높이를 조정하세요 */
  background-color: #fff;
  padding: 20px;
  box-shadow: 0 0 10px rgba(0, 0, 0, 0.5);
}

/* 닫기 버튼 스타일 */
.close {
  position: absolute;
  top: 10px;
  right: 10px;
  font-size: 24px;
  cursor: pointer;
}

.modal p {
  text-align: center;
}
</style>


</head>
<body>	
	
<div class="row">
    <div class="col-lg-12">
        <h1 class="page-header">Member</h1>
        <hr class="divider" />
    </div>
</div>

<div class="row">
    <div class="col-lg-12">
        <div class="panel panel-default">
            <div class="panel-body">
                <table class="table table-bordered size">
                    <thead>
                        <tr class="information">
                            <th class="middle">아이디</th>
                            <th class="middle">이름</th>
                            <th class="middle">성별</th>
                            <th class="long">핸드폰</th>
                            <th class="long">생일</th>
                            <th class="long">주소</th>
                            <th class="long">이메일</th>
                            <th class="short">권한</th>
                            <th class="short">수정</th>
                            <th class="short">삭제</th>
                        </tr>
                    </thead>
                    <c:forEach items="${list}" var="member">
                        <tr class="information">
                            <td class="middle"><c:out value="${member.userid}" /></td>
                            <td class="middle"><c:out value="${member.name}" /></td>
                            <td class="middle"><c:out value="${member.gender}" /></td>
                            <td class="long"><c:out value="${member.phone}" /></td>
                            <td class="long"><c:out value="${member.birth}" /></td>
                            <td class="long"><c:out value="${member.address}" /></td>
                            <td class="long"><c:out value="${member.email}" /></td>
                            <td class="short"><c:out value="${member.auth}" /></td>
                            <td class="short">
                                <button class="edit-btn" data-userid="${member.userid}">수정</button>
                            </td>
                            <td class="short">
                                <button class="delete-btn" data-userid="${member.userid}">삭제</button>
                            </td>
                        </tr>
                    </c:forEach>
                </table>
            </div>
        </div>
    </div>
</div>



<!-- Modal -->
<div id="myModal" class="modal" style="display: none;">
	<div class="modal-content">
		<span class="close" id="closeModalBtn">&times;</span>
		<form role="form" name="updateForm" method="post" action="/member/updateAdmin">
			<p>변경할 권한을 숫자로 작성해 주세요</p>
			<input type="text" id="userid" name="userid">
			<input type="text" id="auth" name="auth" placeholder="권한"> 
			<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}">		
			<button id="updateAdmin" data-oper="updateAdmin">업데이트</button>
		</form>
	</div>
</div>


<!-- Modal -->
<div id="myModal2" class="modal" style="display: none;">
    <div class="modal-content">
        <span class="close" id="closeModalBtn">&times;</span>  
        <form role="form2" name="deleteForm" method="post" action="/member/deleteAdmin">	
            <p>삭제할 회원의 ID를 다시 입력해주세요</p>
            <input type="text" id="userid" name="userid">
            <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}">
            <button id="deleteAdmin" data-oper="deleteAdmin">삭제</button>
        </form>
    </div>
</div>

<!-- ============SCRIPT=====================SCRIPT=========================SCRIPT============================SCRIPT======================= -->			
<script>


//UPDATE BUTTON.
$(document).ready(function () {
	$(".edit-btn").click(function () {
      var userid = $(this).data("userid");
        $("#userid").val(userid);
        $("#myModal").css("display", "block");
     });

    $("#closeModalBtn").click(function () {
        $("#myModal").css("display", "none");
     });
		var userid = $("#userid").val();
		var auth = $("#auth").val();
		var member = {
		userid: userid,
		auth: auth
      	};
		
	var formObj = $("form[role='form']");
	  $("button[id='updateAdmin']").on("click", function(e){
	  formObj.submit();
	  	var result = '<c:out value="${result}"/>';
		checkAlert(result);
		function checkAlert(result) {
			if (result === '' || history.state) {
				return;
			}
			if (result === 'success') {
				alert("회원의 등급이 정삭적으로 변경되었습니다.");
			} else {
			    alert("회원의 등급 변경이 실패되었습니다. <br> 다시 시도해주십시오");
			 }
		}
  
	});
});

//DELETE BUTTON.
$(document).ready(function () {
	$(".delete-btn").click(function () {
      var userid = $(this).data("userid");
        $("#userid").val(userid);
        $("#myModal2").css("display", "block");
     });

    $("#closeModalBtn").click(function () {
        $("#myModal2").css("display", "none");
     });
		var userid = $("#userid").val();
		var member = {
		userid: userid,
      	};
		
	var formObj = $("form[role='form2']");
	  $("button[id='deleteAdmin']").on("click", function(e){
	  formObj.submit();
	  	var result = '<c:out value="${result}"/>';
		checkAlert(result);
		function checkAlert(result) {
			if (result === '' || history.state) {
				return;
			}
			if (result === 'success') {
				alert("회원의 삭제가 정삭적으로 변경되었습니다.");
			} else {
			    alert("회원의 삭제가 실패되었습니다. <br> 다시 시도해주십시오");
			 }
		}
	});
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
</body>
</html>

<%@include file="../includes/footer.jsp"%>