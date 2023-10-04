<%@ page language="java" contentType="text/html; charset=UTF-8"	pageEncoding="UTF-8"%>
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
							<div class="form-group">
								<label>Bno</label> 
								<input class="form-control" name='bno' value='<c:out value="${board.bno}"/>' readonly=readonly>						
							</div>					
							<div class="form-group">
								<label>Title</label> 
								<input class="form-control" name='title' value='<c:out value="${board.title}"/>' readonly=readonly>						
							</div>
							<div class="form-group">
								<label>Text area</label>
								<textarea class="form-control" rows="10" name='content' readonly=readonly><c:out value="${board.content}"/></textarea>
							</div>
							<div class="form-group">
								<label>Writer</label> 
								<input class="form-control" name='writer' value='<c:out value="${board.userid}"/>' readonly="readonly">						
							</div>	
							
							<!-- File Upload -->
							<div class="row">
								<div class="col-lg-12">
									<div class="panel panel-default">
										<div class="panel-heading">Files</div>
										<!-- /.panel-heading -->
										<div class="panel-body">							
											<div class="uploadResult">
												<ul>
												
												</ul>
											</div>
										</div>
									</div>
								</div>
							</div>	

							<!-- 버튼부 -->
							<sec:authentication property="principal" var="pinfo"/>
							<sec:authorize access="isAuthenticated()">
								<c:if test="${pinfo.username eq board.userid}">								
									<button data-oper="modify" class="btn btn-default" onclick="location.href='/board/modify?bno=<c:out value="${board.bno}"/>'">Modify</button>
								</c:if>
							</sec:authorize>
								
							<button data-oper="list" class="btn btn-info" onclick="location.href='/board/list'">List</button>
							
							<!-- 현재 페이지 정보 -->
							<form id='operForm' action="/board/modify" method="get">
								<input type='hidden' id='bno' name='bno' value='<c:out value="${board.bno}"/>'>
								<input type='hidden' name='pageNum' value='<c:out value="${cri.pageNum}"/>'>
								<input type='hidden' name='amount' value='<c:out value="${cri.amount}"/>'>
								<input type='hidden' name='keyword' value='<c:out value="${cri.keyword}"/>'>
								<input type='hidden' name='type' value='<c:out value="${cri.type}"/>'>
							</form>						
					</div>
					<!-- /end panel-body -->
				</div>
				<!-- /end panel -->
			</div>
			<!-- /.col-lg-12 -->
		</div>
		<!-- /.row -->
		
		
			
		<!-- 댓글 -->
		<div class="row">
			<div class="col-lg-12">
				<div class="panel panel-default">
					<div class="panel panel-heading">
						<i class="fa fa-comments fa-fw"></i> Reply
						<sec:authentication property="principal" var="pinfo"/>
						<sec:authorize access="isAuthenticated()">
						<input readonly="readonly"  id="replyer" name= "replyer" value="${pinfo.username}">
						<input type="text" id="replyInput" name="reply">	
							<button id='addReplyBtn' class='btn btn-primary btn-xs pull-right'>New</button>
						
						</sec:authorize>
					</div>					
					<div class="panel-body">
						<ul class="chat">
							<!-- <li class="left clearfix" data-rno='12'>
								<div>
									<div class="header">
										<strong class="primary-font">user00</strong>
										<small class="pull-right text-muted">2023-08-21 16:17</small>
									</div>
									<p>Good job!!</p>
								</div>							
							</li>  -->
						</ul>
					</div>
					<div class = "panel-footer">
						<!-- [수정] 페이징 버튼 ------------------------------------------------------ 구현해야함 -->
					</div>
					<!-- panelfooter 끝 -->
				</div>
			</div>			
		</div>		
      <script type="text/javascript" src="/resources/js1/reply.js"></script>
		
		<script type="text/javascript">
			$(document).ready(function(){		
				var operForm = $("#operForm");
				
				//list 버튼 구현
				$("button[data-oper='list']").on("click",function(e){
					operForm.find("#bno").remove();
					operForm.attr("action", "/board/list")
					operForm.submit();
				});
				
				//modify 버튼 구현
				$("button[data-oper='modify']").on("click",function(e){					
					operForm.attr("action", "/board/modify")
					operForm.submit();
				});
			});
		</script>
		
		<script>
			$(document).ready(function(){
				var bnoValue = '<c:out value = "${board.bno}"/>';
				var replyUL = $(".chat");
				
				showList(1);
				
				//댓글리스트 보기 
				function showList(page){
					console.log("show list -------- "+page);
					replyService.getList({bno:bnoValue, page:page || 1}, function(replyCnt, list){
						console.log("replyCnt-----"+replyCnt);						
						console.log(list);
						
						if(page == -1){
							pageNum = Math.ceil(replyCnt / 10.0);
							showList(pageNum);
							return;							
						}
						
						var str = "";
						
						if(list == null || list.length == 0){
							replyUL.html("");
							return;
						}
						for(var i=0, len=list.length||0; i<len; i++){
							var buttons = '';
							console.log(list[i].replyer + " )" +replyer);
					        if (list[i].replyer === replyer) {
					            buttons += '<button data-rno="' + list[i].rno + '" type="button" class="btn btn-warning modalModBtn">Modify</button>';
					            buttons += '<button id="modalRemoveBtn" data-rno="' + list[i].rno + '" type="button" class="btn btn-danger">Remove</button>';
					        } 
							str += "<li class='left clearfix' data-rno='"+list[i].rno+"'>";							
							str += "	<div><div class='header'><strong class='primary-font'>["+list[i].rno+"] "+list[i].replyer+"</strong>";
							str += "		<small class='pull-right text-muted'>"+replyService.displaytime(list[i].replyDate)+"</small></div>";
							str += "		</div><p class='replyContent'>"+list[i].reply+"</p>";
							str += "<sec:authorize access='isAuthenticated()'>"+buttons;
			    	  	    str +="</sec:authorize>"+"</li>";
							
							
						}
						replyUL.html(str);
						showReplyPage(replyCnt);
					});
				}
				
				var replyer = null;
				<sec:authorize access="isAuthenticated()">								
					replyer = '<sec:authentication property="principal.username"/>';				
				</sec:authorize>
				
				// Ajax Spring security 처리
				var csrfHeaderName = "${_csrf.headerName}";
				var csrfTokenValue = "${_csrf.token}";
				
				// 닫힘버튼 이벤트처리
				$("#modalCloseBtn").on("click", function(e){
					modal.modal('hide');
				});
			
				// 등록버튼 이벤트처리
				$("#addReplyBtn").on("click", function(e){
					var reply = {
							reply : $("#replyInput").val(),
							replyer :$("#replyer").val(),
							bno : bnoValue
					};
					
					replyService.add(reply, function(result){
						alert(result);
						$("#replyInput").val("");
						showList(-1); // 최종적으로 댓글이 달린 리스트 마지막 페이지로 이동
					
					});		
					
				});	
				
				// Ajax Spring Security Header
				$(document).ajaxSend(function(e, xhr, options){
					xhr.setRequestHeader(csrfHeaderName, csrfTokenValue);
				});

				
				// 댓글 수정 버튼 클릭 시
			    $(".chat").on("click", ".modalModBtn", function(e) {
			        e.preventDefault();
			        var replyContent = $(this).siblings(".replyContent");
			        var rno = $(this).data("rno");
			        var originalReply = replyContent.text();
			        console.log(originalReply);
			        replyContent.html("<input type='text' class='form-control replyInput' value='" + originalReply + "' /><button id='modalRegisterBtn' type='button' class='btn btn-primary'>Register</button>");

			        // 등록 버튼 클릭 시 수정된 댓글을 서버로 전송
			         $("#modalRegisterBtn").on("click",function(e) {
			        	 //e.preventDefault();
			            var updatedReply = $(this).siblings(".replyInput").val();
			            console.log(updatedReply+" aa"+rno)
			            var reply = {
			                rno: rno,
			                reply: updatedReply,
			                replyer: replyer
			            };
					
				    replyService.update(reply, function(result){
						alert(result);						
						
						showList(pageNum);
					});		
					
			        });			
				});	
				
				//댓글 삭제버튼 이벤트처리
				$(".chat").on("click", "#modalRemoveBtn", function(e){
					var rno = $(this).data("rno");
					console.log("------------------RNO : "+rno);
					console.log("--------------Replyer : "+replyer);
					
					/* 삭제버튼이 안먹음 */
					if(!replyer){
						alert("로그인 후 삭제가 가능합니다.");
						
						return;
					}
					
					var originalReplyer = replyer;
					console.log("------originalReplyer : "+originalReplyer);
					
					if(replyer != originalReplyer){
						alert("본인이 작성한 댓글만 삭제가 가능합니다.");
						
						return;
					}
					
					replyService.remove(rno, originalReplyer, function(result){
						alert(result);						
						
						showList(pageNum);
					});					
				});	
			
		
		<!-- 댓글페이징 기능 구현 -->
		
			var pageNum = 1; // 기본페이지는 1번
			var replyPageFooter = $(".panel-footer") // panel-footer에 태그를 생성하기 위해 변수 선언.
			
			function showReplyPage(replyCnt) {
				var endNum = Math.ceil(pageNum / 10.0) * 10;
				var startNum = endNum - 9;
				
				var prev = startNum != 1;
				var next = false; // 기본값 false.
				
				if(endNum*10 >= replyCnt){
					endNum = Math.ceil(replyCnt / 10.0);
				}
				
				if(endNum*10 < replyCnt){
					next = true;
				}
				
				var str = "<ul class='pagination pull-right'>";
				
				//prev구현
				if(prev){
					str += "<li class='page-item'><a class='page-link' href='"+(startNum-1)+"'>◀Prev</a></li>";
				}
				
				//번호칸 구현
				for(var i=startNum; i<=endNum; i++){
					var active = pageNum == i ? "active" : "";	
					str += "<li class='page-item "+active+"'><a class='page-link' href='"+i+"'>"+i+"</a></li>";					
				}
				
				//next구현
				if(next){
					str += "<li class='page-item'><a class='page-link' href='"+(endNum+1)+"'>Next▶</a></li>";
				}
				
				//str+="</ul>"
				str+="</ul></div>"
				console.log("------"+str);
				$(".panel-footer").html(str);
				
				//페이지 이동 기능 구현
				$(".panel-footer").on("click","li a", function(e){
						e.preventDefault();
						console.log("page click!!!!!!----------")
						var targetPageNum = $(this).attr("href"); // panel-footer(prev/num/next) > href속성
						pageNum = targetPageNum; // pageNum으로 저장
						console.log("target----------"+targetPageNum);
						showList(pageNum);
					});
				}
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
								str += "	<span>"+attach.fileName+"&nbsp;&nbsp;</span>";
								str += "	<img src='/display?fileName="+fileCallPath+"'>";
								str += "</div></li>";	
								
							} else {
								
								str += "<li data-path='"+attach.uploadPath+"' data-uuid='"+attach.uuid+"' data-filename='"+attach.fileName+"' data-type='"+attach.fileType+"'><div>";
								str += "	<span>"+attach.fileName+"&nbsp;&nbsp;</span>";
								str += "	<img src='/resources/img/attach.png'>";
								str += "</div></li>";
								
							}
						});
						$(".uploadResult ul").html(str);
						
					}); //getJSON
				})();// function2
				
				// 파일처리(이미지-원본보기/ 일반-다운로드)
				$(".uploadResult").on("click", "li", function(e){
					console.log("-----------------view image");
					var liObj = $(this);
					
					var path = encodeURIComponent(liObj.data("path")+"/"+liObj.data("uuid")+"_"+liObj.data("filename"));
					
					if(liObj.data("type")){
						showImage(path.replace(new RegExp(/\\/g), "/"));
					} else {
						//다운로드
						self.location = "/download?fileName="+path;
					}
				}); 
				
				function showImage(fileCallPath){
					//alert(fileCallPath);
					$(".bigPictureWrapper").css("display","flex").show();
					$(".bigPicture").html("<img src='/display?fileName="+fileCallPath+"'>").animate({width:'100%',height:'100%'}, 500);	
				}
				
				$(".bigPictureWrapper").on("click", function(e){
					$(".bigPicture").animate({width:'0%',height:'0%'}, 500);					
					setTimeout(function(){
						$('.bigPictureWrapper').hide();
					}, 500);
					
				});
			}); // ready(function1)
		</script>
<%@ include file="../includes/footer.jsp"%>