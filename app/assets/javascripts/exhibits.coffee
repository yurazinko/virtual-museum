# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/
jQuery ->
	$('#exhibit_date_of_renewal').datepicker(dateFormat: 'dd.mm.yy');
	$('#exhibit_date_of_receipt').datepicker(dateFormat: 'dd.mm.yy');