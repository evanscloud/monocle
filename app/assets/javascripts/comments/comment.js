$(function() {
  $('form').submit(function(event){
    event.preventDefault();

    var values = $(this).serialize();
    var posting = $.post('/collections/' + collectionId + '/comments', values);

    posting.done(function(data){
      var comment = data;
      var commentText = '';

      commentText += '<p>' + comment.content + '</p>';
      commentText += 'Posted by: ' + comment.user.username;
      // commentText += ;
      commentText += '<br><br>';
      $('#user-comments').append(commentText);
    });
  });
});
