<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>단일 세션 정보</title>
</head>
<body>
<%
String u_id = (String) session.getAttribute("mid");
String u_pw = (String) session.getAttribute("mpw");

out.println("1. 아이디: " + u_id + "<br>");
out.println("2. 비밀번호: " + u_pw + "<br>");
%>
</body>
</html>