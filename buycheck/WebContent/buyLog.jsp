<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>

<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js" integrity="sha384-JjSmVgyd0p3pXB1rRibZUAYoIIy6OrQ6VrjIEaFf/nJGzIxFDsf4x0xIM+B07jRM" crossorigin="anonymous"></script>
<script src="https://code.jquery.com/jquery-3.3.1.slim.min.js" integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo" crossorigin="anonymous"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js" integrity="sha384-UO2eT0CpHqdSJQ6hJty5KVphtPhzWj9WO1clHTMGa3JDZwrnQq4sF86dIHNDz0W1" crossorigin="anonymous"></script>

<link rel="stylesheet" type="text/css" href="css/buyLog.css" />

<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<script>
/* 	$(document).ready(function(){
		var readyDate = new Date();
		if(readyDate.getDay().toString() == '0' || readyDate.getDay().toString() == '6'){
			document.getElementById('DateForNotBuy').innerText = "오늘은 주중에 구매하지 못한 사람만 구매할 수 있습니다.";
		}
	}) */

	function inputJu(obj){
		var number = obj.value.replace(/[^0-9]/g,"");
		var jumin = "";
		var chkDate = new Date();
		
		if(chkDate.getDay().toString() == '0' || chkDate.getDay().toString() == '6'){ // 일요일 또는 토요일
			if(number.length<7){
				return number;
			}
			else if(number.length <14){
				jumin += number.substr(0,6);
				jumin += "-";
				jumin += number.substr(6,7);
			}
			else{
				jumin += number.substr(0,6);
				jumin += "-";
				jumin += number.substr(7,8);
				jumin += number.substr(15);
			}
			obj.value=jumin;
		}
		else{ // 일반 평일일 때
			if(number.length == 0){
			}
			else if(number.length == 1){
				return number;
			}
			else if(number.length<7){
					return number;
			}
			else if(number.length <14){
				jumin += number.substr(0,6);
				jumin += "-";
				jumin += number.substr(6,7);
			}
			else{
				jumin += number.substr(0,6);
				jumin += "-";
				jumin += number.substr(7,8);
				jumin += number.substr(15);
			}
			obj.value=jumin;
		}
	}
	
	function press(f){
		if(f.keyCode == 13){
			formname.submit();
		}
	}
</script>
<body>
	<jsp:include page="navBuyLog.jsp" />


	<div id="search-cont">
		<span id="yoil"></span>
		<script type="text/javascript">
			<!-- 요일 처리 스크립트 -->
			var d = new Date();
			var week = new Array('일', '월', '화', '수', '목', '금', '토');
			document.getElementById('yoil').innerText = week[d.getDay()];
			switch(d.getDay()){
				case 0:
					document.getElementById('yoil').innerText = week[d.getDay()] + "요일인 오늘은 주중에 구매하지 않은 사람만 구매할 수 있습니다."; // 일요일
					break;
				case 1:
					document.getElementById('yoil').innerText = week[d.getDay()] + "요일인 오늘은 생년월일 끝자리가 1, 6인 국민만 마스크를 구매할 수 있습니다."; // 월요일
					break;
				case 2:
					document.getElementById('yoil').innerText = week[d.getDay()] + "요일인 오늘은 생년월일 끝자리가 2, 7인 국민만 마스크를 구매할 수 있습니다."; // 화요일
					break;
				case 3:
					document.getElementById('yoil').innerText = week[d.getDay()] + "요일인 오늘은 생년월일 끝자리가 3, 8인 국민만 마스크를 구매할 수 있습니다."; // 수요일
					break;
				case 4:
					document.getElementById('yoil').innerText = week[d.getDay()] + "요일인 오늘은 생년월일 끝자리가 4, 9인 국민만 마스크를 구매할 수 있습니다."; // 목요일
					break;
				case 5:
					document.getElementById('yoil').innerText = week[d.getDay()] + "요일인 오늘은 생년월일 끝자리가 5, 0인 국민만 마스크를 구매할 수 있습니다."; // 금요일
					break;
				case 6:
					document.getElementById('yoil').innerText = week[d.getDay()] + "요일인 오늘은 주중에 구매하지 않은 사람만 구매할 수 있습니다."; // 토요일
					break;
				default:
					break;
			}
		</script>
		<span id="info_sellPage"><strong>이 페이지는 구매이력을 확인하기 위한 페이지입니다.</strong></span>
		<form action="buyLogRes.jsp" method="post" name="sellForm">
			<input id="juminSearch" name="juminSearch" type="text" placeholder="주민등록번호를 입력하세요." onKeyup="inputJu(this);" maxlength="14" onkeyPress="JavaScript:press(this.form)"></input>
		</form>
		
		<!-- <span id="checkYoilValid"></span>
		<span id="checkYoilInValid"></span>
		<span id="DateForNotBuy"></span> -->
	</div>
	
</body>

</html>