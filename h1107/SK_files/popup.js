// 2012/02/07 11:00 ~ 2012/02/27 15:00 - 공인인증서 개선 작업 안내 팝업
function popup() {
    var d1 = new Date();
    var d2 = new Date(2012, 2-1, 7, 11, 0);
    var d3 = new Date(2012, 2-1, 27, 15, 0);

    var time1 = d1.getTime();
    var time2 = d2.getTime();
    var time3 = d3.getTime();

    if (time1 > time2 && time1 < time3) {
        var noticeCookie = getCookies("120207_notice");

        if (noticeCookie != "no") {
            window.open("http://logon.skbroadband.com:8080/3rd/common/popup.html","120207_notice","width=380,height=390,left=10,top=15,scrollbars=no");
        }
    }
}
