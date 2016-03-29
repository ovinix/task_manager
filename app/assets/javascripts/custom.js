/* bootstrap */
$(document).ready(function() {
	$(".modal").on('shown.bs.modal', function() {
	    $(this).find("[autofocus]:first").focus();
	});

	$("#lists").on('hide.bs.collapse', '.panel', function (e) {
	  $(e.currentTarget).css("border-radius", "4px");
	});

	$("#lists").on('show.bs.collapse', '.panel', function (e) {
	  $(e.currentTarget).css("border-radius", "");
	});
});

