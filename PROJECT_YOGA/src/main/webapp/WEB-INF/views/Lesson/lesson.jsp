<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@include file="../includes/header.jsp"%>
<title>lesson</title>

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
#lessonClick{
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
	<c:forEach items="${list}" var="lesson">
	  <div>
		<div class="lessonmiddelContainer imgContainer">
			<img alt="yoga" src="/resources/assets/img/yoga.jpg" width="400px;" height="250px;">
			<a id='lessonClick' href='#'>수강신청</a>
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


</script>
<%@include file="../includes/footer.jsp"%>	