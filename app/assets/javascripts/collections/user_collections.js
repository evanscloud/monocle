$(function() {
  var user_id = this.data.user.id

  $.getJSON('/users/' + user_id + '/collections.json', function(data) {
    var collections = data;
    var collectionText = '';

    collectionText += '<table align="center">';
    collectionText += '<tr>';
    collectionText += '<th><u>NAME</u></th>';
    collectionText += '<th><u>COUNT</u></th>';
    collectionText += '</tr>';
    if (collections) {
      for (i = 0; i < collections.length; i++) {
        collectionText += '<tr>';
        collectionText += '<td><a href="users/' + collections[i].user.id + '/collections">' + collections[i].name + '</a>';
        collectionText += '<td>' + collections[i].books.length + ' book(s)</td>';
        collectionText += '</tr>';
      };
      $('.user-collections').append(collectionText);
    }
    else {
      collectionText = '<h5>Where did everyone go...?</h5>';
      $('.user-collections').append(collectionText);
    };
    collectionText += '</table>';
  });
});
