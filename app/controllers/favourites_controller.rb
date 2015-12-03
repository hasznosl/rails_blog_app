class FavouritesController < ApplicationController


  before_action :authenticate_user

  def create
    fav = Favourite.new
    fav.user = current_user
    post = Post.find_by_id(params[:post_id])
    fav.post = post
    if can? :create, fav
      if fav.save
        redirect_to post_path(post), notice: "Favourited successfully!"
      else
        redirect_to post_path(post), alert: "Not favourited!"
      end
    else
      redirect_to post_path(post), notice: "Cannot favourite your own post!"
    end
  end


  def destroy
    @post = Post.find(params[:post_id])
    fav = current_user.favourites.find(params[:id])
    fav.destroy
    redirect_to @post, notice: "Unfavourited successfully!"

  end

end
