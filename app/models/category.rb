class Category < ApplicationRecord
  has_many :post_in_categories, dependent: :delete_all
  has_many :posts, through: :post_in_categories
end
