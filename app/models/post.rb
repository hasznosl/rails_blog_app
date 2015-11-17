class Post < ActiveRecord::Base

  has_many :comments, dependent: :nullify
  belongs_to :user

  has_many :taggings, dependent: :destroy
  has_many :tags, through: :taggings



  validates :title, {presence: true,
                    uniqueness: {message: "Post title already exists"}}

  def self.search(string)
    where("title ILIKE ? OR body ILIKE ?", "%#{string}%", "%#{string}%")
  end

end
