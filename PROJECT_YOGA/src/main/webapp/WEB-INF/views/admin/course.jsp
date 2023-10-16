<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@include file="../includes/header.jsp"%>

<div class="row">
	<div class="col-lg-12">
		<h1 class="page-header">Course</h1>
		<hr class="divider" />
	</div>
	<!-- /.col-lg-12 -->
</div>
<!-- /.row -->

<div class="row">
	<div class="col-lg-12">
		<div class="panel panel-default">
			<div class="panel-heading">

				<!-- /.panel-heading -->
				<div class="panel-body">
					<table width="100%" class="table table-bordered">
						<!--  table-striped table-hover-->
						<!-- id="dataTables-example" -->
						<thead>
							<tr>
								<th>강의코드</th>
								<th>강의명</th>
								<th>강사명</th>
								<th>강의실</th>
								<th>강의시간</th>
								<th>제한인원</th>
								<th>내용보기</th>
							</tr>
						</thead>
						<c:forEach items="${courseList}" var="course">
							<tr>
								<td><c:out value="${course.ccode}" /></td>
								<td><c:out value="${course.cname}" /></td>
								<td><c:out value="${course.cteacher}" /></td>
								<td><c:out value="${course.croom}" /></td>
								<td><c:out value="${course.ctime}" /></td>
								<td><c:out value="${course.camount}" /></td>
								<td><a
									href='ccontext?ccode=<c:out value="${course.ccode}"/>'>내용보기</a></td>
							</tr>
						</c:forEach>
					</table>
				</div>
				<!-- end panel body -->
			</div>
			<!-- end -->
		</div>
	</div>
	<!-- /.row  -->
</div>
<%@include file="../includes/footer.jsp"%>