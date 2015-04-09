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
      $('.questions-list').append("<li class='question'><a href='questions/" + data.question.id + "'><b>" + data.question.title + "</b></a><form action='/questions/" + data.question.id + "/votes' class='button_to' method='post'><div><input type='submit' value='+1'></div></form><form action='/questions/" + data.question.id + "/votes/destroy' class='button_to' method='post'><div><input type='submit' value='-1'></div></form><span>" + data.votes.length + "</span></li>");
    }).fail(function(data){
      alert(data);
    })
  })

});

// '<li class="question"><a href="questions/' + data.id + '><b>' + data.title + '</b></a>
//     <form action="/questions/' + data.id + '/votes" class="button_to" method="post">
//       <div>
//         <input type="submit" value="+1">
//       </div>
//     </form>
//     <form action="/questions/' + data.id + '/votes/destroy" class="button_to" method="post">
//       <div>
//         <input type="submit" value="-1">
//       </div>
//     </form>
//     <span><%= question.votes.count %></span>
//   </li>'
