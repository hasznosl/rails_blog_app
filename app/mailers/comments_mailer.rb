class CommentsMailer < ApplicationMailer

  def notify_post_owner(post, commenter_name)
    @owner = post.user
    @post_title = post.title
    if(@owner.email.present?)
      mail(to: @owner.email, subject: "#{commenter_name} commented on your post.")
    end
  end

end
