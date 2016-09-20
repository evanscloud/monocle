$(function() {
  $.getJSON('/collections.json', function(data) {
    var collections = data;
    var i = 0;

    collectionText = '<table align="center">';
    collectionText += '<tr>';
    collectionText += '<th><u>NAME</u></th>';
    collectionText += '<th><u>COUNT</u></th>';
    collectionText += '</tr>';
    if (collections) {
      while (i < collections.length) {
        collectionText += '<tr>';
        collectionText += '<td><a href="collections/' + collections[i].id + '">' + collections[i].name + ' by ' + collections[i].user.username + '</a>';
        collectionText += '<td>' + collections[i].books.length + ' book(s)</td>';
        collectionText += '</tr>';
        i++;
      };
      $('.custlist').append(collectionText);
    }
    else {
      collectionText = '<h5>Where did everyone go...?</h5>';
      $('.custlist').append(collectionText);
    };
    collectionText += '</table>';
    $('.custlist').append(collectionText);
  });
});
