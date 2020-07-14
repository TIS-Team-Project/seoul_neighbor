<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<script>
$(document).ready(function(){
	//최종적으로 submit 하기 위해 점검 변수
	var id, email, pw, name;
	
	

	//아이디 입력 검증
	verifyID = function () {
	    
	    var userIDVal = $("#userId").val();
	    var regExp = /^[0-9a-z]{5,20}$/;
	    var pattern_special = /[~!@#$%^&*()_+|<>?:{}]\s/;
	    
	    if (userIDVal.match(regExp) != null) {
	        $("#userId").parent().removeClass("wrong-input");
	        $("#userId-wrong-text").removeClass("wrong-text-show");
	        $("#userIdV").addClass("vCheck-icon-show");
	        id = true;
	    }
	    else {
	        $("#userId").parent().addClass("wrong-input");
	        $("#userId-wrong-text").addClass("wrong-text-show");
	        $("#userIdV").removeClass("vCheck-icon-show");
	        id = false;
	    }
	}

	// 닉네임 입력 검증
	verifyNickName = function () {

	    var nickNameVal = $("#nickName").val();
	    var regExp = /^[\wㄱ-ㅎㅏ-ㅣ가-힣0-9a-zA-Z]{2,10}$/;
	    if (nickNameVal.match(regExp) != null) {
	        $("#nickName").parent().removeClass("wrong-input");
	        $("#nickName-wrong-text").removeClass("wrong-text-show");
	        $("#nickNameV").addClass("vCheck-icon-show");
	        name = true;
	    }
	    else {
	        $("#nickName").parent().addClass("wrong-input");
	        $("#nickName-wrong-text").addClass("wrong-text-show");
	        $("#nickNameV").removeClass("vCheck-icon-show");
	        name = false;
	    }
	}

	verifyEmail = function () {
	    // 이메일 검증 스크립트 작성
	    var emailVal = $("#email").val();

	    var regExp = /^[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*@[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*.[a-zA-Z]{2,3}$/i;

	    if (emailVal.match(regExp) != null) {
	        $("#email").parent().removeClass("wrong-input");
	        $("#email-wrong-text").removeClass("wrong-text-show");
	        $("#emailv").addClass("vCheck-icon-show");
	        email = true;
	    }
	    else {
	        $("#email").parent().addClass("wrong-input");
	        $("#email-wrong-text").addClass("wrong-text-show");
	        $("#emailv").removeClass("vCheck-icon-show");
	        email = false;
	    }
	}

	var pwVerifyOk = false; // 비밀번호 확인용
	verifyPW = function () {
	    // 비밀번호 검증 스크립트 작성
	    var pwVal = $("#pw").val();

	    var regExp = /^.*(?=^.{6,15}$)(?=.*\d)(?=.*[a-zA-Z])(?=.*[!@#$%^&+=]).*$/;

	    if (pwVal.match(regExp) != null) {
	        $("#pw").parent().removeClass("wrong-input");
	        $("#pw-wrong-text").removeClass("wrong-text-show");
	        $("#pwv").addClass("vCheck-icon-show");
	        pwVerifyOk=true;
	    }
	    else {
	        $("#pw").parent().addClass("wrong-input");
	        $("#pw-wrong-text").addClass("wrong-text-show");
	        $("#pwv").removeClass("vCheck-icon-show");
	        pwVerifyOk=false;
	    }
	}

	verifyPWcheck = function () {
	    // 비밀번호 확인 검증 스크립트 작성
	    var pwVal = $("#pw").val();
	    var pwCheck = $("#pwcheck").val();

	    if (pwVerifyOk&&pwVal == pwCheck) {
	        $("#pwcheck").parent().removeClass("wrong-input");
	        $("#pwc-wrong-text").removeClass("wrong-text-show");
	        $("#pwcv").addClass("vCheck-icon-show");
	        pw = true;
	    }
	    else {
	        $("#pwcheck").parent().addClass("wrong-input");
	        $("#pwc-wrong-text").addClass("wrong-text-show");
	        $("#pwcv").removeClass("vCheck-icon-show");
	        pw = false;
	    }
	}



	

	//버튼 누를시 전체 입력값 제대로 된지 검사하기
	verifyAll = function() {
		verifyID()
	    verifyEmail();
		verifyNickName();
	    verifyPW();
	    verifyPWcheck();
	    if(!email||!pw||!pwVerifyOk||!name||!phone){
	        return false;
	    }
	}
})
</script>