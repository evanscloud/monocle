var User = function(id, username, email, provider){
  this.id = id;
  this.username = username;
  this.email = email;
  this.provider = provider;
};

$(function(){
  $.getJSON('/users/' + userId + '.json', function(data){
    user = new User(data.id, data.username, data.email, data.provider);
    userText = '';

    userText += '<table align="center">';
    userText += '<td>Username:</td>';
    userText += '<td>' + user.username + '</td>';
    userText += '<tr></tr>';
    userText += '<td>Email:</td>';
    userText += '<td>' + user.email + '</td>';
    userText += '<tr></tr>';
    if (user.provider == null){
      userText += '<td><a class="btn btn-block btn-social btn-facebook" href="/auth/facebook">Connect with Facebook</a></td>';
      userText += '<td><a class="btn btn-block btn-social btn-google" href="/auth/google_oauth2">Connect with Google</a></td>';
    }
    else {
      userText += '<td>Provider:</td>';
      userText += '<td><%= @user.provider %></td>';
    };
    userText += '</table>';
    $('#user-show').append(userText);
  });
});
