class Post < ActiveRecord::Base

  has_many :comments, dependent: :nullify
  belongs_to :user

  has_many :taggings, dependent: :destroy
  has_many :tags, through: :taggings

  has_many :favourites, dependent: :destroy
  has_many :favouriting_users, through: :favourites, source: :user



  validates :title, {presence: true,
                    uniqueness: {message: "Post title already exists"}}


  def creator_user_name
    user.full_name
  end

  def self.search(string)
    where("title ILIKE ? OR body ILIKE ?", "%#{string}%", "%#{string}%")
  end

  def favourite_for user
    favourites.find_by_user_id(user.id)
  end

  def fav_by user
    favourite_for(user).present?
  end

  def favs_count
    favourites.count
  end

end
