<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
  <meta charset="UTF-8">
  <title>이용약관</title>
  <link rel="stylesheet" type="text/css" href="style.css">
  <meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0, user-scalable=no, target-densitydpi=medium-dpi" />
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
</head>

<body class="page07">
    <div class="jointit w100 tC"><b>약관동의</div>

    <div class="pd16">
	    <form action="join02.jsp" method="post">
	    <input type="hidden" name="agree" id="agree" value=""/>
	    
	        <div class="joinbox">
	            <label for="agree1">서비스 이용약관 동의</label>
	            <input type='checkbox' id="agree1" name='' value='Y' />
	            <div class="terms"><b>제1조 목적</b><br><br>
	
	                이 약관은 가람관광여행사(이하"회사"라 한다)이 운영하는 garamtour.kr (이하"사이트"라 한다)에서 제공하는 문자메세지 전송 서비스(이하 "서비스"라 한다)의 이용조건 및 절차, 회사와 회원간의 권리, 의무, 기타 필요한 사항을 규정함을 목적으로 합니다.<br><br>
	            </div>
	        </div>
	
	        <div class="joinbox">
	            <label for="agree2">개인정보 수집 및 이용 동의</label>
	            <input type='checkbox' id="agree2" name='' value='Y' />
	            <div class="terms">
	                '주식회사 가람관광여행사'은 (이하 '회사'는) 고객님의 개인정보를 중요시하며, "정보통신망 이용촉진 및 정보보호"에 관한 법률을 준수하고 있습니다. 회사는 개인정보취급방침을 통하여 고객님께서 제공하시는 개인정보가 어떠한 용도와 방식으로 이용되고 있으며, 개인정보보호를 위해 어떠한 조치가 취해지고 있는지 알려드립니다. <br>
	                회사는 개인정보취급방침을 개정하는 경우 웹사이트 공지사항(또는 개별공지)을 통하여 공지할 것입니다. <br> <br>
	                
	            </div>
	        </div>
	
	        <div class="joinbox">
	            <label for="agree3">개인정보 3차 제공 동의</label>
	            <input type='checkbox' id="agree3" name='' value='Y' />
	            <div class="terms">
	                가람관광여행사의 스키관련 패키지의 신청및 숙박,기타 상품 의 예약을 위하여 아래와 같이 개인정보를 수집,이용 및 제공하고자 합니다.<br><br>
	        
	                ※ 위의 개인정보 수집,이용에 대한 동의를 거부할 권리가 있습니다. 그러나 동의를 거부할 경우 패키지 예약에 제한될수 있습니다
	            </div>
	        </div>
	
	        <div class="joinbtn w100 tC">
	        	<div><input type="checkbox" id="allagree" onclick="chkAuto(this)">전체 동의</div>
	            <button type="button" onclick="history.go(-1);">취소</button>
	            <button type="submit">확인</button>
	        </div>
        </form>
    </div>
<script>
/* 체크박스 3개 모두 체크되면 전체동의도 체크인 */
/* 하나라도 체크 해제 상태일 시 전체동의는 체크되지 않음 */
$(document).ready(function(){
	var a1 = 0;
	$("#agree1").on("click", function () {
			if($("#agree1").prop("checked")) {
				a1 += 1;
			} else {
				a1 -= 1;
			}
			allChk();
	})
	
	$("#agree2").on("click", function () {
			if($("#agree2").prop("checked")) {
				a1 += 1;
			} else {
				a1 -= 1;
			}
			allChk();
	});
	
	$("#agree3").on("click", function () {
			if($("#agree3").prop("checked")) {
				a1 += 1;
			} else {
				a1 -= 1;
			}
			allChk();
	});
	
	function allChk() {
		if (a1 ==3) {
			$("#allagree").prop("checked", true);
		} else {
			$("#allagree").prop("checked", false);
		}
		
	}
	/* 체크박스 3개가 모두 입력되지 않았을 시 경고창 띄워서 알려줌. */
	console.log($("button[type=submit]").on("click", function(){
		var agree1 = $("#agree1").prop("checked");
		var agree2 = $("#agree2").prop("checked");
		var agree3 = $("#agree3").prop("checked");
		
		if(!agree1 || !agree2 || !agree3){
			alert("약관에 전체 동의하셔야합니다");
			return false;
		} else {
			$("#agree").val("Y");
			return true;
		}
	}));
});


/* 각각의 문항이 체크되지 않았을 시 어느 부분이 체크가 안 되었는지 알려줌. */
function frmchk(){
	var agree1 = $("#agree1").prop("checked");
	var agree2 = $("#agree2").prop("checked");
	var agree3 = $("#agree3").prop("checked");
	if(!agree1){
		alert("서비스 이용약관 동의에 체크하셔야 합니다.");
		return false;
	}
	if(!agree2){
		alert("개인정보 수집 및 이용 동의에 체크하셔야 합니다.");
		return false;
	}
	if(!agree3){
		alert("개인정보 3차 제공 동의에 체크하셔야 합니다.");
		return false;
	}
	
	return true;
}

function chkAuto(t) {
	/* 전체동의가 눌렸을 때 동의항목 1, 2, 3번 활성화/비활성화 하기 */
	if(t.checked) {
		agree1.checked = true;
		agree2.checked = true;
		agree3.checked = true;
	} else {
		agree1.checked = false;
		agree2.checked = false;
		agree3.checked = false;
	}
	/* t.checked 여부 출력 */
	console.log("전체동의 완료" + t.checked);
}
</script>    
</body>
</html>





