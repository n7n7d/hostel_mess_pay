# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

jQuery ->
  $('#leave_end_date').datepicker(dateFormat: 'yy-mm-dd',minDate:'4d',maxDate:'5d')
  $('#leave_start_date').datepicker(dateFormat: 'yy-mm-dd',minDate:'d',maxDate:'1d')