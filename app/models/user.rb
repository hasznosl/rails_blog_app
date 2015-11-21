class User < ActiveRecord::Base

  has_secure_password

  has_many :comments, dependent: :nullify
  has_many :posts, dependent: :nullify

  has_many :favourites, dependent: :destroy
  has_many :favourited_posts, through: :favourites, source: :post


  validates :email, presence: true, uniqueness: true


end
