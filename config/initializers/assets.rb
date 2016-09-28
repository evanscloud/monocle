# Be sure to restart your server when you modify this file.

# Version of your assets, change this if you want to expire all your assets.
Rails.application.config.assets.version = '1.0'

# Add additional assets to the asset load path
# Rails.application.config.assets.paths << Emoji.images_path

# Precompile additional assets.
# application.js, application.css, and all non-JS/CSS in app/assets folder are already added.
# Rails.application.config.assets.precompile += %w( search.js )

Rails.application.config.assets.precompile += %w( collections/all_collections.js )
Rails.application.config.assets.precompile += %w( collections/user_collections.js )
Rails.application.config.assets.precompile += %w( collections/collection_show.js )
Rails.application.config.assets.precompile += %w( collections/collection_model.js )
Rails.application.config.assets.precompile += %w( collections/book_fields.js )

Rails.application.config.assets.precompile += %w( books/book_show.js )
Rails.application.config.assets.precompile += %w( books/book_model.js )

Rails.application.config.assets.precompile += %w( users/user_show.js )
Rails.application.config.assets.precompile += %w( comments/comment.js )
