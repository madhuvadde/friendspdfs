class PostsController < ApplicationController
  before_action :find_post,only:[:show]
  before_action :authenticate_user!, except: [:index,:show]
  def index
  	@post = Post.all
  end

def show

end


  def new
  	@post = current_user.posts.build
  end

  def create
  	@post = current_user.posts.build(post_params)
  	if @post.save
      PostMailer.post_created(current_user).deliver
  		redirect_to  posts_path,notice: "Successfully Uploaded"
  	else
  		render "new"
  end
end

  def destroy
  	@post = Post.find(params[:id])
  	@post.destroy
  	redirect_to posts_path, notice: "Successfully Deleted"
  end

  private

  def find_post
    @post = Post.find(params[:id])
  end
  def post_params
  	params.require(:post).permit(:name,:attachment)
  end
end
