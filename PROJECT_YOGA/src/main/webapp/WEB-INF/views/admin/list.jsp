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
				ADMIN PAGE
				<button id='regBtn' type="button" class="btn btn-xs pull-right">Register New Board</button>
			</div>
			
			<!-- /.panel-heading -->
			<div class="panel-body">
				<table width="100%" class="table table-bordered">
					<!--  table-striped table-hover-->
					<!-- id="dataTables-example" -->
					<thead>
						<tr>
							<th>아이디</th>
							<th>이름</th>
							<th>성별</th>
							<th>연락처</th>
							<th>생일</th>
							<th>주소</th>
							<th>이메일</th>

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
		</div> <!-- end panel body -->
		</div> <!-- end -->
		</div>
		</div> <!-- /.row  -->
<%@include file="../includes/footer.jsp"%>