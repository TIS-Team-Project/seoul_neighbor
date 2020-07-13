
//최종적으로 submit 하기 위해 점검 변수
var email, pw, name, phone;

//아이디 입력값 검증
verifyID = function () {
    
    var iDVal = $("#userId").val();
	
    //id 정규식, 영어소문자와 숫자만 사용가능
    var regExp = /^[0-9a-z]+$/;
    
    //특수문자 체크 정규식
    var pattern_spcial = /[~!@#$%^&*()_+|<>?:{}]\s/;

    if (idVal.match(pattern_spcial) == null) {
        $("#email").parent().removeClass("wrong-input");
        $("#email-wrong-text").removeClass("wrong-text-show");
        $("#emailv").addClass("checkicon-show");
        email = true;
    }
    else {
        $("#email").parent().addClass("wrong-input");
        $("#email-wrong-text").addClass("wrong-text-show");
        $("#emailv").removeClass("checkicon-show");
        email = false;
    }
}

//이메일 입력값 검증
verifyEmail = function () {
    
    var emailVal = $("#email").val();

    var regExp = /^[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*@[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*.[a-zA-Z]{2,3}$/i;

    if (emailVal.match(regExp) != null) {
        $("#email").parent().removeClass("wrong-input");
        $("#email-wrong-text").removeClass("wrong-text-show");
        $("#emailv").addClass("checkicon-show");
        email = true;
    }
    else {
        $("#email").parent().addClass("wrong-input");
        $("#email-wrong-text").addClass("wrong-text-show");
        $("#emailv").removeClass("checkicon-show");
        email = false;
    }
}

var pwVerifyOk = false; // 鍮꾨�踰덊샇 �뺤씤��
verifyPW = function () {
    // 鍮꾨�踰덊샇 寃�利� �ㅽ겕由쏀듃 �묒꽦
    var pwVal = $("#pw").val();

    var regExp = /^.*(?=^.{6,15}$)(?=.*\d)(?=.*[a-zA-Z])(?=.*[!@#$%^&+=]).*$/;

    if (pwVal.match(regExp) != null) {
        $("#pw").parent().removeClass("wrong-input");
        $("#pw-wrong-text").removeClass("wrong-text-show");
        $("#pwv").addClass("checkicon-show");
        pwVerifyOk=true;
    }
    else {
        $("#pw").parent().addClass("wrong-input");
        $("#pw-wrong-text").addClass("wrong-text-show");
        $("#pwv").removeClass("checkicon-show");
        pwVerifyOk=false;
    }
}

verifyPWcheck = function () {
    // 鍮꾨�踰덊샇 �뺤씤 寃�利� �ㅽ겕由쏀듃 �묒꽦
    var pwVal = $("#pw").val();
    var pwCheck = $("#pwcheck").val();

    if (pwVerifyOk&&pwVal == pwCheck) {
        $("#pwcheck").parent().removeClass("wrong-input");
        $("#pwc-wrong-text").removeClass("wrong-text-show");
        $("#pwcv").addClass("checkicon-show");
        pw = true;
    }
    else {
        $("#pwcheck").parent().addClass("wrong-input");
        $("#pwc-wrong-text").addClass("wrong-text-show");
        $("#pwcv").removeClass("checkicon-show");
        pw = false;
    }
}

verifyName = function () {
    // �대쫫 鍮덉뭏 寃�利� �ㅽ겕由쏀듃 �묒꽦
    var nameVal = $("#name").val();
    var regExp = /^[媛�-�즑-zA-Z]+$/;
    if (nameVal.match(regExp) != null) {
        $("#name").parent().removeClass("wrong-input");
        $("#name-wrong-text").removeClass("wrong-text-show");
        $("#namev").addClass("checkicon-show");
        name = true;
    }
    else {
        $("#name").parent().addClass("wrong-input");
        $("#name-wrong-text").addClass("wrong-text-show");
        $("#namev").removeClass("checkicon-show");
        name = false;
    }
}

verifyPhone = function () {
    //  �곕쾲 寃�利� �ㅽ겕由쏀듃 �묒꽦
    var namePhone = $("#phone").val();
    var regExp = "^01(?:0|1|[6-9])[.-]?(\\d{3}|\\d{4})[.-]?(\\d{4})$";
    if (namePhone.match(regExp) != null) {
        $("#phone").parent().removeClass("wrong-input");
        $("#phone-wrong-text").removeClass("wrong-text-show");
        $("#phonev").addClass("checkicon-show");
        phone = true;
    }
    else {
        $("#phone").parent().addClass("wrong-input");
        $("#phone-wrong-text").addClass("wrong-text-show");
        $("#phonev").removeClass("checkicon-show");
        phone = false;
    }
}

//踰꾪듉 �꾨��� �꾩껜 �낅젰媛� �쒕�濡� �쒖� 寃��ы븯湲�
verifyAll = function() {
    verifyEmail();
    verifyName();
    verifyPW();
    verifyPWcheck();
    verifyPhone();
    if(!email||!pw||!pwVerifyOk||!name||!phone){
        return false;
    }
}
