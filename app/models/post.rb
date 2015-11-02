class Post < ActiveRecord::Base

  validates :title, {presence: true,
                    uniqueness: {message: "Post title already exists"}}

end
