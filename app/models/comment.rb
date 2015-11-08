class Comment < ActiveRecord::Base

  belongs_to :post
  belongs_to :user

   validates :body, uniqueness: {scope: :post_id,
                                 message: "Comment with exact same body already exists."}


end
