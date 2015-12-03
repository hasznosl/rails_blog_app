class CommentsController < ApplicationController

  before_action :authenticate_user, except: [:index, :show]
  before_action :find_comment, only: [:show, :edit, :update, :destroy]

  def new
    @comment = Comment.new
  end

  def create
    @comment = Comment.new(comment_params)
    @post = Post.find(params[:post_id])
    @comment.post = @post
    @comment.user = current_user
    respond_to do |format|
      if @comment.save
        CommentsMailer.notify_post_owner(@post, @comment.user.full_name).deliver_later
        format.html {redirect_to post_path(@post)}
        format.js {render :create_success}
      else
        format.html {render "/posts/show"}
        format.js {render js: "alert('failure');"}
      end
    end
  end

  def show
  end

  def edit
  end

  def update
    if @comment.update(comment_params)
      redirect_to comment_path(@comment)
    else
      render :edit
    end
  end

  def destroy
    post = @comment.post
    respond_to do |format|
      if @comment.destroy
        format.html {redirect_to post_path(post)}
        format.js {render}
      else
        format.html {render :show}
      end
    end
  end

  private
    def comment_params
      params.require(:comment).permit(:body)
    end

    def find_comment
      @comment = Comment.find(params[:id])
    end

end
