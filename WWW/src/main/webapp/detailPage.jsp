<%@page import="com.smhrd.controller.contentSearch"%>
<%@page import="com.smhrd.model.contentDTO"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
</head>
<body>

		<!-- 	
				Session �ȿ� ����ִ� "contents","horror","action"�̸��� ����Ǿ��ִ� �����ʹ� ArrayList<contentDTO> Ÿ���̴�.
				contents�ȿ� ��� ��ü(�ϴ� ����)
				content_index: ��ȭ
				title : ��ȭ����
				genre : �帣
				year : ��۳⵵
				stove : �ó�ý�
				c_score : ����
				age_class : ��� ���� ���
		-->
	<% 
		
		String data = (String)session.getAttribute("data");
		ArrayList<contentDTO> contents = (ArrayList) session.getAttribute("contents");%>
		<%for (int i=0; i<contents.size(); i++){%>
			<%if(contents.get(i).getTitle().equals(data)){%>
				<h2>���� : <%=contents.get(i).getTitle()%></h2>
				<br>
				<h2>�帣 : <%=contents.get(i).getGenre()%></h2>
				<br>
				<h2>��۳⵵ : <%=contents.get(i).getYear()%></h2>
				<br>
				<h2>�ó�ý� : <%=contents.get(i).getStove()%></h2>
				<br>
				<h2>���� : <%=contents.get(i).getC_score()%></h2>
				<br>
				<h2>���ɵ�� : <%=contents.get(i).getAge_class()%></h2>

			<%}%>
		<%}%>
	
	
	
	
	
	
</body>
</html>