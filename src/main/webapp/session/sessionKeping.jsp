<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>로그인 후 세션 유지 시간</title>
</head>
<body>
Home > 세션 유지 시간
<hr>
<%
String s_id = session.getId();
long lastTime = session.getLastAccessedTime();
long createTime = session.getCreationTime();

out.println("세션 아이디: " + s_id + "<br>");
out.println("마지막 접속시간: " + lastTime/1000+ "<br>");
out.println("생성된 시간: " + createTime/1000+ "<br>");
out.println("세션 유지 시간: " + (lastTime - createTime)/1000);
%>
</body>
</html>