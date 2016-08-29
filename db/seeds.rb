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
