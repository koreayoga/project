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
			<div class="panel-heading">
				Board List Page
				<button id='regBtn' type="button" class="btn btn-xs pull-right">Register New Board</button>
			</div>
			
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
							<td><button onclick="openModal()">수정</button></td>
							<td><button>삭제</button></td>
						</tr>
						
						<a class='move' href='<c:out value="${member.phone}"/>'>
							</a>
					</c:forEach>
				</table>

				<%-- <p>${pageMaker}</p> --%>
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
				</div>
				
				<form id="actionForm" action="/board/list" method="get">
					<input type='hidden' name='pageNum'
						value='${pageMaker.cri.pageNum}'> <input type='hidden'
						name='amount' value='${pageMaker.cri.amount}'> <input
						type='hidden' name='type'
						value='<c:out value="${pageMaker.cri.type}"/>' /> <input
						type="hidden" name="keyword"
						value='<c:out value="${pageMaker.cri.keyword}"/>' />
				</form>
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
            <input type="text" id="name" name="name" placeholder="이름">
            <input type="text" id="email" name="email" placeholder="이메일">
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
var updateBtn = document.getElementById('updateBtn');
updateBtn.addEventListener('click', function() {
    var name = document.getElementById('name').value;
    var email = document.getElementById('email').value;
console.log(name + email)

    $.ajax({
        type: 'POST',
        url: '/member/update',
        data: { name: name, email: email },
        success: function(response) {
            // 서버에서의 업데이트 성공 여부에 따라 적절한 처리를 수행
            if (response.result === 'success') {
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
});
</script>
				


<%@include file="../includes/footer.jsp"%>