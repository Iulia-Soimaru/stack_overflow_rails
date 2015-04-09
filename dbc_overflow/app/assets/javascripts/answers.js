// Place all the behaviors and hooks related to the matching controller here.
// All this logic will automatically be available in application.js.
// You can use CoffeeScript in this file: http://coffeescript.org/
$(document).ready(function(){

  $('.new_answer').on('submit', function(event){
    event.preventDefault();

    var answerData = $(this).serialize();
    var link = $(this).attr('action');

    $.ajax({
      url: link,
      type: "POST",
      dataType: "JSON"
    }).done(function(response){
      console.log(response)
    })
  })
})