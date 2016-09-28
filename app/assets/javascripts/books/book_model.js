var Book = function(id, title, author, publisher, published_date, description, price, isbn, buy_link, image_link, collections, genres){
  this.id = id;
  this.title = title;
  this.author = author;
  this.publisher = publisher;
  this.published_date = published_date;
  this.description = description;
  this.price = price;
  this.isbn = isbn;
  this.buy_link = buy_link;
  this.image_link = image_link;
  this.collections = collections;
  this.genres = genres;
};

Book.prototype.displayDate = function(){
  var date = new Date(this.published_date);
  var mm = date.getMonth();
  var dd = date.getDate();
  var yy = date.getFullYear();
  var months = ["January", "February", "March", "April", "May", "June", "July", "August", "September", "October", "November", "December"];
  var fullDate = months[mm - 1] + " " + dd + ", " + yy;

  if (fullDate){
    return fullDate;
  }
  else {
    return "unavailable";
  }
};

Book.prototype.displayGenres = function(){
  var genres = this.genres.map(function(genre){ return genre.name });
  if (genres.length == 1){
    return genres.join("");
  }
  else {
    return genres.join(", ");
  }
};
