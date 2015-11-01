class Comment < ActiveRecord::Base

  validates :body, uniqueness: {scope: :post_id,
                                message: "Comment with exact same body already exists."}

end
