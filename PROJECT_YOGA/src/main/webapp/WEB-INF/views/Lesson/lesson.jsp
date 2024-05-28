<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@include file="../includes/header.jsp"%>
<title>lesson</title>
<meta charset="UTF-8">
<style type="text/css">

#lessonFullContainer{
	position: absolute; margin-top : 100px; margin-left : 30%; padding-bottom : 100px;
    
}

.lessonmiddelContainer{
 float: left; margin-right : 20px; width : 400px; height:250px;
 margin-bottom : 20px;
 
}
.imgContainer{
	position: relative; width:400px; height : 250px;
}
.lessonClick{
	/* text-align: center;*/
	position: absolute;
	 top: 200px;
    left: 160px;
    background: transparent; /* 배경을 투명하게 만듭니다. */
    z-index: 1; /* 이미지 위에 표시되도록 z-index 값을 설정합니다. */
    background:#9dc08b; color : white;
    border : 3px solid #9dc08b;
    text-decoration: none; font-size: large; border-radius: 5%;
    
}

hr {
    margin-top: 5px; /* 위쪽 여백을 조절할 수 있습니다. */
   
}
</style>

</head>
<body>
<div id = "lessonFullContainer">
${result}${result2}
	<c:forEach items="${list}" var="lesson" varStatus="loop">
	  <div>
		<div class="lessonmiddelContainer imgContainer">
			<img alt="yoga" src="/resources/assets/img/portfolio/fullsize/class${loop.index+1}.jpg" width="400px;" height="250px;">
			<sec:authorize access="isAuthenticated() and #result != principal.username">
			<a class='lessonClick' href='#'>수강신청</a>
			</sec:authorize>
			<input class = "ccode" type="hidden" name = "ccode" value="${lesson.ccode}">
			<input class = "userid" type="hidden" name = "userid" value="${username}">
		</div>
		<div class="lessonmiddelContainer">
			<c:out value="${lesson.ccode}" />&nbsp;&nbsp;
			<c:out value="${lesson.cname}" />
			<hr>
			정원 &nbsp;<c:out value="${lesson.camount}" />명
			
			<hr>
			<c:out value="${lesson.cteacher}" />&nbsp; 강사님
			<hr>
			<c:out value="${lesson.ctime}" />
			<hr>
			<c:out value="${lesson.ccontext}" />		
			
		</div>
	  </div>
	  <br>
	</c:forEach>


</div>
<script type="text/javascript">
	$(document).ready(function(){
		$(".lessonClick").on("click",function(){
			let ccode = $(this).siblings(".ccode").val();
			let userid = $(this).siblings(".userid").val();
			console.log(userid);
			var confirmation = confirm("수강신청을 하시겠습니까?");
	        
	        // 확인 창에서 "예"를 선택한 경우
	        if (confirmation) {
	            // 수강신청 컨트롤러로 이동
	            //window.location.href = "/Lesson/lessonInsert" + ccode+ userid;
				$.ajax({
		            type: "GET",
		            url: "/Lesson/insert",
		            data: {
		                ccode: ccode,
		                userid: userid
		            },
		            success: function(response) {
		                // 서버로부터 응답 성공 시 실행될 코드
		                alert("수강신청에 성공하였습니다."); // 응답 메시지를 알림창으로 보여줌
		                location.reload();
		            },
		            error: function() {
		                // 서버 요청 실패 시 실행될 코드
		                alert("수강신청에 실패하였습니다.");
		            }
		        });
	        }
			
			
			
		})
		
	})

</script>
<%@include file="../includes/footer.jsp"%>	