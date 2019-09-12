class UserViewSerializer < ActiveModel::Serializer
  attributes :id, :username, :password
  has_many :posts, serializer: PostViewSerializer

  # def password
  #   :password
  # end
end
