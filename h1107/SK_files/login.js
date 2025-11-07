function getCookies(name) {
    var Found = false;
    var start, end;
    var i = 0;

    while (i <= document.cookie.length) {
        start = i;
        end = start + name.length;
        if (document.cookie.substring(start, end) == name) {
            Found = true;
            break;
        }
        i++;
    }

    if (Found == true) {
        start = end + 1;
        end = document.cookie.indexOf(";", start);
        if (end < start) {
            end = document.cookie.length;
        }
        return document.cookie.substring(start, end);
    }

    return "";
}

function setCookie(name, value) {
    var argv = setCookie.arguments;
    var argc = setCookie.arguments.length;
    var expires = (argc > 2) ? argv[2] : null;
    var path    = (argc > 3) ? argv[3] : null;
    var domain  = (argc > 4) ? argv[4] : null;
    var secure  = (argc > 5) ? argv[5] : false;

    document.cookie = name + "=" + escape (value) +
    ((expires == null) ? "" : ("; expires=" + expires.toGMTString())) +
    ((path == null) ? "" : ("; path=" + path)) +
    ((domain == null) ? "" : ("; domain=" + domain)) +
    ((secure == true) ? "; secure" : "");
}


function saveidCookie() {
    var todayDate = new Date();

    if (document.submitform1.idcheck.checked) {
        todayDate.setDate(todayDate.getDate() + 30);
        setCookie("ssologonuidfield", document.submitform1.userid.value, todayDate, "/");
    }
    else {
        todayDate.setDate(todayDate.getDate() - 30);
        setCookie("ssologonuidfield", "", todayDate, "/");
    }
}

function savepryrnoCookie() {
    var todayDate = new Date();

    if (document.submitform2.idcheck.checked) {
        todayDate.setDate(todayDate.getDate() + 30);
        setCookie("ssologonpayrnofield", document.submitform2.payr_no.value, todayDate, "/");
    }
    else {
        todayDate.setDate(todayDate.getDate() - 30);
        setCookie("ssologonpayrnofield", "", todayDate, "/");
    }
}

function getssoid() {
    var UID = getCookies("ssologonuidfield");
    if (UID == null || UID == "") {
        document.submitform1.userid.focus();
    }
    else {
        document.submitform1.userid.value = UID;
        document.submitform1.idcheck.checked = true;
        document.submitform1.password.focus();
    }

    popup();
}

function getpayrno() {
    var UID = getCookies("ssologonpayrnofield");
    if (UID == null || UID == "") {
        document.submitform2.payr_no.focus();
    }
    else {
        document.submitform2.payr_no.value = UID;
        document.submitform2.idcheck.checked = true;
        document.submitform2.rrn_brn1.focus();
    }
}

//아이디 특수문자체크(한글 영문 숫자 "_" "-")
function checkID(checkStr) {
    var TEXT = "~!@#$%^&*()+|\=`,.><?/＃＆＊＠§※☆★ㅁ○●ㅋ◎◇◆□■△▲▽▼→←↑↓↔〓◁◀▷▣♤♠♡♥♧♣⊙◈▣◐◑▒▤▥▨▦▩♨☏☎☜☞";
    for (i = 0; i < checkStr.length; i++) {
        ch = checkStr.charAt(i);
        for (j = 0; j < TEXT.length; j++) {
            if (ch == TEXT.charAt(j)) {
                return (false);
                break;
            }
        }
    }
    return (true);
}

// 주민등록번호 체크 (값을 하나로 받을때)
function isValidJumin(el) {
    var pattern = /^([0-9]{6})-?([0-9]{7})$/;
    var num = el;
    if (!pattern.test(num)) return false;
    num = RegExp.$1 + RegExp.$2;

    var sum = 0;
    var last = num.charCodeAt(12) - 0x30;
    var bases = "234567892345";
    for (i=0; i<12; i++) {
        if (isNaN(num.substring(i,i+1))) return false;
        sum += (num.charCodeAt(i) - 0x30) * (bases.charCodeAt(i) - 0x30);
    }
    var mod = sum % 11;
    return ((11 - mod) % 10 == last) ? true : false;
}

// 사업자등록번호 체크
function isValidBizNo(el) {
    var pattern = /([0-9]{3})-?([0-9]{2})-?([0-9]{5})/;
    var num = el;
    if (!pattern.test(num)) return false;
        num = RegExp.$1 + RegExp.$2 + RegExp.$3;
    var cVal = 0;
    for (var i=0; i<8; i++) {
        var cKeyNum = parseInt(((_tmp = i % 3) == 0) ? 1 : ( _tmp  == 1 ) ? 3 : 7);
        cVal += (parseFloat(num.substring(i,i+1)) * cKeyNum) % 10;
    }
    var li_temp = parseFloat(num.substring(i,i+1)) * 5 + '0';
    cVal += parseFloat(li_temp.substring(0,1)) + parseFloat(li_temp.substring(1,2));
    return (parseInt(num.substring(9,10)) == 10-(cVal % 10)%10) ? true : false;
}

// 사업자등록번호 체크 2
function isValidBizNo2(el) {
    var a = new Array;
    var b = new Array(1,3,7,1,3,7,1,3,5);
    var sum = 0;

    for (i = 0; i < 10; i++) a[i] = el.substr(i,1);
    for (i = 0; i < 9;  i++) sum = sum + (a[i] * b[i]);

    sum = sum + ((a[8] * 5) / 10);
    y = (sum - (sum % 1)) % 10;

    if (y == 0)
        z = 0;
    else
        z = 10 - y;

    if (z != a[9]) {
        return false;
    }

    return true;
}

// 주민번호 앞자리 입력시 뒷자리 입력칸으로 자동이동
function AutoCursor(fm) {
    if (fm.rrn_brn1.value.length > 5) {
        fm.rrn_brn2.focus();
        fm.rrn_brn2.select();
    }
}

function checkkey1(fm) {
    if (event.keyCode == 13) {
        if (fm.payr_no.value.length < 1) {
            fm.payr_no.select();
            return false;
        }
        else if (fm.rrn_brn1.value.length != 6) {
            fm.rrn_brn1.select();
            return false;
        }
        else if (fm.rrn_brn2.value.length != 7) {
            fm.rrn_brn2.select();
            return false;
        }
        else if (fm.payr_pwd.value.length < 1) {
            fm.payr_pwd.select();
            return false;
        }
        else
            MemberSubFormCheck1(fm);
    }
    else
        return false;
}

function MemberSubFormCheck1(fm) {
    // 2010/02/18 01:00 ~ 2010/02/18 07:00 - 인증 불가
    var d1 = new Date();
    var d2 = new Date(2010, 2-1, 18, 1, 00);
    var d3 = new Date(2010, 2-1, 18, 7, 00);

    var time1 = d1.getTime();
    var time2 = d2.getTime();
    var time3 = d3.getTime();

    if (time1 > time2 && time1 < time3) {
        alert("작업내용 : 웹로그인 서비스 점검\n작업시간 : 2010년 2월 18일 (목) 01:00 ~ 07:00 (6시간)\n영향 : www.skbroadband.com 인증 및 사이버고객센터 서비스 중단\n주관업체 : SK브로드밴드(주)\n\n작업시간 동안은 납입자로그인을 사용하실 수 없습니다.");
        return false;
    }

    if (fm.payr_no.value == "") {
        alert("납입자번호를 입력하세요");
        fm.payr_no.select();
        return false;
    }
    else if (fm.rrn_brn1.value == "") {
        alert("주민번호를 입력하세요");
        fm.rrn_brn1.select();
        return false;
    }
    else if (fm.rrn_brn2.value == "") {
        alert("주민번호를 입력하세요");
        fm.rrn_brn2.select();
        return false;
    }
    else if (fm.payr_pwd.value == "") {
      alert("비밀번호를 입력하세요");
      fm.payr_pwd.select();
      return false;
    }
    else {
        savepryrnoCookie();
    }

    if (EncForm(document.submitform2)) {
        document.submitform2.submit();
        return false;
    }
    else {
        alert("고객 정보 보호를 위한 암호화모듈이 제대로 로딩되지 않았습니다.");
    }

    return false;
}


//
// 공인인증측 스크립트 함수 모음
//
function tab02menu(val) {
    eval("document.tab02_1.src='/3rd/images/menu_skin03tab_01.gif';");
    eval("document.tab02_2.src='/3rd/images/menu_skin03tab_02.gif';");
    eval("document.tab02_"+val+".src='/3rd/images/menu_skin03tab_0"+val+"_on.gif';");
}

function tab02menu_view(val) {
    for (i=1; i<=2; i++) { //메뉴수에 따라 i 값을 늘림.
        if (i == val)
            eval("tab02menu_"+i+".style.display='';");
        else
            eval("tab02menu_"+i+".style.display='none';");
    }
}

function checkkey2(fm) {
    if (event.keyCode == 13) {
        if (fm.rrn_brn1.value.length != 6) {
            fm.rrn_brn1.select();
            return false;
        }
        else if (fm.rrn_brn2.value.length != 7) {
            fm.rrn_brn2.select();
            return false;
        }
        else
            MemberSubFormCheck2(fm);
    }
    else
        return false;
}

function MemberSubFormCheck2(fm) {
    // 2012/10/21 00:00 ~ 2012/10/21 06:00 - 인증 불가
    var d1 = new Date();
    var d2 = new Date(2012, 10-1, 21, 00, 00);
    var d3 = new Date(2012, 10-1, 21, 06, 00);

    var time1 = d1.getTime();
    var time2 = d2.getTime();
    var time3 = d3.getTime();

    if (time1 > time2 && time1 < time3) {
        alert("작업내용 : 웹로그인 서비스 점검\n작업시간 : 2012년 10월 21일 (일) 00:00 ~ 06:00 (6시간)\n영향 : www.skbroadband.com 인증 및 사이버고객센터 서비스 중단\n주관업체 : SK브로드밴드(주)\n\n작업시간 동안은 공인인증로그인을 사용하실 수 없습니다.");
        return false;
    }

    var ssn = fm.rrn_brn1.value + fm.rrn_brn2.value;

    if (isNaN(fm.rrn_brn1.value)) {
        alert("주민번호 입력값이 숫자가 아닙니다");
        fm.rrn_brn1.value = "";
        fm.rrn_brn1.focus();
        return false;
    }
    else if (isNaN(fm.rrn_brn2.value)) {
        alert("주민번호 입력값이 숫자가 아닙니다");
        fm.rrn_brn2.value = "";
        fm.rrn_brn2.focus();
        return false;
    }
    else if (fm.rrn_brn1.value == "" || fm.rrn_brn1.value.length != 6) {
        alert("주민번호를 입력하세요");
        fm.rrn_brn1.select();
        return false;
    }
    else if (fm.rrn_brn2.value == "" || fm.rrn_brn2.value.length != 7) {
        alert("주민번호를 입력하세요");
        fm.rrn_brn2.select();
        return false;
    }
    else if (fm.rrn_brn2.value.substr(0,1) == '5' ||
             fm.rrn_brn2.value.substr(0,1) == '6' ||
             fm.rrn_brn2.value.substr(0,1) == '7' ||
             fm.rrn_brn2.value.substr(0,1) == '8') {
            ;
    }
    else if(!isValidJumin(ssn)) {
        alert("주민번호를 다시 확인해 주시기 바랍니다");
        fm.rrn_brn1.focus();
        return false;
    }

    if (ssn != "9999999999999") {
        var URL = "";
        URL = "http://logon.skbroadband.com:8080/3rd/cyberLogin.jsp?resdNo=" + ssn;
        document.getElementById("iframe1").src = EncLocation(URL);
        return false;
    }

    InitCache();

    if (EncFormVerify2(document.readForm, document.sendForm)) {
        document.sendForm.submit();
        return false;
    }
    else {
//      alert("보안상 문제가 생겨 전송이 취소 되었습니다.");
    }

    return false;
}

function checkkey3(fm) {
    if (event.keyCode == 13) {
        if (fm.bizno.value.length != 10) {
            fm.bizno.select();
            return false;
        }
        else
            MemberSubFormCheck3(fm);
    }
    else
        return false;
}

function MemberSubFormCheck3(fm) {
    // 2012/10/21 00:00 ~ 2012/10/21 06:00 - 인증 불가
    var d1 = new Date();
    var d2 = new Date(2012, 10-1, 21, 00, 00);
    var d3 = new Date(2012, 10-1, 21, 06, 00);

    var time1 = d1.getTime();
    var time2 = d2.getTime();
    var time3 = d3.getTime();

    if (time1 > time2 && time1 < time3) {
        alert("작업내용 : 웹로그인 서비스 점검\n작업시간 : 2012년 10월 21일 (일) 00:00 ~ 06:00 (6시간)\n영향 : www.skbroadband.com 인증 및 사이버고객센터 서비스 중단\n주관업체 : SK브로드밴드(주)\n\n작업시간 동안은 공인인증로그인을 사용하실 수 없습니다.");
        return false;
    }

    if (isNaN(fm.bizno.value)) {
        alert("사업자등록번호 입력값이 숫자가 아닙니다");
        fm.bizno.value = "";
        fm.bizno.focus();
        return false;
    }
    else if (fm.bizno.value == "" || fm.bizno.value.length < 10) {
        alert("사업자등록번호를 입력하세요");
        fm.bizno.select();
        return false;
    }
    else if (!isValidBizNo2(fm.bizno.value)) {
        alert("사업자등록번호를 다시 확인해 주시기 바랍니다");
        fm.bizno.focus();
        return false;
    }

    if (fm.bizno.value != "9999999999") {
        var URL = "";
        URL = "http://logon.skbroadband.com:8080/3rd/cyberLogin.jsp?resdNo=" + fm.bizno.value;
        document.getElementById("iframe1").src = EncLocation(URL);
        return false;
    }

    InitCache();

    if (EncFormVerify2(document.readForm2, document.sendForm2)) {
        document.sendForm2.submit();
        return false;
    }
    else {
//      alert("보안상 문제가 생겨 전송이 취소 되었습니다.");
    }

    return false;
}
