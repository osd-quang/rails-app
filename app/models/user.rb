class User < ApplicationRecord
  has_many :posts, dependent: :delete_all
  #   validates_presence_of :username, :password, message: "can't be blank"
  validates :username, presence: true, length: { minimum: 2 }
  validates :password, presence: true, length: { minimum: 4 }
end
