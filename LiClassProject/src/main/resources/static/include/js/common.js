/* 함수명 : chkSubmit(유효성 체크 대상, 매시지 내용)
 * 출력영역 : alert으로.
 * 예시 : if(!chkSubmit($('#keyword'), "검색어를")) return;
 */
function chkSubmit(item, msg){
	if(item.val().replace(/\s/g,"")==""){
		alert(msg + "입력해 주세요.");
		item.val("");
		item.focus();
		return false;
	} else{
		return true;
	}
}


/*
	함수명 : chkData(유효성 체크 대상, 메시지 내용)
	출력영역 : alert
	예시 : if (!chkData("#keyword", "검색어를")) return;
*/
function chkData(item, msg){
	if($(item).val().replace(/\s/g,"")==""){
		alert(msg+"입력해 주세요.");
		$(item).val("");
		$(item).focus();
		return false;
	} else{
		return true;
	}
}

/* 함수명 : checkForm(유효성 체크 대상, 메시지 내용)
   출력영역 : placeholder 속성을 이용.
   예시 : if(!checkForm("#keyword", "검색어를")) return;
*/
function checkForm(item, msg){
	let message = "";
	if($(item).val().replace(/\s/g,"")==""){
		message = msg + "입력해 주세요.";
		$(item).attr("placeholder", message);
		return false;
	} else{
		return true;
	}
}
/* 함수명 : formCheck(유효성 체크 대상, 출력영역, 메시지내용)
 * 출력영역 : 매개변수 두번째 출력 영역에.
 * 예시 : if(!formCheck('#keyword', '#msg', "검색어를")) return;
 */
function formCheck(main, item, msg){
	if($(main).val().replace(/\s/g,"")==""){
		$(item).css("color", "#000099").html(msg + "입력해 주세요.");
		$(main).val("");
		return false;
	} else{
		return true;
	}
}


/* 함수명 : chkFile(파일명 객체)
 * 설명 : 이미지 파일 여부를 확인하기 위해 확장자 확인 함수.
 * if (!chkFile($("#file"))) return;
 * */
function chkFile(item){
	/* 참고사항
	 * jQuery.inArray(찾을 값, 검색 대상의 배열) : 배열내의 값을 찾아서 인덱스를 반환(요소가 없을 경우 -1반환)
	 * pop() : 배열의 마지막 요소를 제거한 후, 제거한 요소를 반환
	 */
	let ext = item.val().split('.').pop().toLowerCase();
	if(jQuery.inArray(ext, ['gif', 'png', 'jpg']) == -1){
		alert('gif, png, jpg 파일만 업로드 할 수 있습니다.');
		item.val("");
		return false;
	} else {
		return true;
	}
}

/* 함수명 : getDateFormat(날짜 데이터)
 * 설명 : dataValue의 값을 년-월-일 형식(예시 : 2018-12-21)으로 반환 */
function getDateFormat(dateValue){
	let year = dateValue.getFullYear();

	let month = dateValue.getMonth()+1;
	month = (month<10) ? "0" + month : month;

	let day = dateValue.getDay();
	day = (day<10) ? "0" + day : day;

	let result = year + "-" + month + "-" + day;

	return result
}

/*
 * <<<유효성 체크 함수>>>
 * 함수명 : chkSel(유효성 체크대상, 메세지 내용)
 * 설명 : 선택요소(select, date..) 체크여부를 확인
 * 예시 : if(chkSel($("#keyword", ""))) return;
 * update 23.03.17 - 이경민
 */
 function chkSel(item, msg){
	 if( $(item).val()=="" ){
		 alert(msg+"선택해주세요.");
		 $(item).focus();
		 return false;
	 } else {
		 return true;
	 }
 }
 
 /*
 * <<<유효성 체크 함수>>>
 * 함수명 : chkRadio(유효성 체크대상, 메세지 내용)
 * 설명 : radio요소 체크여부를 확인
 * 예시 : if(chkRadio($("name", ""))) return;
 * update 23.03.17 - 이경민
 */
function chkRadio(item, msg){ //item == name의 이름
	if( $("input[name="+item+"]:radio:checked").length == 0 ){
		alert(msg+"체크해주세요.");
		return false;
	} else {
		return true;
	}
}

/*
 * <<<유효성 체크 함수>>>
 * 함수명 : chkNum(유효성 체크대상)
 * 설명 : 숫자값이 맞는지 확인하는 함수
 * 예시 : if(chkNum($("#keyword", ""))) return;
 * update 23.03.17 - 이경민*/
 
function chkNum(item, msg){
	if ( $.isNumeric( $(item).val() ) ) {
			return true;
		}else {
			alert(msg+'숫자만 입력해주세요.');
			return false;
		}
}