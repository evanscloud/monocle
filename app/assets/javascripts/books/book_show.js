$(function(){
  $.getJSON('/books/' + bookId + '.json', function(data){
    var book = new Book(data.id, data.title, data.author, data.publisher, data.published_date, data.description, data.price, data.isbn, data.buy_link, data.image_link, data.collections, data.genres);
    var bookText = '';

    bookText += '<img class="image-display" src="' + book.image_link + '" target="_blank"><br>';
    bookText += '<p>Publisher: ' + (book.publisher ? book.publisher : "unavailable") + '</p>';
    bookText += '<p>Published Date: ' + book.displayDate() + '</p><br>';

    bookText += '<p>Description: ' + (book.description ? book.description : "unavailable") + '</p><br>';
    bookText += '<p>ISBN: ' + (book.isbn ? book.isbn : "unavailable") + '</p>';
    bookText += '<p>Current Price (retail): ' + (book.price ? '$' + book.price : "unavailable") + '</p>';
    bookText += '<p>Purchase Now: ' + (book.buy_link ? '<a href="' + book.buy_link + '" target="_blank">' + book.buy_link + '</a>' : "unavailable") + '</p>';
    $('#book-show').append(bookText);
    debugger;
  });
});
