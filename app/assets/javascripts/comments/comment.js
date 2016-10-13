$(function() {
  $('#new_comment').submit(function(event){
    event.preventDefault();

    var collectionId = $('.custcontainer').data('collection');
    var userId = $('.form-input').data('user');

    var values = $(this).serialize();
    var posting = $.post('/collections/' + collectionId + '/comments', values);

    posting.done(function(comment){
      var commentText = '';

      commentText += '<div id="comment-' + comment.id + '">';
      commentText += '<p>' + comment.content + '</p>';
      commentText += 'Posted by: ' + comment.user.username + " ";
      if (comment.user.id == userId){
        commentText += '<a href="/comments/' + comment.id + '/edit">(edit</a>, ';
        commentText += '<a class="delete-comments" id="comment-' + comment.id + '" href="/comments/' + comment.id + '">delete</a>)';
      };
      commentText += '<br><br>';
      commentText += '</div>';
      $('#user-comments').append(commentText);
      $('#new_comment')[0].reset();
    });
  });
  $('body').on('click', '.delete-comments', function(event) {
    var commentDiv = $(this).attr('id');

    $.post(this.href, "_method=delete", function(data) {
    });

    $('div#' + commentDiv).remove();
    return false;
  });
});
