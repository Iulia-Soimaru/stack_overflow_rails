$(document).ready(function(){

  $('.new_question').on("submit", function(event){
    event.preventDefault();
    // console.log("form button clicked");
      var formData = $(this).serialize();
      console.log(formData);
      // debugger

    $.ajax({
      url: $(this).attr("action"),
      type: "POST",
      dataType: "JSON",
      // data: {question: {
      //   title: $("#question_title").val(),
      //   content: $("#question_content").val(),
      // } }
      data: formData,
    }).done(function(data){
      console.log(data);
      // debugger
      $('.questions-list').append("<li class='question'><a href='questions/" + data.question.id + "'><b>" + data.question.title + "</b></a><form action='/questions/" + data.question.id + "/votes' class='button_to' method='post'><div><input type='submit' value='+1'></div></form><form action='/questions/" + data.question.id + "/votes/destroy' class='button_to' method='post'><div><input type='submit' value='-1'></div></form><span class='question_vote'>" + data.votes.length + "</span></li>");
    }).fail(function(data){
      alert(data);
    })
  })

  // ajax upvote button
  // select input[button] by value +1
  // prevent default behavior
  // make an ajax call
  $('input[value="+1"]').parent().parent().on("submit", function(event){
    event.preventDefault();
    console.log("clicked upvote");
    var link = $(this).attr("action");
    var currentVote = $(this).next().next()[0];
    // console.log($(this));
    // console.log(currentVote);

    $.ajax({
      url: link,
      type: "POST",
      dataType: "JSON",
      // data: {vote: currentVote   },
    }).done(function(response){
      $(currentVote).text(response.question_vote)
    }).fail(function(response){
      alert(response)
    })
  });


  $('input[value="-1"]').parent().parent().on("submit", function(event){
    event.preventDefault();
    console.log("clicked upvote");
    var link = $(this).attr("action");
    console.log(link)
    var currentVote = $(this).next()[0];
    console.log(currentVote)

    $.ajax({
      url: link,
      type: "DELETE",
      dataType: "JSON",
    }).done(function(response){
      $(currentVote).text(response.question_vote)
    }).fail(function(response){
      alert(response)
    })
  });

});
