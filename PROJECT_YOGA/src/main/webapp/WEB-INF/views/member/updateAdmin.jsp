<%@page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@include file="../includes/header.jsp"%>
<title>UPDATE INFO</title>
<link href="../resources/css/insert.css" rel="stylesheet" />
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link href="https://fonts.googleapis.com/css2?family=Gaegu:wght@300;400&family=Jua&family=Orbit&display=swap" rel="stylesheet">

<div class="row">
    <div class="col-lg-12">
        <h1 class="page-header">Notice</h1>
    </div>
</div>

<div class="row">
    <div class="col-lg-12">
        <div class="panel panel-default">
            <div class="panel-body">
                <table width="100%" class="table table-bordered">
                    <thead>
                        <tr>
                            <th>아이디</th>
                            <th>이름</th>
                            <th>성별</th>
                            <th>핸드폰</th>
                            <th>생일</th>
                            <th>주소</th>
                            <th>이메일</th>
                            <th>권한</th>
                            <th>수정</th>
                            <th>삭제</th>
                        </tr>
                    </thead>
                    <c:forEach items="${list}" var="member">
                        <tr>
                            <td><c:out value="${member.userid}" /></td>
                            <td><c:out value="${member.name}" /></td>
                            <td><c:out value="${member.gender}" /></td>
                            <td><c:out value="${member.phone}" /></td>
                            <td><c:out value="${member.birth}" /></td>
                            <td><c:out value="${member.address}" /></td>
                            <td><c:out value="${member.email}" /></td>
                            <td><c:out value="${member.auth}" /></td>
                            <td>
                                <button class="edit-btn" data-userid="${member.userid}">수정</button>
                            </td>
                            <td>
                                <button class="delete-btn" data-userid="${member.userid}">삭제</button>
                            </td>
                        </tr>
                    </c:forEach>
                </table>
            </div>
        </div>
    </div>
</div>
