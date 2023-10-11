<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@include file="../includes/header.jsp"%>
<title>MYPAGE</title>



<%--     <%
        // 스프링 시큐리티의 Principal 객체를 얻어옵니다.
        org.springframework.security.core.Authentication auth =
            org.springframework.security.core.context.SecurityContextHolder.getContext().getAuthentication();
        
        // Principal 객체에서 사용자 아이디를 추출합니다.
        String userId = auth.getName();
    %>
    
    <!-- 사용자 아이디와 메시지를 출력합니다. -->
    <h1><%= userId %>님의 개인정보 수정 페이지</h1> --%>
    
    <!-- 여기에 개인정보 수정 폼 등을 추가할 수 있습니다. -->


<%-- 
    <div class="row">
        <div class="col-lg-12">
            <div class="panel panel-default">
                <div class="panel-heading">User Profile</div>
                <div class="panel-body">
                    <table style="width: 500px">
                        <tr>
                            <td>아이디</td>
                            <td>
                                <input id="userid" name="userid" value='<c:out value="${member.userid}"/>' readonly="readonly">
                            </td>
                        </tr>
                        <!-- Add more fields as needed -->
                    </table>
                </div>
            </div>
        </div>
    </div>
</body>
</html> --%>
<link href="../resources/css/insert.css" rel="stylesheet" />
</head>
<body>
	<div class="testBox" style="text-align: center;">		
		<h1> MYPAGE </h1>
			<table class="testBox" style="width: 500px">
				<tr>
				    <td>아이디</td>
				    <td><c:out value="${user.userid}"/></td>
				</tr>
				<tr>
				    <td>이름</td>	 
				    <td><c:out value="${user.name}"/></td>
				</tr>								
				<tr>						
					<td>성별</td>
					<td><c:out value="${user.gender}"/></td>					
				</tr>
				<tr>
					<td>연락처</td>
					<td><c:out value="${user.phone}"/></td>
				</tr>
				<tr>
					<td>생년월일</td>
					<td><c:out value="${user.birth}"/></td>
				</tr>
				<tr>
					<td>주소</td>
					<td><c:out value="${user.address}"/></td>
				</tr>
				<tr>
					<td>이메일</td>
					<td><c:out value="${user.email}"/></td>
				</tr>
				<tr>
					<td>수강중인 강의</td>
					<td><c:out value="강의가없다....."/></td>
				</tr>	
				<tr>
					<td colspan="2"> 
						<button onclick="window.location.href='/member/update'" class="btn btn-third btn-m">회원정보수정</button>
						<button onclick="history.go(-1)" class="btn btn-third btn-m">뒤로가기</button>				 					 		
				 	</td>
				</tr>
			</table>
			<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token }">		
	</div>
	
<%@include file="../includes/footer.jsp"%>		

