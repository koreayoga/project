<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@include file="../includes/header.jsp"%>
	
<div class="row">
	<div class="col-lg-12">
		<h1 class="page-header">Notice</h1>
	</div>
	<!-- /.col-lg-12 -->
</div>
<!-- /.row -->

<div class="row">
	<div class="col-lg-12">
		<div class="panel panel-default">
			
			<!-- /.panel-heading -->
			<div class="panel-body">
				<table width="100%" class="table table-bordered">
					<thead>
						<tr>
							<th>아이디</th>
							<th>이름</th>
							<th>성별</th>
							<th>핸드폰</th>
							<th>생일</th>
							<th>주소</th>
							<th>이메일</th>
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
							<td><button onclick="openModal()">수정</button></td>
							<td><button>삭제</button></td>
						</tr>
						
				
					</c:forEach>
				</table>

<%-- 				<p>${pageMaker}</p>
				<div class='pull-right'>
					<ul class='pagination'>
						<c:if test="${pageMaker.prev}">
							<li class="paginate_button previous"><a
								href="${pageMaker.startPage -1}">◀ Prev</a></li>
						</c:if>

						<c:forEach var="num" begin="${pageMaker.startPage}"
							end="${pageMaker.endPage}">
							<li
								class="paginate_button ${pageMaker.cri.pageNum == num?'active':''} ">
								<a href="${num}">${num}</a>
							</li>
						</c:forEach>

						<c:if test="${pageMaker.next}">
							<li class="paginate_button next"><a
								href="${pageMaker.endPage +1}">Next ▶</a></li>
						</c:if>
					</ul>
				</div> --%>
				

			</div>
			<!-- /end panel-body -->
		</div>
		<!-- /end panel -->
	</div>
	<!-- /.col-lg-12 -->
</div>
<!-- /.row -->

<!-- 모달 창 내용 -->
<div id="myModal" class="modal" style="display: none;">
    <div class="modal-content">
        <span class="close" id="closeModalBtn">&times;</span>
        <form id="updateForm">
            <!-- 멤버 정보 입력 폼 -->
            <input type="text" id="userid" name="userid" >
            <input type="text" id="auth" name="auth" placeholder="권한">
            <input type='hidden' name='${_csrf.parameterName}' value='${_csrf.token}'>
            <!-- 기타 필요한 입력 필드 추가 -->
            <button type="button" id="updateBtn">업데이트</button>
        </form>
    </div>
</div>

<!-- ============SCRIPT=====================SCRIPT=========================SCRIPT============================SCRIPT======================= -->	

<script>
// 모달 창 열기 함수
function openModal() {
    var modal = document.getElementById('myModal');
    modal.style.display = 'block';
}

// 모달 창 닫기 함수
function closeModal() {
    var modal = document.getElementById('myModal');
    modal.style.display = 'none';
}

// 모달 닫기 버튼에 이벤트 리스너 추가
var closeModalBtn = document.getElementById('closeModalBtn');
closeModalBtn.addEventListener('click', closeModal);

// 업데이트 버튼 클릭 시 처리
var csrfHeaderName = "<c:out value='${_csrf.headerName}'/>";
var csrfTokenValue = "<c:out value='${_csrf.token}'/>";
var updateBtn = document.getElementById('updateBtn');
updateBtn.addEventListener('click', function() {
    var userid = document.getElementById('userid').value;
    var auth = document.getElementById('auth').value;

    console.log(userid + auth);

    // AJAX 요청
    $.ajax({
        type: 'POST',
        url: '/member/updateAdmin',
        contentType: 'application/json',
        data: { userid: userid, auth: auth },
        success: function(response) {
        	console.log(response)
            // 서버에서의 업데이트 성공 여부에 따라 적절한 처리를 수행
            if (response === 'success') {
                alert('업데이트 성공');
                closeModal();
            } else {
                alert('업데이트 실패');
            }
        },
        error: function() {
            alert('서버와 통신 중 오류 발생');
        }
    });

/* 	$.ajax({
		url : '/uploadAjaxAction',
		processData : false,
		contentType : false,
		data : formData, 
		type : 'POST',
		dataType : 'json',
		beforeSend : function(xhr){
			xhr.setRequestHeader(csrfHeaderName, csrfTokenValue);
		},
		success : function(result){
			console.log(result);	
			showUploadResult(result);
		}
	});	
}); */
    
    
    
    
    
    
    
    
});
    //Ajax Spring Security Header
    $(document).ajaxSend(function(e, xhr, options){
       xhr.setRequestHeader(csrfHeaderName, csrfTokenValue);
    });
</script>


<%@include file="../includes/footer.jsp"%>