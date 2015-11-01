class Post < ActiveRecord::Base

  validates :title, presence: true,
                    uniqueness: {message: "Post with title already exists. Please select another one."}

end
