$(function(){
  $.getJSON('/collections.json', function(data) {
    var collections = data;
    var collectionText = '';

    collectionText += '<u><h3>Little Tibits</h3></u>';
    collectionText += '<table align="center">';
    collectionText += '<tr>';
    collectionText += '<td>Recently Added:</td>';
    // collectionText += '<td>' + Collection.protoype.most_recent + '</td>';
    collectionText += '</tr>';
    collectionText += '<tr>';
    collectionText += '<td>Most Books:</td>';
    // collectionText += '<td>' + Collection.protoype.most_books + '</td>';
    collectionText += '</tr>';
    collectionText += '</table>';

    collectionText += '<hr>';

    collectionText += '<table align="center">';
    collectionText += '<tr>';
    collectionText += '<th><u>NAME</u></th>';
    collectionText += '<th><u>COUNT</u></th>';
    collectionText += '</tr>';
    if (collections) {
      for (i = 0; i < collections.length; i++) {
        collectionText += '<tr>';
        collectionText += '<td><a href="collections/' + collections[i].id + '">' + collections[i].name + ' by ' + collections[i].user.username + '</a></td>';
        collectionText += '<td>' + collections[i].books.length + ' book(s)</td>';
        collectionText += '</tr>';
      };
    }
    else {
      collectionText += '<h5>Where did everyone go...?</h5>';
    };
    collectionText += '</table>';
    $('#all-collections').append(collectionText);
  });
});
