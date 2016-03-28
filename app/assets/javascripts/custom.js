/* bootstrap */
$(document).ready(function() {
	$(".modal").on('shown.bs.modal', function() {
	    $(this).find("[autofocus]:first").focus();
	});

	$('.panel').on('hide.bs.collapse', function () {
		$(this).css("border-radius", "4px");
	});

	$('.panel').on('show.bs.collapse', function () {
		$(this).css("border-radius", "");
	});
});