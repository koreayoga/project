
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>개인정보 수정 페이지</title>
</head>
<body>

<h1> 개인정보 수정 홈페이지 </h1>
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
</body>
</html>
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