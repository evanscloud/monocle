$(function(){
  $.getJSON('/collections/' + collectionId + '.json', function(data){
    var collection = new Collection(data.id, data.name, data.user, data.books, data.comments);
    var collectionText = '';

    if (collection){
      for (i = 0; i < collection.books.length; i++){
        collectionText += '<li><a href="/books/"' + collection.books[i].id + '>' + collection.books[i].title + ' by ' + collection.books[i].author + '</li>';
      };

    }
    else {
      collectionText += '<h5>It\'s kinda lonely here...</h5>';
    };
    $('#collection-books-show').append(collectionText);
  });
});
