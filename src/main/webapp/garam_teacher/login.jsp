<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0, user-scalable=no, target-densitydpi=medium-dpi" />
<meta http-equiv="Content-Security-Policy"
	content="upgrade-insecure-requests">
<title>로그인</title>
<link rel="stylesheet" type="text/css" href="style.css">

</head>

<body class="page01 tC">
	<div class="mXY">
		<img src="./img/logo.png">
<div id="errMsg" style="height: 20px; margin-top: 20px; color: red"></div>
		<div class="a01">
			<form method="post" action="loginAct.jsp" onsubmit="return login()">
			
				<div><span>ID</span><input type="text" name="uid" id="uid" placeholder="휴대폰번호( - 빼고 입력)"></div>
				<div><span>PW</span><input type="password"  name="upw" id="upw"></div>
				<button id="submit">Log in</button>
			</form>
		</div>

		<div class="cscenter">
			<a href="join01.jsp">회원가입</a>
		</div>
		<div class="cscenter" style="margin: 10px 0px;">비밀번호 찾기</div>
	</div>
	<!-- 아이디/비밀번호를 입력하세요 -->
	<script>
		function login() {
			let mid = document.getElementById("uid");
			let errMsg = document.getElementById("errMsg");
			/* 속성 value == 값이 있냐 없냐 */
			/* 값이 없으면 errMsg div에 에러메시지를 날려준다. */
			if (uid.value == '') {
				/* 출력하는 방법 4가지 중 하나 */
				errMsg.innerHTML = "아이디(휴대폰번호)를 입력하세요";
				/* ★추가: 커서를 에러메시지가 뜬 장소로 옮겨준다. */
				uid.focus();
				/* 값이 없고 에러메시지가 출력이 되면 더 이상 넘어가지 않게 한다. */
				return false;
			}
			/* mid를 한 것과 같이 만들고 mid의 자리에 mpw를 넣는다. */
			/* errMsg에는 비밀번호에 관한 에러메시지를 넣는다. */
			let upw = document.getElementById("upw");
			if (upw.value == '') {
				errMsg.innerHTML = "비밀번호를 입력하세요";
				/* ★추가: 커서를 에러메시지가 뜬 장소로 옮겨준다. */
				upw.focus();
				return false;
			}
			console.log("login");
			/* 페이지가 지나가지 않도록 해주는 것: return false;  */
			/* 아이디와 비밀번호가 채워졌다면 지나갈 수 있도록 true를 사용한다. */
			return true;
		}
	</script>
</body>
</html>
