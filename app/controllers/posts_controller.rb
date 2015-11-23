class PostsController < ApplicationController

  before_action :find_post, {only: [:update, :show, :edit, :destroy]}
  before_action :authorize, only: [:edit, :update, :destroy]

  # def index
  #   @posts = Post.order(:updated_at)
  #   @posts_per_page = 5
  #   @page_index = params[:page_index]
  #   @page_index ||= 1
  #   render :index
  # end

  def new
    @post = Post.new
  end

  def create
    @post = Post.new(post_params)
    @post.user = current_user
    if @post.save
      redirect_to post_path(@post)
    else
      render :new
    end
  end

  def edit
    redirect_to root_path, alert: "Access denied!" unless can? :edit, @post
  end

  def update
    if @post.update(post_params)
      redirect_to post_path(@post)
    else
      render :edit
    end
  end

  def show
    @comment = Comment.new
  end


  def index
    @posts = Post.search(params[:search]).order(:updated_at).reverse
    @posts_per_page = 5
    @page_index = params[:page_index]
    @page_index ||= 1
    render :index
  end

  def destroy
    if @post.destroy
      redirect_to posts_path
    else
      render post_path(@post)
    end
  end

  def authorize
    redirect_to root_path, alert: "Access denied!" unless can? :manage, @post
  end

  private
    def find_post
      @post = Post.find(params[:id])
    end

    def post_params
      params.require(:post).permit([:title, :body, {tag_ids: []}, :image])
    end

end
