<%@ page language="java" contentType="text/html; charset=UTF-8"	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@include file="../includes/header.jsp"%>
	
<div class="row">
	<div class="col-lg-12">
		<h1 class="page-header">Notice</h1>
		<hr class="divider" />
	</div>
	<!-- /.col-lg-12 -->
</div>
<!-- /.row -->

<div class="row">
	<div class="col-lg-12">
		<div class="panel panel-default">
			<div class="panel-heading">
			
				<form id="searchForm" action="/board/list" method="get">
					<select class='flex' name='type'>
						<option value=""
							<c:out value="${pageMaker.cri.type == null?'selected':''}"/>>---</option>
						<option value="T"
							<c:out value="${pageMaker.cri.type eq 'T'?'selected':''}"/>>제목</option>
						<option value="C"
							<c:out value="${pageMaker.cri.type eq 'C'?'selected':''}"/>>내용</option>
						<option value="W"
							<c:out value="${pageMaker.cri.type eq 'W'?'selected':''}"/>>작성자</option>
						<option value="TC"
							<c:out value="${pageMaker.cri.type eq 'TC'?'selected':''}"/>>제목+내용</option>
						<option value="TW"
							<c:out value="${pageMaker.cri.type eq 'TW'?'selected':''}"/>>제목+작성자</option>
						<option value="TCW"
							<c:out value="${pageMaker.cri.type eq 'TCW'?'selected':''}"/>>제목+내용+작성자</option>
					</select> 
					<input class='flex' type="text" name="keyword" value='<c:out value="${pageMaker.cri.keyword}"/>' />
					<input type='hidden' name='pageNum' value='<c:out value="${pageMaker.cri.pageNum}"/>' />
					<input type='hidden' name='amount' value='<c:out value="${pageMaker.cri.amount}"/>' />
					<button class='btn btn-default flex search'>Search</button>
				</form>
			
			<!-- /.panel-heading -->
			<div class="panel-body">
				<table width="100%" class="table table-bordered">
					<!--  table-striped table-hover-->
					<!-- id="dataTables-example" -->
					<thead>
						<tr>
							<th>글번호</th>
							<th>제목</th>
							<th>작성자</th>
							<th>조회수</th>
							<th>등록일</th>
							<th>수정일</th>
						</tr>
					</thead>
					<c:forEach items="${list}" var="board">
						<tr>
							<td><c:out value="${board.bno}" /></td>
							<td>
								<%-- <a href='/board/get?bno=<c:out value="${board.bno}"/>'>
									<c:out value="${board.title}" /></a> --%> 
									<a class='move' href='<c:out value="${board.bno}"/>'>
									<c:out value="${board.title}" /> 
									<b>[<c:out value="${board.replyCnt}" />]</b>
								</a>
							</td>
							<td><c:out value="${board.userid}" /></td>
							<td><c:out value="${board.hit}" /></td>
							<td><fmt:formatDate pattern="yyyy-MM-dd"
									value="${board.regdate}" /></td>
							<td><fmt:formatDate pattern="yyyy-MM-dd"
									value="${board.updateDate}" /></td>
						</tr>
					</c:forEach>
				</table>
				<button id='regBtn' type="button" class="write btn-xs pull-right">글쓰기</button>
			</div>
				<%-- <p>${pageMaker}</p> --%>
				<div class='pull-right'>
					<ul class='pagination'>
						<c:if test="${pageMaker.prev}">
							<li class="paginate_button previous">
							<a href="${pageMaker.startPage -1}">◀ Prev</a></li>
						</c:if>

						<c:forEach var="num" begin="${pageMaker.startPage}"
							end="${pageMaker.endPage}">
							<li class="paginate_button ${pageMaker.cri.pageNum == num?'active':''} ">
								<a href="${num}">${num}</a>
							</li>
						</c:forEach>

						<c:if test="${pageMaker.next}">
							<li class="paginate_button next">
							<a href="${pageMaker.endPage +1}">Next ▶</a></li>
						</c:if>
					</ul>
				</div>
				<!-- Modal추가 -->
				<div id="myModal" class="modal" tabindex="-1" role="dialog">
					<div class="modal-dialog">
						<div class="modal-content">
							<div class="modal-header">
								<h5 class="modal-title" id="myModalLabel">Modal title</h5>
							</div>
							<div class="modal-body">처리가 완료되었습니다.</div>
							<div class="modal-footer">
								<button type="button" class="btn btn-primary"
									data-bs-dismiss="modal">Close</button>
								<!--button type="button" class="btn btn-default" data-dismiss="modal">Close</button-->
								<!-- button type="button" class="btn btn-primary">Save changes</button-->
							</div>
						</div>
					</div>
				</div>
				<form id="actionForm" action="/board/list" method="get">
					<input type='hidden' name='pageNum'	value='${pageMaker.cri.pageNum}'> 
					<input type='hidden' name='amount' value='${pageMaker.cri.amount}'> 
					<input type='hidden' name='type' value='<c:out value="${pageMaker.cri.type}"/>' /> 
					<input type="hidden" name="keyword"	value='<c:out value="${pageMaker.cri.keyword}"/>' />
				</form>
			</div>
			<!-- /end panel-body -->
		</div>
		<!-- /end panel -->
	</div>
	<!-- /.col-lg-12 -->
</div>
<!-- /.row -->
<script type="text/javascript">

	$(document)
			.ready(
					function() {
						var result = '<c:out value="${result}"/>';
						checkModal(result);
						history.replaceState({}, null, null);

						function checkModal(result) {
							if (result === '' || history.state) {
								return;
							}
							if (result === 'success') {
								$(".modal-body").html("정상적으로 처리되었습니다.");
							} else if (parseInt(result) > 0) {
								$(".modal-body").html(
										"게시글 " + parseInt(result)
												+ "번이 등록되었습니다.");
							}
							$("#myModal").modal("show");
						}

						$("#regBtn").on("click", function() {
							self.location = "/board/register";
						});

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
													.append("<input type='hidden' name='bno' value='"
															+ $(this).attr(
																	"href")
															+ "'>");
											actionForm.attr("action",
													"/board/get");
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
</script>
<%@include file="../includes/footer.jsp"%>