$(function() {
  $('#new_comment').submit(function(event){
    event.preventDefault();

    var values = $(this).serialize();
    var posting = $.post('/collections/' + collectionId + '/comments', values);

    posting.done(function(data){
      var comment = data;
      var commentText = '';

      commentText += '<p>' + comment.content + '</p>';
      commentText += 'Posted by: ' + comment.user.username + " ";
      if (comment.user.id == userId){
        commentText += '<a href="/comments/' + comment.id + '/edit">(edit</a>, ';
        commentText += '<a rel="nofollow" data-method="delete" href="/comments/' + comment.id + '">delete)</a>';
      };
      commentText += '<br><br>';
      $('#user-comments').append(commentText);
    });
  });
});
