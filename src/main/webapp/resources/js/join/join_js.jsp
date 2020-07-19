<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<script>
$(document).ready(function(){
	//최종적으로 submit 하기 위해 점검 변수(클라이언트측 입력형식 검증)
	var id, email, pw, name, location;
	
	var csrfHeaderName = "${_csrf.headerName}";
	var csrfTokenValue = "${_csrf.token}";
	
	var isEmailDuplicated = true; //이메일 주소가 중복되었는가? 중복이다 = true || 중복아니다 = false
	var isSendEmail = false; // 이메일로 인증번호 발송 여부 체크
	var isEmailCompleted = false // 이메일 인증이 완료되었는가? 완료 = true || 노완료 = false
			
	//의도치 않은 백스페이스 이벤트 방지
	$(document).keydown(function(e) {
        if(e.target.nodeName != "INPUT"){
            if(e.keyCode == 8){
                return false;
           }
        }
 
        if(e.target.readOnly){ // readonly일 경우 true
            if(e.keyCode == 8){
                return false;
           }
        }
    });

	//아이디 입력 검증
	verifyID = function () {
	    
	    var userIDVal = $("#userId").val();
	    var regExp = /^[0-9a-z]{5,20}$/;
	    var pattern_special = /[~!@#$%^&*()_+|<>?:{}]\s/;
	    
	    
	    $("#userId-duplicated-text").removeClass("wrong-text-show");
	    $("#userId-wrong-text").removeClass("wrong-text-show");
	    $("#userId").parent().removeClass("wrong-input");
	    
	    if (userIDVal.match(regExp) != null) {
	        $("#userIdV").addClass("vCheck-icon-show");
	        id = true; //아이디가 형식에 맞게 작성이 되있음
	    }
	    else {
	        $("#userId").parent().addClass("wrong-input");
	        $("#userId-wrong-text").addClass("wrong-text-show");
	        $("#userIdV").removeClass("vCheck-icon-show");
	        id = false; //아이디가 형식에 맞지 않음
	    }
	    
	    //id가 형식에 맞다면 ajax로 중복된 값인지 체크
	    if(id){
	    	var idStatus;
	    	$.ajax({
	    		url: "/checkId/" + userIDVal,
	    		type: "GET",
	    		dataType: "text",
	    		success: function(result, status, xhr){
	    			console.log(result);
	    			idStatus = result;
	    			if(idStatus == 'duplicated'){
	    	    		console.log("idStatus : " + idStatus);
	    	    		
	    	    		$("#userId").parent().addClass("wrong-input");
	    	    		$("#userId-duplicated-text").addClass("wrong-text-show");
	    	    		$("#userIdV").removeClass("vCheck-icon-show");
	    	    	}
	    		}
	    	});
	    }
	    
	}

	// 닉네임 입력 검증
	verifyNickName = function () {

	    var nickNameVal = $("#nickName").val();
	    var regExp = /^[\wㄱ-ㅎㅏ-ㅣ가-힣0-9a-zA-Z]{2,10}$/;
	    
	    $("#nickName-duplicated-text").removeClass("wrong-text-show");
	    $("#nickName-wrong-text").removeClass("wrong-text-show");
	    $("#nickName").parent().removeClass("wrong-input");
	    
	    if (nickNameVal.match(regExp) != null) {
	        $("#nickNameV").addClass("vCheck-icon-show");
	        name = true;
	    }
	    else {
	        $("#nickName").parent().addClass("wrong-input");
	        $("#nickName-wrong-text").addClass("wrong-text-show");
	        $("#nickNameV").removeClass("vCheck-icon-show");
	        name = false;
	    }
	    
	  //닉네임이 형식에 맞다면 ajax로 중복된 값인지 체크
	    if(name){
	    	var nameStatus;
	    	$.ajax({
	    		url: "/checkNickName/" + nickNameVal,
	    		type: "GET",
	    		dataType: "text",
	    		success: function(result, status, xhr){
	    			console.log(result);
	    			nameStatus = result;
	    			if(nameStatus == 'duplicated'){
	    	    		console.log("nameStatus : " + nameStatus);
	    	    		
	    	    		$("#nickName").parent().addClass("wrong-input");
	    	    		$("#nickName-duplicated-text").addClass("wrong-text-show");
	    	    		$("#nickNameV").removeClass("vCheck-icon-show");
	    	    	}
	    		}
	    	});
	    }
	}

	// 이메일 검증 스크립트 작성
	verifyEmail = function () {
	    
	    var emailVal = $("#email").val();
	    var regExp = /^[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*@[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*.[a-zA-Z]{2,3}$/i;

	    $("#email-duplicated-text").removeClass("wrong-text-show");
	    $("#email-wrong-text").removeClass("wrong-text-show");
	    $("#email").parent().removeClass("wrong-input");
	    
	    if (emailVal.match(regExp) != null) {
	        $("#emailv").addClass("vCheck-icon-show");
	        email = true;
	    }
	    else {
	        $("#email").parent().addClass("wrong-input");
	        $("#email-wrong-text").addClass("wrong-text-show");
	        $("#emailv").removeClass("vCheck-icon-show");
	        email = false;
	    }
	    
	  //이메일이 형식에 맞다면 ajax로 중복된 값인지 체크
	    if(email){
	    	var emailStatus;
	    	$.ajax({
	    		url: "/checkEmail",
	    		type: "GET",
	    		beforeSend: function(xhr){
					xhr.setRequestHeader(csrfHeaderName, csrfTokenValue)
				},
	    		data: {'email' : emailVal},
	    		contentType: "application/x-www-form-urlencoded; charset=UTF-8",
	    		dataType: "text",
	    		success: function(result, status, xhr){
	    			console.log(result);
	    			emailStatus = result;
	    			if(emailStatus == 'duplicated'){
	    	    		console.log("emailStatus : " + emailStatus);
	    	    		isEmailDuplicated = true;
	    	    		$("#email").parent().addClass("wrong-input");
	    	    		$("#email-duplicated-text").addClass("wrong-text-show");
	    	    		$("#emailv").removeClass("vCheck-icon-show");
	    	    	} else {
	    	    		isEmailDuplicated = false;
	    	    	}
	    		}
	    	});
	    }
	}
	
	//이메일 인증번호전송 버튼을 눌렀을 때
	$("#emailSend").on("click",function(e){
		e.preventDefault();
		verifyEmail();
		
		var toSend = $("#email").val();
		var temp = "";
		
		temp += '<div id="emailAuthContainer" class="input-container">';
   		temp += '<input id="emailAuthInput" name="emailAuth" type="text" class="input-field" placeholder="이메일로 인증번호가 발송되었습니다.">';
   		temp += '<button id="emailAuthBtn" type="button" class="btn btn-outline-secondary">인증</button>';
   		temp += '<input id="originEmailNum" type="hidden" value="">';
   		temp += '</div>';
   		temp += '<p id="auth-wrong-text" class="wrong-text-hide">인증실패! 인증번호를 다시 확인해주세요.</p>';
   		
		if(email && !isEmailDuplicated){
			$("#inputEmail").append(temp);
			$("#email").attr("readonly", true);
			$("#emailSend").off("click");
			$("#certification-not-text").removeClass("wrong-text-show");
			$.ajax({
				url: "/sendAuthMail",
				type: "GET",
				data: {
					'email' : toSend
				},
				contentType: "application/x-www-form-urlencoded; charset=UTF-8",
				dataType: "text",
				success: function(result, status, xhr){
	    			console.log(result);
	    			$("#originEmailNum").val(result);
	    			isSendEmail = true;
	    		}
			});
		}
	});
	
	//사용자가 자신 이메일에 발송된 인증번호를 입력하고 인증 버튼을 누를 시
	$("#inputEmail").delegate("#emailAuthBtn", "click", function(e){
		e.preventDefault();
		var userNumber = $("#emailAuthInput").val(); //사용자가 입력한 인증번호
		var originNumber = $("#originEmailNum").val(); //서버에서 넘겨받은 인증번호 정답
		
		var dataForCompare = {"userNumber" : userNumber, "originNumber" : originNumber};
		console.log(dataForCompare);
		
		if(userNumber){
			$.ajax({
				url: "/compareEmailAuth",
				type: "POST",
				beforeSend: function(xhr){
					xhr.setRequestHeader(csrfHeaderName, csrfTokenValue)
				},
				data: JSON.stringify(dataForCompare),
				dataType: "text",
				contentType: "application/json",
				success: function(result){
					console.log("받아온 결과값 : " + result);
					if(result === 'same'){
						$("#auth-wrong-text").removeClass("wrong-text-show");
						$("#inputEmail").append("<p>인증이 정상적으로 완료되었습니다.</p>");
						$("#emailAuthInput").attr("readonly", true);
						isEmailCompleted = true;
					} else if(result === 'different'){
						$("#auth-wrong-text").addClass("wrong-text-show");
					}
				}
			});
		}
	});
	
	
	verifyEmailCertification = function() {
		if(!isSendEmail || !isEmailCompleted){
	        $("#certification-not-text").addClass("wrong-text-show");
		} else {
			$("#certification-not-text").removeClass("wrong-text-show");
		}
	}
	
	// 비밀번호 검증 스크립트 작성
	var pwVerifyOk = false; // 비밀번호 확인용
	verifyPW = function () {
	   
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

	// 비밀번호 확인 검증 스크립트 작성
	verifyPWcheck = function () {
	    
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
	
	// 지역선택 검증 스크립트
	verifyLocation = function () {
	    
	    var locationVal = $("#memberLocation").val();

	    if (locationVal) {
	        $("#memberLocation").parent().removeClass("wrong-input");
	        $("#location-wrong-text").removeClass("wrong-text-show");
	        $("#locationV").addClass("vCheck-icon-show");
	        location = true;
	    }
	    else {
	        $("#memberLocation").parent().addClass("wrong-input");
	        $("#location-wrong-text").addClass("wrong-text-show");
	        $("#locationV").removeClass("vCheck-icon-show");
	        location = false;
	    }
	}
	
	
	//지역선택?
	$("#memberLocation").focus(function(){
		$("#memberLocation").trigger("blur");
		new daum.Postcode({
            oncomplete: function(data) {
                gu = data.sigungu; // 구
				dong = data.bname; // 동
                console.log(gu+' '+dong);
				$("#memberLocation").val(gu+" "+dong)
				verifyLocation();
            }
        }).open();
		
		
	});
	

	//버튼 누를시 전체 입력값 제대로 된지 검사하기
	verifyAll = function() {
		verifyID()
	    verifyEmail();
		verifyNickName();
	    verifyPW();
	    verifyPWcheck();
	    verifyLocation();
	    verifyEmailCertification();
	    if(!email||!pw||!pwVerifyOk||!name||!location||!isSendEmail||!isEmailCompleted){
	        return false;
	    }
	}
	
	$(".submit-btn").click(function(e){
		e.preventDefault();
		verifyID()
	    verifyEmail();
		verifyNickName();
	    verifyPW();
	    verifyPWcheck();
	    verifyLocation();
	    verifyEmailCertification();
	    if(email && pw && pwVerifyOk && name && location && isSendEmail && isEmailCompleted){
	        $("#joinForm").submit();
	    }
	})

})
</script>