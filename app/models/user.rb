class User < ActiveRecord::Base

  has_secure_password

  has_many :comments, dependent: :nullify
  has_many :posts, dependent: :nullify

  validates :email, presence: true, uniqueness: true


end
