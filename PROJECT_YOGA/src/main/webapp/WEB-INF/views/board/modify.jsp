<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="sec"%>

<%@ include file="../includes/header.jsp"%>
<div class="bigPictureWrapper">
	<div class="bigPicture">
	</div>
</div>
<style>
	.uploadResult{
		width : 100%;
		background-color: white;/* rgba(100,100,100,0.1); */	
	}
	
	.uploadResult ul{
		display: flex;
		flex-flow: row;
		justify-content: center;
		align-items: center;
	}
	
	.uploadResult ul li{
		list-style: none;
		padding: 10px;				
	}
	
	.uploadResult ul li img{
		width: 100px;
	}
	
	.bigPictureWrapper{
		position: absolute;
		display: none;
		justify-content: center;
		align-items: center;
		top: 0%;
		width: 100%;
		height: 100%;
		background-color: white;
		z-index: 100;
		background: rgba(255,255,255,0.01); 
	}
	
	.bigPicture{
		position: relative;
		display: flex;
		justify-content: center;
		align-items: center; 
	}
	
	.bigPicture img{
		width: 600px;
	}
</style>
<div class="row">
	<div class="col-lg-12">
		<h1 class="page-header">Board Register</h1>
	</div>
	<!-- /.col-lg-12 -->
</div>
<!-- /.row -->
<div class="row">
	<div class="col-lg-12">
		<div class="panel panel-default">
			<div class="panel-heading">Board Read Page</div>
			<!-- /.panel-heading -->
			<div class="panel-body">
				<!-- <form role="form" action="" method="post"> -->
				<form role="form" action="/board/modify" method="post">				
					<input type='hidden' name='${_csrf.parameterName}' value='${_csrf.token}'>
					<input type='hidden' name='pageNum' value='<c:out value="${cri.pageNum}"/>'>
					<input type='hidden' name='amount' value='<c:out value="${cri.amount}"/>'>
					<input type='hidden' name='keyword' value='<c:out value="${cri.keyword}"/>'>
					<input type='hidden' name='type' value='<c:out value="${cri.type}"/>'>
					<div class="form-group">
						<label>Bno</label> <input class="form-control" name='bno' value='<c:out value="${board.bno}"/>' readonly=readonly>
					</div>
					<div class="form-group">
						<label>Title</label> <input class="form-control" name='title' value='<c:out value="${board.title}"/>'>
					</div>
					<div class="form-group">
						<label>Text area</label>
						<textarea class="form-control" rows="10" name='content'>
							<c:out value="${board.content}" />
						</textarea>
					</div>
					<div class="form-group">
						<label>Writer</label> <input class="form-control" name='userid'	value='<c:out value="${board.userid}"/>' readonly="readonly">
					</div>
					
					<!-- File Upload -->
					<div class="row">
						<div class="col-lg-12">
							<div class="panel panel-default">
								<div class="panel-heading">Files</div>
								<!-- /.panel-heading -->
								<div class="panel-body">
									<div class="form-group uploadDiv">
										<input type="file" name='uploadFile' multiple>
									</div>							
									<div class="uploadResult">
										<ul>
										
										</ul>
									</div>
								</div>
							</div>
						</div>
					</div>	
							
					<!-- button -->
					<sec:authentication property="principal" var="pinfo"/>
					<sec:authorize access="isAuthenticated()">
						<c:if test="${pinfo.username eq board.userid || pinfo.username == 'admin'}">						
							<button data-oper="modify" class="btn btn-default">Modify</button>						
							<button data-oper="remove" class="btn btn-danger">Remove</button>
						</c:if>
					</sec:authorize>
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
<script type="text/javascript">
	$(document).ready(function(){
		var formObj = $("form");
		
		var regex = new RegExp("(.*?)\.(exe|sh|zip|alz)$");
		var maxSize = 5242880; // 5MB
		var cloneObj = $(".uploadDiv").clone(); // 클론		
		
		//파일 크기/확장자 제한
		function checkExtension(fileName, fileSize){
			// 파일사이즈가 5MB이상일 때 제한
			if(fileSize >= maxSize){
				alert("파일 사이즈 초과");
				return false;
			}
			// 파일확장자가 업로드 지원이 되지 않을 때 제한
			if(regex.test(fileName)){
				alert("해당종류의 파일은 업로드할 수 없습니다.");
				return false;
			}				
			return true;
		}
		
		// Ajax Spring security 처리
		var csrfHeaderName = "${_csrf.headerName}";
		var csrfTokenValue = "${_csrf.token}";
		
		// 등록처리에 대한 부분
		$("input[type='file']").change(function(e){
			var formData = new FormData();
			var inputFile = $("input[name='uploadFile']");
			var files = inputFile[0].files;
								
			for(var i=0; i<files.length; i++){
				//업로드 제한 체크
				if(!checkExtension(files[i].name, files[i].size)){
					$(".uploadDiv").html(cloneObj.html()); // 제한에 걸릴 시, 초기상태("선택 파일 없음")로 보여지기 위해 초기화면을 clone으로 복사하여 붙여넣기함.
					return false;
				}	
				// 파일을 formData에 추가
				formData.append("uploadFile", files[i]);
			}
			
			$.ajax({
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
		});
		
		// 업로드 결과에 대한 구현
		function showUploadResult(uploadResultArr){
			if(!uploadResultArr || uploadResultArr.length == 0){ return; }
			
			var uploadUL = $(".uploadResult ul");
			
			var str = "";
			
			$(uploadResultArr).each(function(i, obj){
				if(obj.image){
					
					var fileCallPath = encodeURIComponent(obj.uploadPath+"/thumbnail_"+obj.uuid+"_"+obj.fileName);						
					
					str += "<li data-path='"+obj.uploadPath+"' data-uuid='"+obj.uuid+"' data-filename='"+obj.fileName+"' data-type='"+obj.image+"'><div>";	
					str += "	<span>"+obj.fileName+"&nbsp;&nbsp;</span>";
					str += "	<button type='button' data-file=\'"+fileCallPath+"\' data-type='image' class='btn btn-warning btn-circle'><i class='fa fa-times'></i></button><br>";
					str += "	<img src='/display?fileName="+fileCallPath+"'>";
					str += "</div></li>";
					
				} else {
					
					var fileCallPath = encodeURIComponent(obj.uploadPath+"/"+obj.uuid+"_"+obj.fileName);
					var fileLink = fileCallPath.replace(new RegExp(/\\/g), "/");
											
					str += "<li data-path='"+obj.uploadPath+"' data-uuid='"+obj.uuid+"' data-filename='"+obj.fileName+"' data-type='"+obj.image+"'><div>"; // image부분????	
					str += "	<span>"+obj.fileName+"&nbsp;&nbsp;</span>";
					str += "	<button type='button' data-file=\'"+fileCallPath+"\' data-type='file' class='btn btn-warning btn-circle'><i class='fa fa-times'></i></button><br>";
					str += "	<img src='/resources/img/attach.png'>";
					str += "</div></li>";
				}					
			}); 
			
			uploadUL.append(str);
		}
		
		// 버튼클릭 처리
		$('button').on("click", function(e) {
			e.preventDefault();
			var operation = $(this).data("oper");
			console.log(operation);
			
			if(operation === "remove"){
				formObj.attr("action","/board/remove")	
			} else if(operation === "list"){
				/* self.location = "/board/list";
				return; */
				formObj.attr("action", "/board/list").attr("method", "get");
				var pageNumTag = $("input[name='pageNum']").clone();
				var amountTag = $("input[name='amount']").clone();
				var keywordTag = $("input[name='keyword']").clone();
				var typeTag = $("input[name='type']").clone();
				
				formObj.empty();
				
				formObj.append(pageNumTag);
				formObj.append(amountTag);
				formObj.append(keywordTag);
				formObj.append(typeTag);
			} else if(operation === 'modify') {
				console.log("submit clicked");
				//formObj.attr("action", "/board/modify") // ???????
				var str = "";
				$(".uploadResult ul li").each(function(i, obj){
					var jobj = $(obj);
					console.dir(jobj);
					
					str += "<input type='hidden' name='attachList["+i+"].fileName' value='"+jobj.data("filename")+"'>";
					str += "<input type='hidden' name='attachList["+i+"].uuid' value='"+jobj.data("uuid")+"'>";
					str += "<input type='hidden' name='attachList["+i+"].uploadPath' value='"+jobj.data("path")+"'>";
					str += "<input type='hidden' name='attachList["+i+"].fileType' value='"+jobj.data("type")+"'>";						
				});	
				formObj.append(str);
				console.log(str);
				formObj.attr("action", "/board/modify").attr("method", "post");
			}			
			formObj.submit();			
		});
		
		// 화면에서의 삭제처리
		$(".uploadResult").on("click", "button", function(e){
			console.log("-----delete file");
			if(confirm("Remove this file?")){			
				var targetLi = $(this).closest("li");
				targetLi.remove();
			}
		});
		
		
	});
	
	
</script>

<script>
	$(document).ready(function(){
		(function(){
			var bno = '<c:out value = "${board.bno}"/>';
			$.getJSON("/board/getAttachList", {bno:bno}, function(arr){
				console.log(arr);
				
				var str = "";
				$(arr).each(function(i, attach){
					//image type
					if(attach.fileType){
						var fileCallPath = encodeURIComponent(attach.uploadPath+"/thumbnail_"+attach.uuid+"_"+attach.fileName);						
						
						str += "<li data-path='"+attach.uploadPath+"' data-uuid='"+attach.uuid+"' data-filename='"+attach.fileName+"' data-type='"+attach.fileType+"'><div>";
						str += "	<button type='button' data-file=\'"+fileCallPath+"\' data-type='image' class='btn btn-warning btn-circle'><i class='fa fa-times'></i></button><br>";
						str += "	<span>"+attach.fileName+"&nbsp;&nbsp;</span>";
						str += "	<img src='/display?fileName="+fileCallPath+"'>";
						str += "</div></li>";	
						
					} else {
						
						str += "<li data-path='"+attach.uploadPath+"' data-uuid='"+attach.uuid+"' data-filename='"+attach.fileName+"' data-type='"+attach.fileType+"'><div>";
						str += "	<button type='button' data-file=\'"+fileCallPath+"\' data-type='file' class='btn btn-warning btn-circle'><i class='fa fa-times'></i></button><br>";
						str += "	<span>"+attach.fileName+"&nbsp;&nbsp;</span>";
						str += "	<img src='/resources/img/attach.png'>";
						str += "</div></li>";
						
					}
				});
				$(".uploadResult ul").html(str);
				
			}); //getJSON
		})();// function2
		
		
	});
</script>
		
<%@ include file="../includes/footer.jsp"%>