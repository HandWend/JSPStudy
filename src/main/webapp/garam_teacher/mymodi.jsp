<%@page import="java.sql.*"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
if(session.getAttribute("sessid")==null) {
	response.sendRedirect("login.jsp");
}

String url = "jdbc:mysql://localhost:3306/garam?characterEncoding=UTF-8&serverTimezone=Asia/Seoul";
String user = "root";
String password = "smart";

StringBuffer qry = new StringBuffer();
qry.append(" select * from g_member ");
qry.append(" where uid=? ");

String sql = qry.toString();

Connection conn = null;
PreparedStatement stmt = null;
ResultSet rs = null;

String uname="";
String schoolName = "";
String phone = "";
String gradeClass = "";
String route = "";
String boardingPlace = "";



try {
	Class.forName("com.mysql.cj.jdbc.Driver");
	conn = DriverManager.getConnection(url, user, password);
	
	stmt = conn.prepareStatement(sql);
	stmt.setString(1, (String)session.getAttribute("sessid"));
	
	rs = stmt.executeQuery();
	
	if (rs.next()) {
		
		 uname = rs.getString("uname"); 
		 schoolName = rs.getString("schoolname"); 
		 phone = rs.getString("uid");
		 gradeClass = rs.getString("gradeclass");
		 route = rs.getString("route");
		 boardingPlace = rs.getString("boardingplace");
	} 
} catch (Exception e) {
	e.getLocalizedMessage();
} finally {
	if (rs!=null) rs.close();
	if (stmt!=null) stmt.close();
	if (conn!=null) conn.close();
}

%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원정보수정</title>
<link rel="stylesheet" type="text/css" href="style.css">
<meta name="viewport"
	content="width=device-width, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0, user-scalable=no, target-densitydpi=medium-dpi" />
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
</head>

<body class="page07">
	<div class="jointit w100 tC">
		<b>회원정보수정</b>
	</div>

	<div class="pd16">
		<form method="post" action="mymodiAct.jsp">
		<input type="hidden" name="uid" id="uid" value="<%=session.getAttribute("sessid")%>">
			<div>
				<h4>이름</h4>
				<input type="text" name="uname" id="uname" value="<%=uname%>">
			</div>

			<div>
				<h4>학교</h4>
				<input type="text" name="schoolname" id="schoolname" value="<%=schoolName%>">
			</div>

			<div>
				<h4>학년/반</h4>
				<input type="text" name="gradeclass" id="gradeclass" value="<%=gradeClass%>">
			</div>

			<!-- <div>
				<h4 class="inline">비밀번호</h4>
				<span>(※최대 12자리)</span> <input type="password" maxlength='12' id="upw"
					name="upw">
			</div>

			<div>
				<h4>비밀번호 확인</h4>
				<input type="password" maxlength='12' id="upwApply">
			</div> -->

			<div>
				<h4>노선</h4>
				<div class="sltbox">
				<!-- selected 속성 부여 -->
					<select name="route" id="route" >
						<option value="A노선" <%=("A노선".equals(route)?"selected":"") %>>A노선</option>
						<option value="B노선" <%=("B노선".equals(route)?"selected":"") %>>B노선</option>
						<option value="C노선" <%=("C노선".equals(route)?"selected":"") %>>C노선</option>
					</select>
				</div>
			</div>

			<div>
				<h4 class="inline">탑승장소</h4>
				<span>(※노선을 먼저 선택해주세요)</span>
				<div class="sltbox" id="locSel">
					<select name="boardingplace" id=boardingplace>
						<option value="A장소" <%=("A장소".equals(boardingPlace)?"selected":"") %>>A장소</option>
						<option value="B장소" <%=("B장소".equals(boardingPlace)?"selected":"") %>>B장소</option>
						<option value="C장소" <%=("C장소".equals(boardingPlace)?"selected":"") %>>C장소</option>
					</select>
				</div>
			</div>

			<div class="jw100 tC">
				<button id="submit" type="submit" style="margin-top: 20px;">수정하기</button>
			</div>
		</form>
	</div>
	<script>
	$(document).ready(function() {
		$("#submit").click(function() {
			location.href="login.jsp";
	});
	
	</script>
</body>
</html>
