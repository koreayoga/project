<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>

<%@ include file="../includes/header.jsp"%>
<div class="bigPictureWrapper">
	<div class="bigPicture"></div>
</div>
<style>
.uploadResult {width: 100%; background-color: white; /* rgba(100,100,100,0.1); */}
.uploadResult ul {display: flex; flex-flow: row; justify-content: center; align-items: center;}
.uploadResult ul li {list-style: none; padding: 10px;}
.uploadResult ul li img {width: 100px;}
.bigPictureWrapper {position: absolute; display: none; justify-content: center; align-items: center;
					top: 0%; width: 100%; height: 100%; background-color: white; z-index: 100; background: rgba(255, 255, 255, 0.01);}
.bigPicture {position: relative; display: flex; justify-content: center; align-items: center;}
.bigPicture img {width: 600px;}
</style>

<div class="row">
	<div class="col-lg-12">
		<h1 class="page-header">Modify</h1>
	</div>
	<!-- /.col-lg-12 -->
</div>
<!-- /.row -->
<div class="row">
	<div class="col-lg-12">
		<div class="panel panel-default">
			<div class="panel-heading">Modify Page</div>
			<!-- /.panel-heading -->
			<div class="panel-body">
				<form role="form" action="/admin/ccontext" method="post">
					<div class="form-group">
						<label>강의명</label> 
						<input class="form-control" name='cname' value='<c:out value="${course.cname}"/>'>
					</div>
					<div class="form-group">
						<label>강사</label> 
						<select class="form-control" name='cteacher'>
							<option value="김**" ${course.cteacher == '김**' ? 'selected' : ''}>김**</option>
							<option value="정**" ${course.cteacher == '정**' ? 'selected' : ''}>정**</option>
							<option value="유**" ${course.cteacher == '유**' ? 'selected' : ''}>유**</option>
							<option value="이**" ${course.cteacher == '이**' ? 'selected' : ''}>이**</option>
							<option value="라**" ${course.cteacher == '라**' ? 'selected' : ''}>라**</option>
							<option value="박**" ${course.cteacher == '박**' ? 'selected' : ''}>박**</option>
						</select> 
					</div>
					<div class="form-group">
						<label>인원</label> <input class="form-control" name='camount'
							value='<c:out value="${course.camount}"/>'>
					</div>
					<div class="form-group">
						<label>내용</label>
						<textarea class="form-control" rows="10" name='content'>
							<c:out value="${course.ccontext}" />
						</textarea>
					</div>

					<!-- button -->
					<button data-oper="modify" class="btn btn-default">Modify</button>
					<button data-oper="list" class="btn btn-info">List</button>
				</form>
			</div>
			<!-- /end panel-body -->
		</div>
		<!-- /end panel -->
	</div>
	<!-- /.col-lg-12 -->
</div>
<!-- /.row -->

<script>
	$(document).ready(function(){
		var formObj = $("form");
		
		$('button').on("click", function(e) {
			e.preventDefault();
			var operation = $(this).data("oper");
	
			if (operation === "list") {
				formObj.attr("action", "/admin/course").attr("method", "get");
				formObj.empty();
			}
			formObj.submit();
		});
	});
</script>

<%@ include file="../includes/footer.jsp"%>