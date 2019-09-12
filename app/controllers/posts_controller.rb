class PostsController < ApplicationController
  before_action :set_post, only: [:show, :update, :destroy]
  # GET /posts
  def index
    @posts = Post.includes(:user) #.includes(:categories) #.where(users: { password: "quang" })

    render json: @posts, each_serializer: PostViewSerializer
  end

  # GET /posts/1
  def show
    render json: @post
  end

  # POST /posts
  def create
    #debugger
    #HardWorker.perform_async
    @post = Post.new(post_params)
    # @post.category_ids = post_params["category_ids"]
    # @post = Post.new()
    #input_params.convert_input_to_model(@post)

    if @post.save
      render json: @post, serializer: PostViewSerializer, status: :created
    else
      render json: @post.errors, status: :bad_request
    end
  end

  # PATCH/PUT /posts/1
  def update
    # debugger
    if @post.update(post_params)
      render json: @post, serializer: PostViewSerializer, status: :ok
    else
      render json: @post.errors, status: :bad_request
    end
  end

  # DELETE /posts/1
  def destroy
    @post.destroy
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_post
    @post = Post.find(params[:id])
  end

  # Only allow a trusted parameter "white list" through.
  def post_params
    # debugger
    params.permit(:title, :content, :user_id, :category_ids => [])
    # request.request_parameters
  end

  # def input_params
  #   PostManagerModel.new(request.request_parameters)
  # end

end

# class PostManagerModel
#   def initialize(params)
#     @title = params[:title]
#     @content = params[:content]
#     @user_id = params[:user_id]
#     @category_ids = params[:category_ids]
#   end

#   def convert_input_to_model(post)
#     post.title = @title
#     post.content = @content
#     post.user_id = @user_id
#     post.category_ids = @category_ids

#     # @category_ids.each do |category_id|

#     # end
#   end

#   attr_accessor :title, :content, :user_id, :category_ids
# end
