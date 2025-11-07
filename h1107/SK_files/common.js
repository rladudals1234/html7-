$(document).ready(function () {
  accordion(); //공통아코디언
  inputClear(); //input clear button
  $(".open-modal").on("click", openModal); //modal popup
  $(".open-modal-to").on("click", openModalTo); //modal to modal popup

  $(".close_popup").on("click", closeSystemPopup); //close System Popup
  // modal click to outside
  $(document).mouseup(function (e) {
    clickModalOut(e);
  });

  $(".open-change").on("click", openChangeTab); // show tab
  $(".open-register").on("click", showContents); // show contents
  //info_box(); //info_box

  // $(".play_icon").on("click", onChangePlayIcon); // change video play Icon

  //subTabsLink(); //tabsLink
  pageTabsDepthLink(); //pageDepth tabs
  subTabsSlide(); //subTabsSlide
  depthOneTabs(); // depthOne tabs
  depthTwoTabs(); // depthTwo tabs
  subTabs(); //tabs
  pageTabsDepth(); //pageDepth tabs
  contentTabs(); // contents tabs
  tolltips(); //tolltips btn
  videoCoverPlay(); //video cover play

  mainObjectSlide();

  $(".btn-complete").on("click", openNextAccodion); // open next accordion
  $(".btn-modify").on("click", openModify); // open current Modify accordion
  $(".btn-prev").on("click", openPrevAcc); // open prev step accordion

  onChangeRadio(); // radio checked

  openPopup(); // popup
  //selectbox <---------
  renderPaginations(); //paginations
  selectbox();
  selectInit();
  locationBtn();
  $(document).on("click", function (event) {
    selectObserverOpened(event);
    locationClose(event);
  });
  //selectbox --------->
  //scrollbar
  if ($(document).find(".scrollBar").length > 0) {
    scrollbar();
  }

  // textarea
  if ($("#textarea_box").length > 0) {
    textareaCount();
  }

  checkRadioEtc(); //click radio etc btn
  checkedShowInfo(); //after checkbox show Info

  doClickCBox();

  // sp_3001 ~
  $(".product_check-box .checkbox label").on("click", showMoreDetails);
  clickMoreDetails();

  //tab top fixed
  if ($(document).find(".detail_tab-wrap.sticky").length > 0) {
    tabSticky();
  }
});

function locationBtn() {
  var loBtn = $(".location_btn");
  loBtn.each(function () {
    $(this).on("click", function () {
      if ($(this).hasClass("active")) {
        $(this).removeClass("active");
      } else {
        loBtn.removeClass("active");
        $(this).addClass("active");
      }
    });
  });
}

function locationClose(event) {
  const loClose = $(event.currentTarget).find(".location_btn").length > 0;
  var loBtn = $(".location_btn");
  if (loClose) {
    if ($(event.target).parents(".location_item").length > 0) {
      // loBtn.each(function () {
      //   $(this).on("click", function () {
      //     loBtn.removeClass("active");
      //     $(this).addClass("active");
      //   });
      // });
    } else {
      loBtn.removeClass("active");
    }
  } else {
    return;
  }
}

// 공통아코디언
function accordion() {
  var $acdName = $(".acdArea");
  var $acdBt = $acdName.find(".acdBtn");
  var $acdCt = $acdName.find(".acdCont");
  $acdBt.each(function () {
    $(this).on("click", function (e) {
      e.preventDefault();
      var $this = $(this);
      var $acdBtnParent = $(this).parent();
      //나 외의것 눌렀을때
      $this.parent(".info_box").siblings().find(".acdBtn").removeClass("active");
      $this.closest($acdName).find(".acdBtn").not($this.toggleClass("active")).removeClass("active");
      $this
        .parent()
        .siblings()
        .find(".acdCont")
        .slideUp(150, function () {
          setTimeout(function () {
            $acdBtnParent.siblings().find($acdCt).css({ visibility: "hidden" });
          }, 100);
        });

      if ($this.hasClass("active")) {
        $acdBtnParent.find($acdCt).slideDown(150).css({ visibility: "visible" });
      } else {
        $acdBtnParent.find($acdCt).slideUp(150, function () {
          setTimeout(function () {
            $acdBtnParent.find($acdCt).css({ visibility: "hidden" });
          }, 100);
        });
      }
    });
  });
}

// 작업 완료 후 삭제 예정 (포커스 위치 console확인기능)
document.addEventListener("keyup", (e) => {
  if (e.keyCode === 9) {
    console.log(document.activeElement);
  }
});

// tab
// function subTabsLink() {
//   $(".detail_tab-header").each(function () {
//     var targetBtn = $(this).find(".tab_link-btn");
//     var tabIndex = $(this).index();
//     var content = targetBtn.closest(".detail_tab-header").siblings(".detail_tab-cont").find(".detail_tab-item");

//     if ($(this).hasClass("disabled")) {
//       return;
//     }

//     if ($(this).hasClass("active")) {
//       $(this).siblings(".tab_link-btn").removeClass("active");
//       $(content).removeClass("active");
//       $(content[tabIndex]).addClass("active");
//     }
//   });
// }

function subTabs() {
  $(".detail_tab-header").each(function () {
    var targetBtn = $(this).find(".tab_link-btn");

    targetBtn.on("click", function () {
      if ($(this).hasClass("disabled")) {
        return;
      }

      $(this).addClass("active").siblings(".tab_link-btn").removeClass("active");
      var tabIndex = $(this).index();
      var content = targetBtn.closest(".detail_tab-header").siblings(".detail_tab-cont").children(".detail_tab-item");
      $(content).removeClass("active").attr("tabindex", 0);
      $(content[tabIndex]).addClass("active").attr("tabindex", 1);
    });
    //targetBtn.eq(0).click();
  });
}

// function onChangePlayIcon() {
//   console.log($(this));
//   this.css("backgraound-img", "")
// }

// depthOne tab
function depthOneTabs() {
  $(".d-one_tab-header").each(function () {
    var targetBtn = $(this).find(".d-one_tab-link_btn");

    targetBtn.on("click", function () {
      if ($(this).hasClass("disabled")) {
        return;
      }

      $(this).addClass("active").siblings(".d-one_tab-link_btn").removeClass("active");
      var tabIndex = $(this).index();
      var content = targetBtn.closest(".d-one_tab-header").siblings(".d-one_tab-cont").find(".d-one_tab-item");
      $(content).removeClass("active");
      $(content[tabIndex]).addClass("active");
    });
    targetBtn.eq(0).click();
  });
}

// depthTwo tab
function depthTwoTabs() {
  $(".d-two_tab-header").each(function () {
    var targetBtn = $(this).find(".d-two_tab_link-btn");

    targetBtn.on("click", function () {
      if ($(this).hasClass("disabled")) {
        return;
      }

      $(this).addClass("active").siblings(".d-two_tab_link-btn").removeClass("active");
      var tabIndex = $(this).index();
      var content = targetBtn.closest(".d-two_tab-header").siblings(".d-two_tab-cont").find(".d-two_tab-item");
      $(content).removeClass("active");
      $(content[tabIndex]).addClass("active");
    });
    targetBtn.eq(0).click();
  });
}

// page_tabs twoDepth
function pageTabsDepthLink() {
  $(".page_tab-header").each(function () {
    var targetBtn = $(this).find(".page_tab_link-btn");
    var tabIndex = $(this).index();
    var content = targetBtn.closest(".page_tab-header").siblings(".page_tab-cont").find(".page_tab-item");

    if ($(this).hasClass("disabled")) {
      return;
    }

    if ($(this).hasClass("active")) {
      $(this).siblings(".page_tab_link-btn").removeClass("active").attr("tabIndex", 1);
      $(content).removeClass("active");
      $(content[tabIndex]).addClass("active");
    }
  });
}
// page_tabs twoDepth
function pageTabsDepth() {
  $(".page_tab-header").each(function () {
    var targetBtn = $(this).find(".page_tab_link-btn");

    targetBtn.on("click", function () {
      if ($(this).hasClass("disabled")) {
        return;
      }

      $(this).addClass("active").siblings(".page_tab_link-btn").removeClass("active");
      var tabIndex = $(this).index();
      var content = targetBtn.closest(".page_tab-header").siblings(".page_tab-cont").find(".page_tab-item");
      $(content).removeClass("active").attr("tabIndex", 0);
      $(content[tabIndex]).addClass("active").attr("tabIndex", 1);
    });
    targetBtn.eq(0).click();
  });
}

// content Tabs twoDepth
function contentTabs() {
  $(".content_tab-header").each(function () {
    var targetBtn = $(this).find(".content_tab_link-btn");

    targetBtn.on("click", function () {
      if ($(this).hasClass("disabled")) {
        return;
      }

      $(this).addClass("active").siblings(".content_tab_link-btn").removeClass("active");
      var tabIndex = $(this).index();
      var content = targetBtn.closest(".content_tab-header").siblings(".content_tab-cont").find(".content_tab-item");
      $(content).removeClass("active");
      $(content[tabIndex]).addClass("active");
    });
    targetBtn.eq(0).click();
  });
}
// main swiper
function mainObjectSlide() {
  mainObjectSlideCon = new Swiper(".mys_recomm_products-wrap", {
    slidesPerView: "auto",
    allowTouchMove: true,
    freeMode: true,
    watchSlidesProgress: true,
  });
}

// tab slide
function subTabsSlide() {
  subTabsSlideCon = new Swiper(".tabslide .detail_tab-header", {
    slidesPerView: "auto",
    allowTouchMove: true,
    freeMode: true,
    watchSlidesProgress: true,
  });
}

// tolltips
function tolltips() {
  var target = $(".tolltips_btn");
  $(".tolltips").parent().css("position", "relative");

  target.each(function () {
    target.on("click", function () {
      $(this).siblings(".tolltips_box").addClass("active");

      $(this)
        .siblings(".tolltips_box")
        .find(".tolltips_close")
        .on("click", function () {
          $(this).parent().removeClass("active");
          $(this).focus();
        });
    });
    target.on("mouseenter", function () {
      if ($(this).hasClass("mouse-over")) {
        $(this).siblings(".tolltips_box").addClass("active");

        $(this)
          .siblings(".tolltips_box")
          .find(".tolltips_close")
          .on("click", function () {
            $(this).parent().removeClass("active");
            $(this).focus();
          });
      }
    });
  });
}
// open prev accodion
function openPrevAcc() {
  var accBox = $(this).parents(".accodion-box");
  var prevAccBox = accBox.prev();

  accBox.removeClass("active");
  prevAccBox.removeClass("success").addClass("active");
  prevAccBox.find(".accodion-content").addClass("active").slideDown();
  prevAccBox.siblings().find(".accodion-content").removeClass("active").slideUp();
  prevAccBox.next().hasClass("success") ? accBox.next().removeClass("success") : null;
}

// open Modify accodion
function openModify() {
  var accBox = $(this).parents(".accodion-box");
  var accText = $(this).parents(".accodion-txt");
  accBox.addClass("active");
  accBox.removeClass("success");
  accBox.find(".accodion-content").addClass("active").slideDown();
  accBox.siblings().find(".accodion-content").removeClass("active").slideUp();
  accText.fadeOut();
  accBox.next().hasClass("success") ? accBox.next().removeClass("success") : null;

  var isDisplay = $(this).parents(".accodion-box").prev().find(".accodion-txt").css("display");
  if (isDisplay == "block" || isDisplay == "flex") {
    $(this).parents(".accodion-box").next().removeClass("active");
    return;
  } else {
    $(this)
      .parents(".accodion-box")
      .siblings()
      .each(function () {
        $(this).removeClass("active");
        $(this).parents(".accodion-box").find(".accodion-content").slideDown();
        $(this).find(".accodion-txt").fadeOut();
      });
  }
}

// next open accodion
function openNextAccodion() {
  var accBox = $(this).parents(".accodion-box");
  accBox.addClass("success");
  accBox.removeClass("active").children(".accodion-content").addClass("active").slideUp();
  accBox.next().addClass("active").children(".accodion-content").slideDown();

  $(accBox).find(".accodion-txt").fadeIn();
}

// modal
function openModal() {
  var modalId = $(this).data("modal");
  var target = $(this);

  $("#" + modalId)
    .addClass("active")
    .attr("tabindex", 0)
    .focus();

  if ($("#" + modalId).find(".modal-title").length > 0) {
    $("#" + modalId).addClass("scrollH1");
  }

  $("body").addClass("scrollHide");

  $(".modal_close").on("click", function () {
    $(this).parents(".modal").removeClass("active").removeClass("scrollH1");
    target.focus();
    $("body").removeClass("scrollHide");
  });
}
// modal to modal
function openModalTo() {
  var modalId = $(this).data("modal");
  var target = $(this);

  $("#" + modalId)
    .addClass("active")
    .attr("tabindex", 0)
    .focus();
  $("body").addClass("scrollHide");
  $(".modal_close").on("click", function () {
    $(this).parents(".modal").removeClass("active");
    target.focus();
    $("body").removeClass("scrollHide");
  });
}
//modal click outSide
function clickModalOut(e) {
  var findClass = e.target.className;
  var modal = $(".modal");
  if (findClass.match("modal") && findClass.match("active")) {
    modal.removeClass("active");
    $("body").removeClass("scrollHide");
  }
}

// infobox
// function info_box() {
//   $(".info_box .info_tit").on("click", function () {
//     if ($(this).hasClass("active")) {
//       $(this)
//         .removeClass("active")
//         .next(".info_panel")
//         .slideUp(150, function () {
//           setTimeout(function () {
//             $(this).next(".info_panel").css("visibility", "visible");
//           });
//         });
//     } else {
//       $(this).parent(".info_box").siblings().find(".info_tit").removeClass("active");
//       $(this)
//         .addClass("active")
//         .next(".info_panel")
//         .slideDown(150, function () {
//           setTimeout(function () {
//             $(this).next(".info_panel").css("visibility", "hidden");
//           });
//         });
//     }
//   });
//   //$(".info_box .info_tit").eq(0).click(); default 접힘상태
// }

// scrollbar style
function scrollbar() {
  //스크롤바 영역에 max-height 값 주고, .scrollBar 추가
  if ($("body").find(".scrollBar")) {
    $(".scrollBar").mCustomScrollbar({
      theme: "minimal-dark",
      scrollInertia: 300,
    });
    if ($(".scrollBar").hasClass("modal-con")) {
      $(".scrollBar.modal-con").mCustomScrollbar("destroy");
    }
  }
}

// selectbox
function selectbox() {
  var downBtn = $(".btn_selectbox");

  $("body").on("click", ".btn_selectbox", function (event) {
    var target = event.target;

    //if (".btn_selectbox") {
    if ($(target).hasClass("disabled")) {
      return;
    }

    $(target).closest("body").find(".selectbox").removeClass("selectOpen");
    $(target).closest("body").find(".selectbox .btn_selectbox").removeClass("btn_selectbox-selected").attr("aria-expanded", "false");
    $(target).closest("body").find(".selectbox .combobox").hide();

    $(target).addClass("first_placeholder");
    $(target).closest(".selectbox").toggleClass("selectOpen");
    $(target).toggleClass("btn_selectbox-selected").attr("aria-expanded", "true");
    $(target).siblings(".combobox").toggle();

    // if ($(target).hasClass("btn_selectbox-selected")) {
    //   $(target).attr("aria-expanded", "false");
    //   $(target).siblings(".combobox").hide();
    //   $(target).parents(".selectbox").removeClass("selectOpen");
    // } else {
    //   dropOut();

    // }
    //}
  });

  $(".combobox").each(function () {
    $(this)
      .find("li")
      .last()
      .find("button")
      .blur(function () {
        dropOut();
      });
  });

  var dropOut = function () {
    downBtn.removeClass("btn_selectbox-selected").attr("aria-expanded", "false");
    downBtn.parents(".selectbox").removeClass("selectOpen");
    downBtn.siblings(".combobox").hide();
  };

  $("body").on("click", ".combobox_option", function (event) {
    var target = event.target;
    if (target.tagName === "BUTTON") {
      $(target).parents(".combobox").attr("aria-activedescendant", $(target).attr("id"));
      $(target).attr("aria-selected", true).parent().addClass("active").siblings().removeClass("active").find("button").attr("aria-selected", false);
      $(target).parents(".btn_selectbox").text(target.innerText);
      $(target).parents(".selectbox").find(".btn_selectbox").toggleClass("btn_selectbox-selected").text(target.innerText).attr("aria-selected", "false").attr("aria-expanded", "false").next().hide();
      $(target).parents(".selectbox").removeClass("selectOpen");
    } else {
      return;
    }
  });
  $(".combobox").mCustomScrollbar({
    theme: "minimal-dark",
  });
}
// radio checked style function

function onChangeRadio() {
  // 초기 checked 찾기
  if ($(".radio_choice_box").find('input[type="radio"]')) {
    if ($('input[type = "radio"]:checked')) {
      var target = $('input[type = "radio"]:checked').parents(".radio_choice_box");
      target.addClass("active");
    }
  }
  $(".radio_choice_box").on("click", function () {
    if ($('input[type="radio"]').is(":checked")) {
      $(this).addClass("active");
      $(this).siblings().removeClass("active");
    }
  });
}

// select 초기값 설정
function selectInit() {
  $(".combobox_listbox li").each(function (event) {
    let thisIndex = $(this).index();
    if ($(this).find("button").data("value") !== "" && $(this).find("button").attr("aria-selected") == "true") {
      $(this).closest(".selectbox").find(".btn_selectbox").text($(this).find("button").text()).addClass("first_placeholder");
    } else if ($(this).find("button").data("value") !== "" && thisIndex == 0) {
      $(this).find("button").attr("aria-selected", "true");
      $(this).closest(".selectbox").find(".btn_selectbox").text($(this).find("button").text()).removeClass("first_placeholder");
    }
  });
}

function selectObserverOpened(event) {
  const isOpened = $(event.currentTarget).find(".selectbox.selectOpen").length > 0;

  if (isOpened) {
    if ($(event.target).parents(".selectbox").length > 0) {
    } else {
      $(".selectbox").removeClass("selectOpen");
      $(".selectbox").find(".btn_selectbox").removeClass("btn_selectbox-selected").attr("aria-expanded", "false");
      $(".selectbox").find(".combobox").hide();
    }
  } else {
    return;
  }
}

//input clear button
function inputClear() {
  $(".input_inner").each(function () {
    var $this = $(this);
    const $inp = $(this).find("input"),
      $cle = $(this).find(".input_clear");

    $inp.on("input", function () {
      if (this.value == "on") return;
      $cle.toggle(!!this.value);
    });

    $cle.on("touchstart click", function (e) {
      e.preventDefault();
      $inp.val("").trigger("input");
      $(this).siblings("input").focus();
    });
  });
}

// textarea counts byte function
function textareaCount() {
  $("#textarea_box").bind({
    keyup: function () {
      var dom = $(this),
        textDom = $(this).next().children(".textarea_length"),
        str = dom.val(),
        _byte = 0,
        strLength = 0,
        charStr = "",
        cutStr = "",
        maxLength = 2000;
      if (str.length <= 0) {
        return;
      }
      for (var i = 0; i < str.length; i++) {
        charStr = str.charAt(i);
        if (escape(charStr).length > 4) {
          _byte += 2;
        } else {
          _byte++;
        }
        if (_byte <= maxLength) {
          strLength = i + 1;
        }
      }
      textDom.text(_byte);
      if (_byte > maxLength) {
        cutStr = dom.val().substr(str, strLength);
        dom.val(cutStr);
        textDom.text(2000);
        alert("최대 2000byte를 초과하실 수 없습니다.");
        return;
      } else {
        textDom.text(_byte);
      }
    },
  });
}

// main banner swiper
var mainSlide = new Swiper(".main_banner", {
  navigation: {
    nextEl: ".main_banner-wrap .next-btn",
    prevEl: ".main_banner-wrap .prev-btn",
  },
});

// pagination

function renderPaginations() {
  $(".pagination_list").each(function () {
    var target = $(this).find(".paging_num");
    target.on("click", function () {
      if ($(this).find(".pagination").hasClass("disabled")) {
        return;
      }

      var child = $(this).find(".pagination");
      child.addClass("active");
      $(this).siblings().find(".pagination").removeClass("active");
    });
    target.eq(0).click();
  });

  // prev-first
  $(".prev_btn-faster").on("click", function () {
    var parentPaging = $(this).parents(".pagination_list-wrap");
    parentPaging
      .find(".paging-wrap ul")
      .find(".paging_num")
      .each(function () {
        var target = $(this).find(".pagination");
        target.removeClass("active");
      });
    var first = parentPaging.find(".paging-wrap .paging_num");
    $(first[0]).find(".pagination").addClass("active");
  });

  // prev
  $(".prev_btn").on("click", function () {
    var parentPaging = $(this).parents(".pagination_list-wrap");
    var findFirstChild = parentPaging.find(".paging_num").find(".pagination");
    // pagination == 1 일때 예외처리
    if ($(findFirstChild[0]).hasClass("active")) return;
    else {
      var current = parentPaging.find(".pagination.active");

      // if(current && current.pa)
      current.removeClass("active");
      var prev = $(current).parent().prev().find(".pagination");
      $(prev).addClass("active");
    }
  });

  // next
  $(".next_btn").on("click", function () {
    var parentPaging = $(this).parents(".pagination_list-wrap");
    var findFirstChild = parentPaging.find(".paging_num").find(".pagination");
    // pagination == last index 일때 예외처리
    if ($(findFirstChild[findFirstChild.length - 1]).hasClass("active")) return;
    else {
      var current = parentPaging.find(".pagination.active");

      // if(current && current.pa)
      current.removeClass("active");
      var next = $(current).parent().next().find(".pagination");
      $(next).addClass("active");
    }
  });

  // next-last
  $(".next_btn-faster").on("click", function () {
    var parentPaging = $(this).parents(".pagination_list-wrap");
    parentPaging
      .find(".paging-wrap ul")
      .find(".paging_num")
      .each(function () {
        var target = $(this).find(".pagination");
        target.removeClass("active");
      });
    var first = parentPaging.find(".paging-wrap .paging_num");
    $(first[first.length - 1])
      .find(".pagination")
      .addClass("active");
  });
}

// show open tab contents
function openChangeTab() {
  var tabId = $(this).data("change");
  var target = $(this);

  $("#" + tabId)
    .addClass("active")
    .attr("tabindex", 0)
    .focus();
  $(target).addClass("remove");
}

function openPopup() {
  $(".open-popup").on("click", function () {
    var popupId = $(this).data("popup");
    var popupWidth = $(this).data("width");
    window.open(`./${popupId}.html`, popupId, `width=${popupWidth}px, height=1000px, scrollbar=yes`);
  });
}

// mys_3012 btn click show contents function
function showContents() {
  var contentsId = $(this).data("change");

  $("#" + contentsId)
    .addClass("active")
    .focus();
}

//gnb hover&focus event
$(".gnb .one_depth-item").mouseenter(function () {
  jsHover();
});
$(".gnb .one_depth-item").focusin(function () {
  jsHover();
});
$(".gnb .one_depth-item").mouseleave(function () {
  jsOut();
  $(".two_depth-wrap").css("display", "");
});

$(".gnb .one_depth-item").focusout(function () {
  jsOut();
});

$(".gnb .one_depth-item > a").focusin(function () {
  $(".two_depth-wrap").css("display", "");
  $(this).next(".two_depth-wrap").css("display", "block");
});

function jsHover() {
  var twoDiv = $(this).children(".two_depth-wrap");
  $(".header_wrap").addClass("hover");
  $(".header_wrap").css("height", $(twoDiv).outerHeight() + 113);
}
function jsOut() {
  $(".header_wrap").removeClass("hover").css("height", "113px");
}

//gnb four depth 유무에 따른 class 추가
$(".three_depth-item").has(".four_depth-list").addClass("in_four").children("a").wrapInner("<span></span>");

//gnb four depth open/close
$(".gnb .three_depth-item > a").on("click", function (e) {
  if ($(this).parent().hasClass("open")) {
    $(this).parent().removeClass("open").find(".four_depth-list").slideUp();
  } else {
    $(".gnb .three_depth-item").removeClass("open").find(".four_depth-list").slideUp();
    $(this).parent().addClass("open").find(".four_depth-list").slideDown();
  }
});
$(".all_menu .three_depth-item > a").on("click", function (e) {
  if ($(this).parent().hasClass("close")) {
    $(this).parent().removeClass("close").find(".four_depth-list").slideDown();
  } else {
    $(this).parent().addClass("close").find(".four_depth-list").slideUp();
  }
});

//gnb fixed
$(window).scroll(function () {
  scroll = $(window).scrollTop();

  const x = -this.scrollX;
  $(".header_wrap").css({ left: x });

  if (0 < scroll) {
    $(".header_wrap").addClass("fixed");
  } else {
    $(".header_wrap").removeClass("fixed");
  }
});

//전체메뉴 열기/닫기
function allMenuOpen() {
  if ($(".header_wrap").hasClass("js-allMenu")) {
    $(".header_wrap").removeClass("js-allMenu");
    $("body").css("overflow-y", "auto");
  } else {
    $(".header_wrap").addClass("js-allMenu");
    $("body").css("overflow-y", "hidden");
  }
}
//유의사항 checkbox
function checkedShowInfo() {
  var checkbox = $(".info_box-checkbox label");
  checkbox.on("click", function () {
    var infoBox = $(this).siblings("input[type='checkbox']").is(":checked");
    var sibInput = $(this).parents().siblings(".acdBtn");
    if (infoBox == true && !sibInput.hasClass("active")) {
      $(this).siblings("input[type='checkbox']").checked = false;
    } else if (infoBox == true && sibInput.hasClass("active")) {
      return;
    } else if (infoBox == false && sibInput.hasClass("active")) {
      $(this).siblings("input[type='checkbox']").prop("checked");
    } else if (infoBox == false && !sibInput.hasClass("active")) {
      $(this).parent().siblings(".acdBtn").click();
    }
  });
}

// sb_3010 기타 radio check
function checkRadioEtc() {
  $(".radio_etc").on("click", function () {
    var radioInput = $(this).parent().siblings();
    radioInput.each(function () {
      $(this).hasClass("radio_input") ? $(this).find("input").focus() : null;
    });
  });
}

//co_2005... box click after checkbox abled
function doClickCBox() {
  $(".want_products-item").on("click", function () {
    // console.log($(this).children("input[type='checkbox']"));
    var checkbox = $(this).find(".checkbox");
    if (checkbox.length > 1) {
      $(this).css("cursor", "none");
      return;
    }
    var isChecked = checkbox.find("input[type='checkbox']");
    if (isChecked.is(":checked") == false) isChecked.prop("checked", true);
    else isChecked.prop("checked", false);
  });
}
(function vhvh() {
  vh = window.innerHeight * 0.01;
  document.documentElement.style.setProperty("--vh", "" + vh + "px");
})();

const setVh = () => {
  document.documentElement.style.setProperty("--vh", `${window.innerHeight}px`);
};
window.addEventListener("resize", setVh);
setVh();

//sp_3001 ~ checkbox to icon select
function showMoreDetails(tar) {
  if (tar.target !== undefined) {
    // 리스트에서 체크했을 때
    var isChecked = $(this).siblings("input").is(":checked");
    var detailBox = $(this).parents(".checkbox").siblings(".checkbox_details");
    var iconId = $(this).attr("for").substr(9);

    if (isChecked) {
      detailBox.slideUp(200, function () {
        $(this).css("visibility", "hidden");
        $(".select_icon").each(function () {
          if ($(this).attr("id").substr(0, 10) == iconId) {
            $(this).removeClass("active");
          }
        });
      });
    } else {
      detailBox.css("visibility", "visible").slideDown();

      $(".select_icon").each(function () {
        if ($(this).attr("id").substr(0, 10) == iconId) {
          $(this).addClass("active");
        }
      });
    }
  } else {
    // 이미지 위에서 체크했을 때
    var $this = $(`#${tar}`);
    var isChecked = $this.is(":checked");
    var detailBox = $this.parents(".checkbox").siblings(".checkbox_details");
    // console.log(detailBox);
    if (isChecked) {
      detailBox.css("visibility", "visible").slideDown(200);
    } else {
      detailBox.slideUp(200, function () {
        $this.css("visibility", "hidden");
      });
    }
  }
}

function clickMoreDetails() {
  $(".select_icon").on("click", function () {
    var checkBox;
    var idValue = $(this).attr("id").substr(0, 10);
    $(".checkbox").each(function () {
      checkBox = `checkbox_${idValue}`;
    });

    var iconList = [];
    $(".select_icon").each(function () {
      if ($(this).attr("id").substr(0, 10) == idValue) {
        iconList.push(this);
      }
    });

    if ($(this).hasClass("active")) {
      $(iconList).each(function () {
        $(this).removeClass("active");
      });
      if ($(`#${checkBox}`).prop("checked") == true) {
        $(`#${checkBox}`).prop("checked", false);
      }
      $(`#${checkBox}`).prop("checked", false);
    } else {
      $(this).addClass("active");
      if ($(`#${checkBox}`).prop("checked") == false) {
        $(`#${checkBox}`).prop("checked", true);
      }
    }

    showMoreDetails(checkBox);
  });
}

function closeSystemPopup() {
  window.close();
}

function videoCoverPlay() {
  $(".cover a").each(function () {
    $(this).bind("click", function () {
      $("#video1")[0].src += "&autoplay=1;";
      $(this).parent().css("display", "none");
      $(this).parent().siblings().css("display", "block");
    });
  });
}

// sm_6002
function moveToSection(valueNum) {
  var offset = $("#section_" + valueNum).offset();

  var gnbHeight = $(".gnb").outerHeight();

  if (typeof valueNum == "number") {
    var yearsHeight = $(`#section_${valueNum}`).parents().siblings(".progress_box").outerHeight();
    $("html, body").animate({ scrollTop: offset.top - yearsHeight + 1 }, 400);
    return;
  }

  if ($(".detail_tab-wrap").hasClass("hitstab")) {
    var sectionPd = 123 / 2;
  } else {
    var sectionPd = 0;
  }

  if (valueNum == "all") {
    $("html, body").animate({ scrollTop: gnbHeight }, 400);
  } else {
    $("html, body").animate({ scrollTop: offset.top - gnbHeight - sectionPd }, 400);
  }
}
// tab sticky
function tabSticky() {
  var scrollBt = 0;
  var gnbHeight = 0;
  var target = $(".detail_tab-wrap.sticky");
  var stickyTop = target.offset().top;
  var scrollTop = $(document).scrollTop();

  if (stickyTop < scrollTop) {
    target.find(".detail-tab_link-wrap").addClass("fixed").css({
      position: "fixed",
      top: 0,
    });
  }

  $(window).scroll(function () {
    // gnbHeight = $(".gnb").outerHeight();
    gnbHeight == null ? (gnbHeight = 0) : (gnbHeight = $(".gnb").outerHeight());
    scrollBt = $(this).scrollTop() + gnbHeight;
    if (stickyTop <= scrollBt) {
      target.find(".detail-tab_link-wrap").addClass("fixed").css({
        position: "fixed",
        top: gnbHeight,
      });
    } else {
      target.find(".detail-tab_link-wrap").removeClass("fixed").css({
        position: "relative",
        top: 0,
      });
    }
  });
}
