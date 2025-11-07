$(document).ready(function () {
  accordionbox(); //아코디언박스
  radioChoiceBtn();
  infoListAccordion();
  textareaFocus();
  secBanner(); // mys메인 하단 배너
  giftOpenBtn();
  giftCloseBtn();
  utubeCover();
  findInfoBox();
  subPriceTabs();
  serviceSwiper();
  searchSelect();
  customerCareSwiper();
  mainSiteSwiper();
  // sp 관련 이벤트
  spPageEvent();
  $(".qna_accordion-list .qna_accordion-btn").on("click", moveAccordion);
});
function searchSelect() {
  $(".search_select_box .search_input").keyup(function () {
    var searchSelectBox = $(this).parent();
    var searchList = $(this).siblings(".auto_complete").find(".search_select_list");
    var search = $(this).val();
    if (search == "") {
      $(searchSelectBox).removeClass("inputValid");
    } else {
      $(searchSelectBox).addClass("inputValid");
    }

    if ($(searchList).find("li").length == 0) {
      $(searchSelectBox).removeClass("active");
      console.log("match 없다");
    } else {
      $(".search_select_list>li").each(function () {
        $(searchSelectBox).addClass("active");
        var regex = new RegExp(search, "gi");

        console.log(regex);
        if (regex == "/(?:)/gi") {
          console.log("비었음");
          $(searchSelectBox).removeClass("active");
        }

        $(this)
          .find(".search_select_item")
          .html(
            $(this)
              .text()
              .replace(regex, "<em class='em'>" + search + "</em>")
          );
      });
    }
  });
  $(".search_select_item").on("click", function () {
    var changeValue = $(this).text().replace(/\s/gi, "");
    var selectInput = $(this).parents(".auto_complete").siblings(".search_input");
    $(selectInput).parents(".search_select_box").removeClass("active");
    selectInput.val(changeValue);
    // $(this).parents(".auto_complete").css("display", "none");
    // $(this).parents(".search_select_list").css("display", "none");
  });
}
function serviceSwiper() {
  var findSection = $(".detail_service-swiper").closest(".section");
  var findTarget = $(".detail_service-swiper").closest(".hits_cont-wrap");
  var addClassTarget = $(".detail_service-swiper").closest(".hits_section");

  $(findTarget).wrap('<div class="hits_section-full"></div>');
  $(addClassTarget).addClass("detail_service-section");
  $(findSection).addClass("full");

  var serviceSHeight = $(".detail_service-swiper").innerHeight();
  $(".detail_service-section").css("height", serviceSHeight + 102);
  var serviceS = new Swiper(".detail_service-swiper", {
    // width: 424,
    slidesPerView: "auto",
    // centeredSlides: true,
    spaceBetween: 24,
    navigation: {
      nextEl: ".other_next-btn",
      prevEl: ".other_prev-btn",
    },
  });
}
//subscript_info-box
function findInfoBox() {
  var infoBox = $(".subscript_info-box");

  infoBox.each(function () {
    if ($(this).siblings(".add_info-box").length > 0) {
      $(this).css("border-radius", "32px 32px 0 0");
    }
  });
}

function utubeCover() {
  var utube = $(".utube-con");

  utube.each(function () {
    var btn = $(this).find(".utube-play");
    btn.on("click", function () {
      btn.css("display", "none").siblings(".utube-cover").css("display", "none");
      btn.siblings("iframe")[0].src += "?autoplay=1&mute=1=1cc_load_policy=1";
    });
  });
}

function giftOpenBtn() {
  var giftBox = $(".sbtop_btv-gift");
  giftBox.each(function () {
    $(this).on("click", function () {
      var alarmMsg = $(this).siblings(".sbtop_btv-alarm");
      if (alarmMsg.css("display") == "none") {
        alarmMsg.css("display", "block");
        alarmMsg.css("visibility", "visible");
      }
    });
  });
}
function giftCloseBtn() {
  var closeBtn = $(".sbtop_btv-alarm_close");
  closeBtn.each(function () {
    $(this).on("click", function () {
      $(this).closest(".sbtop_btv-alarm").css("display", "none");
      $(this).closest(".sbtop_btv-alarm").css("visibility", "hidden");
    });
  });
}

function moveAccordion() {
  if ($(this).hasClass("active")) {
    $(this).removeClass("active");
    $(".qna_accordion-list .qna_accordion-con").stop().slideUp();
  } else {
    $(".qna_accordion-list .qna_accordion-btn").removeClass("active");
    $(this).addClass("active");
    $(".qna_accordion-list .qna_accordion-con").stop().slideUp();
    $(this).siblings(".qna_accordion-list .qna_accordion-con").stop().slideDown();
  }
}

function textareaFocus() {
  var txa = $(".textarea textarea");

  txa.each(function () {
    $(this).focus(function () {
      $(this).parent().addClass("active");
    });
    $(this).blur(function () {
      $(this).parent().removeClass("active");
    });
  });
}

//infoListAccordion
function infoListAccordion() {
  $(".sub_info-list .sub_info-tit").on("click", function () {
    if ($(this).hasClass("active")) {
      $(this).removeClass("active");
      $(".sub_info-list .sub_info-panel").stop().slideUp();
    } else {
      $(".sub_info-list .sub_info-tit").removeClass("active");
      $(this).addClass("active");
      $(".sub_info-list .sub_info-panel").stop().slideUp();
      $(this).next(".sub_info-list .sub_info-panel").stop().slideDown();
    }
  });
}

//radioChoiceBtn
function radioChoiceBtn() {
  var target = $(".radio_choice_box");

  target.each(function () {
    $(this).on("click", function () {
      $(this).find("label").focus().siblings("input").prop("checked", true);
    });
  });
}

//아코디언박스
function accordionbox() {
  var target = $(".accordionbox");

  target.each(function () {
    var btn = target.find(".accordionbox-bottom_btn");
    var spanTxt = target.find(".accordionbox-bottom_btn span");

    btn.on("click", function () {
      //$("#checkbox_01").focus();
      target.toggleClass("active").find(btn).toggleClass("active");
      target.find(".accordionbox-body").slideToggle(300);

      if (target.hasClass("active")) {
        $(this).find(spanTxt).html("닫기");
      } else {
        $(this).find(spanTxt).html("자세히 보기");
      }

      target.focus();
    });
  });
  ``;
}

// 하단 배너
function secBanner() {
  secBanner = new Swiper(".sec_bt_banner", {
    slidesPerView: 1,
    allowTouchMove: true,
    autoplay: true,
    loop: true,
    pagination: {
      el: ".sec_bt_banner .swiper-pagination",
      type: "bullets",
      bulletElement: "button",
      clickable: true,
    },
    navigation: {
      nextEl: ".swiper-button-next",
      prevEl: ".swiper-button-prev",
    },
  });

  $(".sec_bt_banner .swiper-control").on("click", function () {
    if ($(this).hasClass("stop")) {
      $(this).removeClass("stop").attr("title", "슬라이드 멈춤");
      secBanner.autoplay.start();
    } else {
      $(this).addClass("stop").attr("title", "슬라이드 재생");
      secBanner.autoplay.stop();
    }
  });
}

function subPriceTabs() {
  $(".price_tab-header").each(function () {
    var targetBtn = $(this).find(".tab_link-btn");

    targetBtn.on("click", function () {
      if ($(this).hasClass("disabled")) {
        return;
      }

      $(this).addClass("active").siblings(".tab_link-btn").removeClass("active");
      var tabIndex = $(this).index();
      var content = targetBtn.closest(".price_tab-header").siblings(".price_tab-cont").children(".price_tab-item");
      $(content).removeClass("active").attr("tabindex", 0);
      $(content[tabIndex]).addClass("active").attr("tabindex", 1);
    });
    //targetBtn.eq(0).click();
  });
}
// sm_4023
function customerCareSwiper() {
  // var mySwiper = new Swiper(".care_intro-swiper", {
  //   slidesPerView: "auto",
  //   watchSlidesProgress: true,
  //   spaceBetween: 24,
  //   navigation: {
  //     nextEl: ".care_intro_next-btn",
  //     prevEl: ".care_intro_prev-btn",
  //   },
  // });
  var customerCareSHeight = $(".care_intro-swiper").innerHeight();
  var customerCareHeadHeight = $(".care_intro-section .hits_horizon-title").innerHeight();
  $(".care_intro-section").css("height", customerCareSHeight + customerCareHeadHeight);
  $(".care_intro-swiper").each(function (index, element) {
    var $this = $(this);
    var $btnWrap = $(this).parents(".hits_cont-wrap").find(".swipe_btn-wrap");
    $this.addClass("instance-" + index);
    $btnWrap.find(".care_intro_next-btn").addClass("instance-" + index + "-next");
    $btnWrap.find(".care_intro_prev-btn").addClass("instance-" + index + "-prev");

    var swiper = new Swiper(".instance-" + index, {
      slidesPerView: "auto",
      watchSlidesProgress: true,
      spaceBetween: 24,
      navigation: {
        nextEl: ".instance-" + index + "-next",
        prevEl: ".instance-" + index + "-prev",
      },
    });
  });

  var customerCareS2Height = $(".care_advance-item").innerHeight();
  // console.log(customerCareS2Height + 100);
  $(".care_advance-section").css("height", customerCareS2Height + 100);

  var customerCareS2 = new Swiper(".care_advance-swiper", {
    slidesPerView: "auto",
    watchSlidesProgress: true,
    spaceBetween: 24,
    navigation: {
      nextEl: ".care_advance_next-btn",
      prevEl: ".care_advance_prev-btn",
    },
  });
}

function mainSiteSwiper() {
  var mainSiteS = new Swiper(".products_site-contents", {
    // autoplay: { delay: 1 },
    // loop: true,
    // speed: 3000,
    slidesPerView: "auto",
    spaceBetween: 40,
  });
}
// sp 스크립트
function spPageEvent() {
  var spPageItemHeight = $(".intro_prod-list").innerHeight();
  $(".product_use-section").css("height", spPageItemHeight + 140);

  var spProductS = new Swiper(".intro_prod_box-wrap", {
    slidesPerView: "auto",
    spaceBetween: 24,
    navigation: {
      prevEl: ".prod_prev-btn",
      nextEl: ".prod_next-btn",
    },
  });
  var spOtherProdS = new Swiper(".other_prod-wrap", {
    slidesPerView: "auto",
    spaceBetween: 24,
    navigation: {
      nextEl: ".other_next-btn",
      prevEl: ".other_prev-btn",
    },
  });
  var spBannerS = new Swiper(".section_banner-wrap", {
    height: "100",
    direction: "vertical",
    slidesPerView: 1,
    autoplay: true,
    loop: true,
  });
  var spConsumerS = new Swiper(".consumer-service-swiper", {
    slidesPerView: "auto",
    spaceBetween: 24,
    navigation: {
      nextEl: ".consumer-service-next",
      prevEl: ".consumer-service-prev",
    },
  });
}
