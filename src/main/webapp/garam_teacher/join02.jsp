<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
String agree = request.getParameter("agree");
String method = request.getMethod();//GET , POST

//if((agree == null && agree.equals("Y")) || method.equals("GET"))
if ((agree == null && "Y".equals(agree)) || method.equals("GET")) {
%>
<script type="text/javascript">
	history.go(-1);
</script>
<%
}
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원가입<%=method%></title>
<link rel="stylesheet" type="text/css" href="style.css">
<meta name="viewport"
	content="width=device-width, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0, user-scalable=no, target-densitydpi=medium-dpi" />
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
</head>

<body class="page07">
	<div class="jointit w100 tC">
		<b>회원가입</b>
	</div>

	<div class="pd16">
		<form method="post" action="join02Act.jsp">
		<input type="" name="uid" id="uid">
			<div><h4>이름</h4><input type="text" name="uname" id="uname"></div>

			<div><h4>학교</h4><input type="text" name="schoolname" id="schoolname"></div>

			<div><h4>학년/반</h4><input type="text" name="gradeclass" id="gradeclass"></div>

			<div class="pnum">
				<div><h4 class="inline">휴대폰번호</h4><span>(※휴대폰 번호가 ID로 설정됩니다.)</span></div>
				<input type="text" id="phone1" onkeydown="phReg1()"> - <input type="text"
					id="phone2"  onkeydown="phReg2()"> - <input type="text" id="phone3"  onkeydown="phReg3()">
			</div>
			
			<!-- if (!/^[0-9]{3}-[0-9]{3,4}-[0-9]{4}/.test(phoneNumber)) 
			return res.json({ isSuccess: false, code: , message: "숫자, -을 포함해 휴대전화 형식에 맞게 입력해주세요.", });
-->

			<div><h4 class="inline">비밀번호</h4><span>(※최대 12자리)</span> 
				<input type="password" maxlength='12' id="upw" name="upw" >
			</div>

			<div><h4>비밀번호 확인</h4>
				<input type="password" maxlength='12' id="upwApply">
			</div>

			<div>
				<h4>노선</h4>
				<div class="sltbox">
					<select name="route" id="route">
						<option value="A노선">A노선</option>
						<option value="B노선">B노선</option>
						<option value="C노선">C노선</option>
					</select>
				</div>
			</div>

			<div>
				<h4 class="inline">탑승장소</h4>
				<span>(※노선을 먼저 선택해주세요)</span>
				<div class="sltbox" id="locSel">
					<select name="boardingplace" id=boardingplace>
						<option value="A장소">A장소</option>
						<option value="B장소">B장소</option>
						<option value="C장소">C장소</option>
					</select>
				</div>
			</div>

			<div class="jw100 tC">
				<button id="submit" type="submit">가입하기</button>
			</div>
		</form>
	</div>
	<script>
	
	var idReg = /^[a-z0-9]{5,20}$/;
	var nameReg = /^[가-힣]{2,6}/;
	
	
	$(document).ready(function() {
		$("#submit").click(function() {
			if ($("#uname").val() == '') {
				alert("이름을 입력해주세요");
				return false;
			}

			if ($("#schoolname").val() == '') {
				alert("학교를 입력해주세요");
				$("#schoolname").focus();
				return false;
			}

			if ($("#gradeclass").val() == '') {
				alert("학년과 반을 입력하세요");
				return false;
			}
			
			if ($("#phone1").val() == '' || $("#phone2").val() == '' || $("#phone3").val() == ''){
				alert("휴대폰번호를 입력해주세요");
				return false;
			}
			
			if ($("#upw").val() == '') {
				alert("비밀번호");
				return false;
			}
			
			

			if ($("#upw").val() != $("#upwApply").val()) {
				alert("비밀번호가 일치하지 않습니다");
				upw.value = '';
				upwApply.value = '';
				return false;
			}

			if ($("#route").val() == '선택' || $("#locSel").val() == '선택') {
				alert("노선/탑승장소를 다시 확인해주세요");
				return false;
			}

		});
		$("#phone1").keyup(function() {
			if ($("#phone1").val().length == 3) {
				$("#phone2").focus();
			}
		});

		$("#phone2").keyup(function() {
			if ($("#phone2").val().length == 4) {
				$("#phone3").focus();
			}
		});
	});
	</script>
	
	<script>
	$(document).ready(function () {
		$("button[type=submit]").on("click", function(){
		      var p1 = $("#phone1").val();
		      var p2 = $("#phone2").val();
		      var p3 = $("#phone3").val();
		      $("#uid").val(p1+p2+p3);
		      return true;
		   });
	})
	
	
	var phoneNum = '010-xxxx-xxxx'; 
    var patternPhone = /01[016789]-[^0][0-9]{2,3}-[0-9]{3,4}/;
    // var patternPhone = new RegExp("01[016789]-[^0][0-9]{2,3}-[0-9]{3,4}");  

   //둘중에 하나골라 쓰면 된다.
    if(!patternPhone.test(phoneNum)) {
        alert('핸드폰 번호를 확인 해주세요');
        return;
    }  
    if ($("#phReg1").text())
		
		$("#member_phone").keydown(function() {
			arr[6] = false;
			var member_phone = $("#member_phone").val().trim();
			if (phoneR.test(member_phone) == false) {
				$("#phone_check").text('휴대폰번호를 다시 입력해주세요.');
			} else {
				$("#phone_check").text('');
				arr[6] = true;
			}
		})
	
	</script>
	var phoneReg = /^01([0|1|6|7|8|9]?)-?([0-9]{3,4})-?([0-9]{4})$/;
	<script>
	function phReg1() {
		
		var phReg1 = /^01([0|1|6|7|8|9]?)/;
	}
	</script>
</body>
</html>
