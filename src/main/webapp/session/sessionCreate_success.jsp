<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>세션 생성</title>
</head>
<body>
Home > 세션 생성하기
<hr>
<%
request.setCharacterEncoding("UTF-8");

String u_id = request.getParameter("id");
String u_pw = request.getParameter("pw");

if (u_id.equals("space") && u_pw.equals("123456")) {
	session.setAttribute("mid", u_id);
	session.setAttribute("mpw", u_pw);
	
	out.println("세션 성공 <br>");
	out.println("[" + u_id +"]님이 입장하셨습니다");
} else {
	//비밀번호 오류 시 횟수 출력 (1/5)
	//모달로 출력.
	out.println("세션 실패 <br>");
	out.println("다시 시도해보세요");
}
%>
</body>
</html>