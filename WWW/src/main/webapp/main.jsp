<%@page import="com.smhrd.controller.contentSearch"%>
<%@page import="com.smhrd.model.contentDTO"%>
<%@page import = "java.util.List" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>		
			<!-- contentDTO-> Object down casting 필수 -->
			<% List<contentDTO> contents= (List<contentDTO>)session.getAttribute("contents"); %>
			<% for (int i=0; i<contents.size(); i++) {%>
				<h2><%=contents.get(i).getTitle() %></h2>
			<%}; %>
</body>
</html>