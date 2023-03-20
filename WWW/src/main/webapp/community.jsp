<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
h3 {
	text-align: center;
}

table {
	width: 800px;
}

table, tr, td {
	border: 1px solid black;
	text-align: center;
}
</style>
</head>
<body>
	<h3>커뮤니티 게시판</h3>
	<table align="center">
		<tr>
			<td>번호</td>
			<td>작성자</td>
			<td>내용</td>
			<td>좋아요 수</td>
			<td>작성날짜</td>
		</tr>
		<c:if test="${empty community}">

		</c:if>
		<c:if test="${!empty community}">
			<c:forEach var="community" items="${community}">
				<tr>
					<td>${community.c_index}</td>
					<td>${community.nickname}</td>
					<td>${community.hashtag}</td>
					<td>${community.like_count}</td>
					<td>${community.cdate}</td>
				</tr>
			</c:forEach>
		</c:if>
	</table>
</body>
</html>