class Post < ActiveRecord::Base

  validates :title, {presence: true,
                    uniqueness: {message: "Post title already exists"}}

  def self.search(string)
    where("title ILIKE ? OR body ILIKE ?", "%#{string}%", "%#{string}%")
  end

end
