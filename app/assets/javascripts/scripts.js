$(document).ready(function()
{
	"use strict";


	var menuActive = false;
	var header = $('.header');

	setHeader();

	incrment_and_decrement_quantity();

	$(window).on('resize', function()
	{
		setHeader();
	});



	function setHeader()
	{
		if(window.innerWidth > 991 && menuActive)
		{
			closeMenu();
		}
	}


	function incrment_and_decrement_quantity()
	{
		$('.select-estruturas-lista > div').on('click', function() {
			var input = $(this).parent().find('.produto_quantidade');
			var current_value = parseInt($(input).val());

			if($(this).hasClass('less')) {
				if(current_value - 1 >= 0) {
					$(input).val(current_value - 1);
				}
			} else if($(this).hasClass('plus')) {
				if(current_value + 1 <= $(input).attr('max')) {
					$(input).val(current_value + 1);
				}
			}
		})
	}
});