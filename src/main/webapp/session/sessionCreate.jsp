<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>로그인 폼 생성</title>
</head>
<body>
Home > 로그인 화면
<hr>
<form name="loginForm" action="sessionCreate_success.jsp" method="post">
아이디: <br>
<input type="text" name="id" value="space"><br>
비밀번호: <br>
<input type="password" name="pw" value="123456"><br>
<button>로그인</button>
</form>
</body>
</html>