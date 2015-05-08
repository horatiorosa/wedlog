class PostsController < ApplicationController
before_action :set_post, only: [:show, :edit, :update, :destroy]



  def index
  	@posts = Post.all 
  end


  def new
  	@post = Post.new

  end

  def show
    @comment = Comment.new

  end

  def edit
  end

  def create
  	@post = Post.new(post_params)
  	if @post.save
  		redirect_to @post, notice: "Your post was created. Thank you for sharing."
  	else
  		render :new
  	end
  end

  def update
  	if @post.update(post_params)
  	redirect_to @post, notice: "Your post was updated"
  	else
  		render :edit
  	end
  end


  def destroy
  	@post.destroy
  	redirect_to posts_path, notice: "Your post was deleted"
  end


  private

  def post_params
  	params.require(:post).permit(:title, :post_body).merge(user: current_user)
  end

  def set_post
  	@post = Post.find(params[:id])
  end

end
