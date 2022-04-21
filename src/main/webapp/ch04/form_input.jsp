<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>개인 정보 입력</title>
</head>
<body>
Home > Person Information
<hr>
<form action="" method="get">
<fieldset style="width: 300px">
<legend style="text-align: center;">개인정보</legend>
이름: <input name="p_name" size="10" type="text">
<br><br>
사원코드: <input name="e_code" size="10" type="text">
<br><br>
성별: 
<input name="gender"  type="radio">남
<input name="gender"  type="radio">여
<br>
취미: 
<input name="hobby1" type="checkbox">운동
<input name="hobby2" type="checkbox">독서
<input name="hobby3" type="checkbox">음악감상
<hr>
<fieldset>
<legend>언어선택:</legend>
<select name="language">
	<option>한국어</option>
	<option>중국어</option>
</select>
</fieldset>
<br>
<button type="submit">가입하기</button>
<button type="reset">다시작성</button>
</fieldset>
</form>
</body>
</html>