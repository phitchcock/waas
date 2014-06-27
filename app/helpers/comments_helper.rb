module CommentsHelper
  def comments_tree_for(comments)
    comments.map do |comment, replies|
      render(comment) +
          (replies.size > 0 ? content_tag(:div, comments_tree_for(replies), class: "replies") : nil)
    end.join.html_safe
  end
end
