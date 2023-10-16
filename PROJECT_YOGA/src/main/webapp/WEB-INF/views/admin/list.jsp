<%@page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@include file="../includes/header.jsp"%>
<!DOCTYPE html>
<html>
<head>
<title>UPDATE INFO</title>
	<meta charset="utf-8" />
	<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />
	<meta name="description" content="" />
	<meta name="author" content="" />
	<!-- Favicon-->
	<link rel="icon" type="image/x-icon" href="../resources/assets/favicon.ico" />
	<!-- Bootstrap Icons-->
	<link href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.5.0/font/bootstrap-icons.css" rel="stylesheet" />
	<!-- Google fonts-->
	<link href="https://fonts.googleapis.com/css2?family=Gaegu:wght@300;400&family=Jua&family=Orbit&display=swap" rel="stylesheet">
	<!-- SimpleLightbox plugin CSS-->
	<link href="https://cdnjs.cloudflare.com/ajax/libs/SimpleLightbox/2.1.0/simpleLightbox.min.css" rel="stylesheet" />
	<!-- Core theme CSS -->
	<link href="../resources/css/styles.css" rel="stylesheet" />
	<link href="../resources/css/pageStyle.css" type="text/css" rel="stylesheet" />
	<link href="../resources/css/navstyletest.css" type="text/css" rel="stylesheet" />

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

.pull-right {
    font-size: 25px; 
    font-family: sans-serif;
}

.table {
	margin-bottom: 0;
	}

</style>


</head>
<body>	
<div class="row">
    <div class="col-lg-12">
        <h1 class="page-header">Admin</h1>
    </div>
</div>


<!---------- List -->
<div class="row">
    <div class="col-lg-12">
        <div class="panel panel-default">
            <div class="panel-body">
                <table width="100%" class="table table-bordered">
                    <thead>
                        <tr>
                            <th style="width: 8%">아이디</th>
                            <th style="width: 7%">이름</th>
                            <th style="width: 5%">성별</th>
                            <th style="width: 10%">핸드폰</th>
                            <th style="width: 10%">생일</th>
                            <th style="width: 25%">주소</th>
                            <th style="width: 20%">이메일</th>
                            <th style="width: 5%">권한</th>
                            <th style="width: 5%">수정</th>
                            <th style="width: 5%">삭제</th>
                        </tr>
                    </thead>
                    <c:forEach items="${list}" var="member">
                        <tr>
                            <td><c:out value="${member.userid}" /></td>
                            <td><c:out value="${member.name}" /></td>
                            <td><c:out value="${member.gender}" /></td>
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


<!----------- search -->         
<form id="searchForm" action="/admin/list" method="get">
<select name='type'>
<option value=""
	<c:out value="${pageMaker.cri.type == null?'selected':''}"/>>---</option>
	<option value="A"
	<c:out value="${pageMaker.cri.type eq 'A'?'selected':''}"/>>회원권한</option>
	<option value="U"
	<c:out value="${pageMaker.cri.type eq 'U'?'selected':''}"/>>회원아이디</option>
	<option value="N"
	<c:out value="${pageMaker.cri.type eq 'N'?'selected':''}"/>>회원이름</option>
</select> <input type="text" name="keyword" value='<c:out value="${pageMaker.cri.keyword.toString()}"/>' />
		  <input type="hidden" name="type" value='<c:out value="${pageMaker.cri.type}"/>' />
		  <input type='hidden' name='pageNum' value='<c:out value="${pageMaker.cri.pageNum}"/>' />
		  <input type='hidden' name='amount' value='<c:out value="${pageMaker.cri.amount}"/>' />
<button class='btn btn-default'>Search</button>
</form>
               
<!----------- paging -->
<div class='pull-right'>
	<ul class='pagination'>
		<c:if test="${pageMaker.prev}">
			<li class="paginate_button previous">
			<a href="${pageMaker.startPage -1}">◀ Prev</a> </li>
		</c:if>

		<c:forEach var="num" begin="${pageMaker.startPage}" end="${pageMaker.endPage}">
			<li class="paginate_button ${pageMaker.cri.pageNum == num?'active':''} ">
			<a href="${num}">${num}</a>&nbsp;</li>
		</c:forEach>
						
		<c:if test="${pageMaker.next}">
			<li class="paginate_button next">
			<a href="${pageMaker.endPage +1}">Next ▶</a></li>
		</c:if>
	</ul>
</div>
 
 <form id="actionForm" action="/admin/list" method="get">
	<input type='hidden' name='pageNum'	value='${pageMaker.cri.pageNum}'> 
	<input type='hidden' name='amount' value='${pageMaker.cri.amount}'> 
	<input type='hidden' name='type' value='<c:out value="${pageMaker.cri.type}"/>' /> 
	<input type="hidden" name="keyword"	value='<c:out value="${pageMaker.cri.keyword}"/>' />
</form>
 
            </div>
        </div>
    </div>
</div>



<!---------- Modal -->
<div id="myModal" class="modal" style="display: none;">
	<div class="modal-content">
		<span class="close" id="closeModalBtn">&times;</span>
		<form role="form" name="updateForm" method="post" action="/admin/updateAdmin">
			<p>변경할 권한을 숫자로 작성해 주세요</p>
			<input type="text" id="userid" name="userid">
			<input type="text" id="auth" name="auth" placeholder="권한"> 
			<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}">		
			<button id="updateAdmin" data-oper="updateAdmin">업데이트</button>
		</form>
	</div>
</div>

<div id="myModal2" class="modal" style="display: none;">
    <div class="modal-content">
        <span class="close" id="closeModalBtn2">&times;</span>  
        <form role="form2" name="deleteForm" method="post" action="/admin/deleteAdmin">	
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

    $("#closeModalBtn2").click(function () {
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
   

//pageForm
$(document).ready(function () {
var actionForm = $("#actionForm");
$(".paginate_button a").on(
		"click",
		function(e) {
			e.preventDefault();
			console.log('click');
			actionForm.find("input[name='pageNum']")
					.val($(this).attr("href"));
			actionForm.submit();
		});
		
$(".move").on("click", function(e) {
	e.preventDefault();
	actionForm
			.append("<input type='hidden' name='userid' value='"
					+ $(this).attr(
							"href")
					+ "'>");
	actionForm.attr("action",
			"/member/list");
	actionForm.submit();
});

var searchForm = $("#searchForm");
$("#searchForm button").on(
		"click",
		function(e) {
			if (!searchForm.find("option:selected")
					.val()) {
				alert("검색종류를 선택하세요");
				return false;
			}
			if (!searchForm.find(
					"input[name='keyword']").val()) {
				alert("키워드를 입력하세요");
				return false;
			}
			searchForm.find("input[name='pageNum']")
					.val("1");
			e.preventDefault();

			searchForm.submit();
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