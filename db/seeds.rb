# Users
User.create(
  username: "evan",
  email: "evan@email.com",
  password: ENV['USER_SECRET'],
  password_confirmation: ENV['USER_SECRET']
)

User.create(
  username: "mphelps",
  email: "mphelps@email.com",
  password: ENV['SEED_SECRET'],
  password_confirmation: ENV['SEED_SECRET']
)

User.create(
  username: "ubolt",
  email: "ubolt@email.com",
  password: ENV['SEED_SECRET'],
  password_confirmation: ENV['SEED_SECRET']
)

User.create(
  username: "sbiles",
  email: "sbiles@email.com",
  password: ENV['SEED_SECRET'],
  password_confirmation: ENV['SEED_SECRET']
)

User.create(
  username: "lhamilton",
  email: "lhamilton@email.com",
  password: ENV['SEED_SECRET'],
  password_confirmation: ENV['SEED_SECRET']
)

User.create(
  username: "kwalsh",
  email: "kwalsh@email.com",
  password: ENV['SEED_SECRET'],
  password_confirmation: ENV['SEED_SECRET']
)

User.create(
  username: "pmanning",
  email: "pmanning@email.com",
  password: ENV['SEED_SECRET'],
  password_confirmation: ENV['SEED_SECRET']
)

User.create(
  username: "cronaldo",
  email: "cronaldo@email.com",
  password: ENV['SEED_SECRET'],
  password_confirmation: ENV['SEED_SECRET']
)

User.create(
  username: "swilliams",
  email: "swilliams@email.com",
  password: ENV['SEED_SECRET'],
  password_confirmation: ENV['SEED_SECRET']
)

User.create(
  username: "ndjoker",
  email: "ndjoker@email.com",
  password: ENV['SEED_SECRET'],
  password_confirmation: ENV['SEED_SECRET']
)

# Genres
Genre.create(name: "comedy")
Genre.create(name: "drama")
Genre.create(name: "horror")
Genre.create(name: "non-fiction")
Genre.create(name: "realistic fiction")
Genre.create(name: "romance")
Genre.create(name: "satire")
Genre.create(name: "tragedy")
Genre.create(name: "tragicomedy")
Genre.create(name: "classic")
Genre.create(name: "fairytale")
Genre.create(name: "mystery")
Genre.create(name: "science fiction")
Genre.create(name: "memoir")
Genre.create(name: "biography/autobiography")
Genre.create(name: "self-help")
Genre.create(name: "reference")


# Books
30.times do
  book = Book.create(
    title: Faker::Book.title,
    author: Faker::Book.author,
    publisher: Faker::Book.publisher,
    published_date: Faker::Date.between_except(50.year.ago, 1.year.from_now, Date.today),
    description: Faker::Lorem.paragraph,
    price: Faker::Commerce.price,
    isbn: Faker::Number.number(10),
    buy_link: Faker::Internet.url,
    image_link: Faker::Placeholdit.image
  )
  # add genre
  genre = Genre.find_by_id(rand(1..17))
  book.genres << genre
end

# Collections
10.times do
  collection = Collection.create(
    name: Faker::Commerce.department,
    user_id: Faker::Number.between(1, 10)
  )
  # add books
  rand(1..7).times do
    book = Book.find_by_id(Faker::Number.between(1, 30))
    collection.books << book
  end
end

# Comments
10.times do
  Comment.create(
    content: Faker::Hacker.say_something_smart,
    user_id: Faker::Number.between(1, 10),
    collection_id: Faker::Number.between(1, 12)
  )
end

10.times do
  Comment.create(
    content: Faker::ChuckNorris.fact,
    user_id: Faker::Number.between(1, 10),
    collection_id: Faker::Number.between(1, 12)
  )
end
