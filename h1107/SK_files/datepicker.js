$(function () {
	if ($(document).find(".datepicker")) {
		datePickerInit();
	}
	$('.datepicker').on('click', function(e) {
		e.preventDefault();
		$(this).attr("autocomplete", "off");  
	 });
});

function datePickerInit() {
	var newDate = new Date();
	var today = newDate.getFullYear() + "년 " + (newDate.getMonth() + 1) + "월 " + newDate.getDate() + "일";
	var dateInput = $(".js-dateInput");
	dateInput.val(today);

	$.datepicker.setDefaults({
		dateFormat: 'yy년 mm월 dd일',
		prevText: '이전 달',
		nextText: '다음 달',
		// showOn: "both",
		// buttonImage: "../../img/icon/ic_calendar.svg",
		// buttonImageOnly: true,
		monthNames: ['01', '02', '03', '04', '05', '06', '07', '08', '09', '10', '11', '12'],
		monthNamesShort: ['1월', '2월', '3월', '4월', '5월', '6월', '7월', '8월', '9월', '10월', '11월', '12월'],
		dayNames: ['Su', 'Mo', 'Tu', 'We', 'Th', 'Fr', 'Sa'],
		dayNamesShort: ['Su', 'Mo', 'Tu', 'We', 'Th', 'Fr', 'Sa'],
		dayNamesMin: ['Su', 'Mo', 'Tu', 'We', 'Th', 'Fr', 'Sa'],
		showMonthAfterYear: true,
		yearSuffix: "년",
		// minDate: 0,
	});

	$(function () {
		$('.datepicker').datepicker();
	});
}

