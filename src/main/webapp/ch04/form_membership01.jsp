<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원가입</title>
</head>
<body>
Home > Join
<hr>
<form action="form_membership02.jsp" method="post">
<fieldset style="width: 300px">
<legend style="text-align: center;">개인정보입력</legend>

아이디: <br> <input name="p_id" size="16" type="text"><br>
비밀번호: <br> <input name="p_pw" size="16" type="text"><br>
이름: <br> <input name="p_name" size="16" type="text"><br>
연락처:<br>
<select name="choice">
	<option value="choice">선택</option>
	<option value="KT">KT</option>
	<option value="SKT">SKT</option>
	<option value="LGU+">LGU+</option>
</select>
<input type="text" maxlength="3" name="phone1" size="3"> -
<input type="text" maxlength="4" name="phone2" size="4"> -
<input type="text" maxlength="4" name="phone3" size="4">
<br><br>
성별: <br>
<input name="gender"  type="radio" value="남성">남
<input name="gender"  type="radio" value="여성">여
<br>
취미: <br>
<input name="hobby" type="checkbox" value="운동">운동
<input name="hobby" type="checkbox" value="독서">독서
<input name="hobby" type="checkbox" value="여행">여행
<input name="hobby" type="checkbox" value="음악감상">음악감상
<hr>

본인소개: <br>
<textarea name="Introduction" rows="3" cols="50">

</textarea>
<button type="submit">가입하기</button>
<button type="reset">다시작성</button>
</fieldset>
</form>
</body>
</html>