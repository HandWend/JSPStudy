<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<%
/* V */
out.print(request.getContextPath() + "<br>");
/* 서버에 대한 ip 주소 */
out.print(request.getLocalAddr()+ "<br>");
out.print(request.getLocalName()+ "<br>");
out.print(request.getLocalPort()+ "<br>");
out.print(request.getLocale()+ "<br>");
/* V */
out.print(request.getMethod()+ "<br>");
/* V */
out.print(request.getQueryString()+ "<br>");
out.print(request.getParameter("name")+ "<br>");
/* 클라이언트에 대한 ip 주소 */
/* V */
out.print(request.getRemoteAddr()+ "<br>");
out.print(request.getRequestURI()+ "<br>");
out.print(request.getRequestURL()+ "<br>");
/* referer 자체가 이전 페이지를 가리키는 버튼 */
out.print(request.getHeader("referer")+ "<br>");
String referer = request.getHeader("referer");
%>
<span style='color:red'><%=referer %></span><br>

</body>
</html>