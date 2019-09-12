class ProfileSerializer
  # attributes :id, :username, :address, :about, :posts

  def initialize(user)
    @id = user.id
    @posts = user.posts
  end

  attr_accessor :id, :posts
end
