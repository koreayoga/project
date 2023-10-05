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

<%@include file="../includes/footer.jsp"%>