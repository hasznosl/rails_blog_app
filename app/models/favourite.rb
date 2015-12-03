class Favourite < ActiveRecord::Base
  belongs_to :user
  belongs_to :post

  validates :user, presence: true
  validates :post, presence: true


  def post_creator_user
    post.user
  end

end
