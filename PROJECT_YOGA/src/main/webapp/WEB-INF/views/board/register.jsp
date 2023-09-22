<%@ page language="java" contentType="text/html; charset=UTF-8"	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="sec"%>

<%@ include file="../includes/header.jsp"%>

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
					<div class="panel-heading">Board Register</div>
					<!-- /.panel-heading -->
					<div class="panel-body">
						<form role="form" action="/board/register" method="post">
							<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}">
							<div class="form-group">
								<label>Title</label> 
								<input class="form-control" name="title">						
							</div>					
							<div class="form-group">
								<label>Text area</label>
								<textarea class="form-control" rows="10" name="content"></textarea>
							</div>
							<div class="form-group">
								<label>Writer</label> 
								<input class="form-control" name="userid" value='<sec:authentication property="principal.username"/>' readonly="readonly">						
							</div>		
							
							<!-- File Upload -->
							<div class="row">
								<div class="col-lg-12">
									<div class="panel panel-default">
										<div class="panel-heading">File Attach</div>
										<!-- /.panel-heading -->
										<div class="panel-body list">
												<div class="form-group uploadDiv">
													<input type="file" name="uploadFile" multiple>
												</div>
												<div class="uploadResult">
													<ul>
													
													</ul>
												</div>
										</div>
									</div>
								</div>
							</div>

							<!-- Button -->
							<button type="submit" class="btn btn-default">Submit Button</button>
							<button type="reset" class="btn btn-default">Reset Button</button>
							
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
			//빈칸 경고창			
			function checkBlank(){
			 	var title = $("input[name='title']").val();
			 	var content = $("textarea[name='content']").val();
			 	var writer = $("input[name='userid']").val();
			 	
				if(title === ""){						
					alert("제목을 작성해주세요");
					return false;
				}
			 	
				if(content  === ""){						
					alert("내용을 작성해주세요");
					return false;
				}
				
				if(writer === "" ){						
					alert("작성자를 기입해주세요");
					return false;
				}		
				//현재페이지에 머물게 하기 ????
				//window.history.back();    // 이전페이지로 이동
				//window.location.reload(); // 새로고침
			}
		
			$(document).ready(function(e){				
				var formObj = $("form[role='form']");
				
				//등록버튼 처리
				$("button[type='submit']").on("click", function(e){
					e.preventDefault();
					console.log("Clicked!!");
					
					var str = "";
					
					$(".uploadResult ul li").each(function(i, obj){
						var jobj = $(obj);
						console.log(jobj);
						
						str += "<input type='hidden' name='attachList["+i+"].fileName' value='"+jobj.data("filename")+"'>";
						str += "<input type='hidden' name='attachList["+i+"].uuid' value='"+jobj.data("uuid")+"'>";
						str += "<input type='hidden' name='attachList["+i+"].uploadPath' value='"+jobj.data("path")+"'>";
						str += "<input type='hidden' name='attachList["+i+"].fileType' value='"+jobj.data("type")+"'>";						
					});				
								
					formObj.append(str).submit();
					checkBlank(); // 빈칸체크
				});				
				
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
						beforeSend : function(xhr){
							xhr.setRequestHeader(csrfHeaderName, csrfTokenValue);
						},
						data : formData, 
						type : 'POST',
						dataType : 'json', 
						success : function(result){
							console.log(result);	
							showUploadResult(result);
						}
					});	
				});				
				
				// 'x'표시에 대한 이벤트 처리
				$(".uploadResult").on("click", "button", function(e){
					var targetFile = $(this).data("file");
					var type = $(this).data("type");
					var targetLi = $(this).closest("li");
					
					console.log("-----"+ targetFile);
					
					$.ajax({
						url : '/deleteFile',					
						data : {fileName:targetFile, type:type},
						beforeSend : function(xhr){
							xhr.setRequestHeader(csrfHeaderName, csrfTokenValue);
						},
						dataType : 'text', 
						type : 'POST',
						success : function(result){						
							alert(result);
							targetLi.remove();
						}
					});				
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
		</script>


<%@ include file="../includes/footer.jsp"%>