$(function(){
  $.getJSON('/users/' + userId + '/collections.json', function(collections) {
    var collectionText = '';

    collectionText += '<table align="center">';
    collectionText += '<tr>';
    collectionText += '<th><u>NAME</u></th>';
    collectionText += '<th><u>COUNT</u></th>';
    collectionText += '</tr>';
    if (typeof collections[0] !== 'undefined') {
      for (i = 0; i < collections.length; i++) {
        collectionText += '<tr>';
        collectionText += '<td><a href="/collections/' + collections[i].id + '">' + collections[i].name + '</a></td>';
        collectionText += '<td>' + collections[i].books.length + ' ' + String.prototype.pluralize(collections[i].books.length) + '</td>';
        collectionText += '</tr>';
      };
    }
    else {
      collectionText = '<br>';
      collectionText += '<h5>Where did everyone go...?</h5>';
    };
    collectionText += '</table>';
    $('#user-collections').append(collectionText);
  });
});
