<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
<%@include file="../include/nav.jsp"%>
<title>NOTICE</title>
<link href="../resources/css/pageStyle.css" rel="stylesheet" />
</head>
<style>
table {
	margin: 0 auto;
	margin-top: 150px;
	font-size: 20px;
	width: 1000px;
	height: 600px;
	text-align: center;
}

table, td{
	border: 1px solid black
}

h5{
	position: relative;
	right: 0;
	
}
</style>
<body>
	<table>
		<tr>
			<td>글번호</td>
			<td>제목</td>
			<td>작성자</td>
			<td>조회수</td>
			<td>등록일</td>
			<td>수정일</td>
		</tr>
		<tr>
			<td>글번호</td>
			<td>제목</td>
			<td>작성자</td>
			<td>조회수</td>
			<td>등록일</td>
			<td>수정일</td>
		</tr>
		<tr>
			<td>글번호</td>
			<td>제목</td>
			<td>작성자</td>
			<td>조회수</td>
			<td>등록일</td>
			<td>수정일</td>
		</tr>
		<tr>
			<td>글번호</td>
			<td>제목</td>
			<td>작성자</td>
			<td>조회수</td>
			<td>등록일</td>
			<td>수정일</td>
		</tr>

		<!-- <c:forEach>
		<tr>
		</tr>
		</c:forEach> -->
	</table>
	<h5>페이징</h5>

	<%@include file="../include/footer.jsp"%>