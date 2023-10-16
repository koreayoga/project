<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<meta charset="UTF-8">
<title>lessonList</title>
<%@include file="../includes/header.jsp"%>

<style>
.ccodeList{
	position: absolute; margin-top : 100px;
}
</style>
</head>
<body class = "ccodeList">

<div class="row">
    <div class="col-lg-12">
        <h1 class="page-header">Lesson</h1>
        <hr class="divider" />
    </div>
</div>

	<select name= "ccode">
		<option value="A1000" selected>A1000</option>
		<option value="A2000">A2000</option>
		<option value="A3000">A3000</option>
		<option value="B1000">B1000</option>
		<option value="B2000">B2000</option>
		<option value="B3000">B3000</option>
	</select>
	<div id = "lessonList panel-body">
	<table width="100%" class="table table-bordered">
		<thead>
		<tr>
		<th>번호</th>
		<th>유저아이디</th>
		<th></th>
		<th></th>
		</tr>
		</thead>
		<tbody class="lessonloop">
	<c:forEach items="${list}" var="lesson" varStatus="loop">		
		<tr>
		<td>${loop.index+1}</td>		
		<td>${lesson.userid}</td>
		<td></td>
		<td>
			<a class="deleteLesson">삭제</a>
			<input type="hidden" value='${lesson.lnum}'>
		</td>		
		</tr>
	</c:forEach>
	</tbody>
		</table>
	</div>
	
</body>
<script>
	$(document).ready(function(){
		$('select[name = ccode]').change(function(){
			console.log("클릭");
			let code = $('select[name = ccode]').val(); 
			console.log(code);
			$.ajax({
	            type: "GET",
	            url: "/admin/lessonList2",
	            data: {
	                code : code
	            },
	            success: function(response) {
	                // 서버로부터 응답 성공 시 실행될 코드
	                //alert("성공");
	                console.log(response);
	                let tbody = $('.lessonloop').html("");
	                // 리스트를 화면에 출력
	                let lessonListHtml='';
	                $.each(response, function (index, lesson) {
	                    // 각 레슨에 대한 HTML 생성
	                lessonListHtml += '<tr>'; // 리스트 시작 태그
	                   lessonListHtml +='<td>'+lesson.ccode+'</td><td>'+lesson.userid+'</td><td></td><td><a class="deleteLesson">삭제</a><input type="hidden" value='+lesson.lnum+'></td>	';
	                lessonListHtml += '</tr>'; // 리스트 종료 태그
	                });
	                
	                // 생성한 HTML을 화면의 특정 위치에 추가 (예: id가 lessonList인 요소에 추가)
	                $('.lessonloop').html(lessonListHtml);
	                
	            },
	            error: function() {
	                // 서버 요청 실패 시 실행될 코드
	                alert("실패");
	            }
	        });
			
		})
		
		
		
		//a태그를 클릭하면 해당 a태그의 다음에 있는 형제 인풋 코드의 값을 가지고 컨트롤러로 넘어가는 메소드 구현중
		$(".lessonloop").on("click", ".deleteLesson", function(e) {
			console.log("click")
			e.preventDefault();
			let inputV = $(this).siblings('input').val();
			console.log(inputV);
			$.ajax({
				type : "post",
				url : "/Lesson/deleteLesson",
				data : {input: inputV},
				success : function(res){
					console.log(res);
					alert("삭제되었습니다.");
					location.reload();
				},
				error : function(){
					alert("실패하였습니다. 다시 시도하세요.");
				}
			
			})
			
			
		})
	})
	var csrfHeaderName = "${_csrf.headerName}";
	var csrfTokenValue = "${_csrf.token}";
	//Ajax Spring Security Header
    $(document).ajaxSend(function(e, xhr, options){
       xhr.setRequestHeader(csrfHeaderName, csrfTokenValue);
    });

</script>

</html>

<%@include file="../includes/footer.jsp"%>