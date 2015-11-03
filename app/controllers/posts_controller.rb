class PostsController < ApplicationController


  before_action :find_post, {only: [:update, :show, :edit, :destroy]}

  def index
    @posts = Post.order(:updated_at).page(params[:page]).per(5)
  end

  def new
    @post = Post.new
  end

  def create
    @post = Post.new(post_params)
    if @post.save
      redirect_to post_path(@post)
    else
      render :new
    end
  end

  def edit
  end

  def update
    if @post.update(post_params)
      redirect_to post_path(@post)
    else
      render :edit
    end
  end

  def show
  end

  def search_result posts
    @posts = posts.order(:updated_at).page(params[:page]).per(5)
    render :search_result
  end

  def search
    @posts = Post.search(params[:search])
    search_result(@posts)
  end

  def destroy
    if @post.destroy
      redirect_to posts_path
    else

    end
  end

  private
    def find_post
      @post = Post.find(params[:id])
    end

    def post_params
      params.require(:post).permit([:title, :body])
    end

end
