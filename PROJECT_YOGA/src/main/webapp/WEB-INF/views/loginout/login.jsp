<%@include file="/WEB-INF/views/includes/header.jsp"%>
<%@page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<% request.setCharacterEncoding("utf-8"); %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<html >
		<!-- <title>Login Page</title> -->

	<div class="test" style="align-items: center;">
		<div class="m-b50"><h1>Login</h1></div>
		<div>
			<form role="form" action="/login" method="post">				
				<!-- 로그인 정보입력 -->
				<div class="m-b30">
					<input type="text" id="id" name="username" class="loginput"  placeholder="아이디를 입력해주세요" required autofocus>
					<input type="password" id="pw" name="password" class="loginput" placeholder="비밀번호를 입력해주세요" value="" required><br>	
					<!-- 자동로그인 -->
					<span class="small text-center text-muted"><input type="checkbox" name="remember-me">&nbsp;&nbsp;로그인기억하기</span>
					&nbsp;&nbsp;&nbsp;&nbsp;
					<!-- 비밀번호 보이기/숨기기 -->
					<input type="checkbox" id="showpw">
    				<label for="showpw" class="small text-center text-muted">&nbsp;&nbsp;비밀번호 보이기</label><br>
    				
				</div>
				<!-- 로그인 버튼 생성 -->
				<div class="m-b100">
					<a href="/" class="btn btn-login btn-primary" style="color: white; font-size:20px; font-weight:700">로그인</a><p/>
				</div>
				<!-- 비밀번호 암호화 -->
				<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}">				
				<!-- 아이디찾기/비밀번호찾기/회원가입-->
				<div class="small text-muted">
					<a href="javascript:void(0);" onclick="newWindow('searchID', '아이디찾기', 430, 300);">아이디찾기</a>|
					<a href="javascript:void(0);" onclick="newWindow('resetPW', '비밀번호찾기', 430, 400);">비밀번호재설정</a>|					
					<a href="/member/insert">회원가입</a>
				</div>
			</form>		
		</div>
	</div>

	<!-- 로그인버튼 처리 -->
	<script type="text/javascript">
		$(document).ready(function () {
		    // 아이디 입력란 가져오기
		    var idVal = document.getElementById("id");
		    // 비밀번호 입력란 가져오기
		    var pwVal = document.getElementById("pw");
	
		    // "로그인" 버튼 클릭 시 동작
		    $(".btn-login").on("click", function (e) {
		        e.preventDefault();
	
		        if (idVal == null || idVal.value === "") {
		            alert("아이디를 입력해주세요.");
		            idVal.focus();
		            return;
		        }
	
		        if (pwVal == null || pwVal.value === "") {
		            alert("비밀번호를 입력해주세요.");
		            pwVal.focus();
		            return;
		        }
		        
		     	// 일치정보 없음 오류
		        if ("${error}" !== "") {
		            alert("${error}");
		            return;
		        }
		        
		        $("form").submit();
		    });
		});
   </script>
   <!-- 비밀번호보이기 -->
   <script>		
        var pw = document.getElementById("pw");
        var toggle = document.getElementById("showpw");

        toggle.addEventListener("change", function() {
            if (toggle.checked) {
                pw.type = "text"; 
            } else {
                pw.type = "password";
            }
        });
    </script>
	<!-- 아이디찾기/비밀번호재설정 새 창 띄우기-->
	<script type="text/javascript">
        function newWindow(url, name, width, height) {
            var left = (window.innerWidth - width) / 2;
            var top = (window.innerHeight - height) / 2;
            var options = 'width=' + width + ',height=' + height + ',top=' + top + ',left=' + left;
            window.open(url, name, options);
        }
    </script>
	<!-- 회원가입페이지 이동버튼 -->
	<script type="text/javascript">
    	$(".btn-member").on("click", function(e){ 
			e.preventDefault();			
			window.location.href = "../main/member";
		});
    </script>
<!-- logout성공 기능구현 -->
<%-- <c:if test="${param.logout != null}">
	<script>
    		$(document).ready(function(){
    			alert("로그아웃하였습니다.");
    		});
    	</script>
</c:if> --%>
<%@include file="/WEB-INF/views/includes/footer.jsp"%>
