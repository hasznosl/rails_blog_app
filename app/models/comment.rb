class Comment < ActiveRecord::Base

# temporarily disabled, until no associations
  # validates :body, uniqueness: {scope: :post_id,
  #                               message: "Comment with exact same body already exists."}

end
