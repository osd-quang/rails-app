class Post < ApplicationRecord
  belongs_to :user
  has_many :post_in_categories, dependent: :delete_all
  has_many :categories, through: :post_in_categories

  validates :title, presence: true
  validates :content, presence: true
  validates :user_id, presence: true
  validates :category_ids, presence: true
end
