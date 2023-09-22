<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta charset="UTF-8">
<style type="text/css">
	.uploadResult{
		width : 100%;
		background-color: rgba(100,100,100,0.1);	
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
		background: rgba(255,255,255,0.5); 
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
<script src="https://code.jquery.com/jquery-3.7.0.min.js" integrity="sha256-2Pmvv0kuTBOenSvLm6bvfBSSHrUJ+3A7x6P5Ebd07/g=" crossorigin="anonymous"></script>
<title>Insert title here</title>
</head>
<body>
	<h1>Upload with Ajax</h1>
	<span class="uploadDiv"> <input type="file" name='uploadFile' multiple>	</span>
	&nbsp;&nbsp;&nbsp;	
	<button id="uploadBtn">Upload</button>	
	<p/><p/>
	<div class="uploadResult">
		<ul>
		
		</ul>
	</div>
	<div class='bigPictureWrapper'>
		<div class='bigPicture'>
		</div>
	</div>
	<script>
		//원본파일 보여주기 기능
		function showImage(fileCallPath){
			//alert(fileCallPath);
			$(".bigPictureWrapper").css("display", "flex").show();
			$(".bigPicture").html("<img src='/display?fileName="+encodeURI(fileCallPath)+"'>").animate({width:"100%",height:"100%"}, 1000);
		}
		
		$(document).ready(function(){
			var regex = new RegExp("(.*?)\.(exe|sh|zip|alz)$");
			var maxSize = 5242880; // 5MB
			var cloneObj = $(".uploadDiv").clone();
			var uploadResult = $(".uploadResult ul");
			
			//upload 파일의 제한
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
						
			//upload된 파일들의 목록 출력 구현
			function showUploadedFile(uploadResultArr){
				var str = "";
				$(uploadResultArr).each(function(i, obj){
					if(!obj.image){ // img타입이 아니라면,
						var fileCallPath = encodeURIComponent(obj.uploadPath+"/"+obj.uuid+"_"+obj.fileName);
						var fileLink = fileCallPath.replace(new RegExp(/\\/g), "/");
						str += "<li><div><a href='/download?fileName="+fileCallPath+"'><img src='/resources/img/attach.png'></a>"+ obj.fileName +"<span data-file=\'"+fileCallPath+"\' data-type='file'> X </span></div></li>";
					} else { // img타입이라면, 
						//str += "<li>"+ obj.fileName +"</li><p/>";
						var fileCallPath = encodeURIComponent(obj.uploadPath+"/thumbnail_"+obj.uuid+"_"+obj.fileName);
						var originPath = obj.uploadPath+"\\"+obj.uuid+"_"+obj.fileName;
						originPath = originPath.replace(new RegExp(/\\/g),"/");
						str += "<li><a href=\"javascript:showImage(\'"+originPath+"\')\"><img src='/display?fileName="+fileCallPath+"'></a><span data-file=\'"+fileCallPath+"\' data-type='image'> X </span></li>";
						
						//str += "<li><a href='/download?fileName="+fileCallPath+"'>"+"<img src='/display?fileName="+fileCallPath+"'></a></li>";
					}
				});
				uploadResult.append(str);
			}	
			
			//upload버튼 기능 설정
			$("#uploadBtn").on("click", function(e){
				var formData = new FormData();
				var inputFile = $("input[name='uploadFile']");
				var files = inputFile[0].files;
				console.log("-----"+ files);
				
				for(var i=0; i<files.length; i++){
					//업로드 제한 체크
					if(!checkExtension(files[i].name, files[i].size)){
						$(".uploadDiv").html(cloneObj.html());
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
					success : function(result){
						console.log(result);
						
						showUploadedFile(result);
						alert("Uploaded!!");
					}
				});				
			});
			
			// 'x'표시에 대한 이벤트 처리
			$(".uploadResult").on("click", "span", function(e){
				var targetFile = $(this).data("file");
				var type = $(this).data("type");
				
				console.log("-----"+ targetFile);
				
				$.ajax({
					url : '/deleteFile',					
					data : {fileName:targetFile, type:type}, 
					dataType : 'text', 
					type : 'POST',
					success : function(result){						
						alert(result);
					}
				});				
			});
			
			// 원본파일 보이기 창 끄기
			$(".bigPictureWrapper").on("click", function(e){
				$(".bigPicture").animate({width:'0%',height:'0%'}, 500);
				setTimeout(()=>{
					$(this).hide();
				}, 500);
			});
					
			
		});
	</script>
</body>
</html>