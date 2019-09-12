class PostViewSerializer < ActiveModel::Serializer
  attributes :id, :title, :content, :user_id
  has_many :categories, through: :post_in_categories
end
