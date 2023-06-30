class Comment < ApplicationRecord
  belongs_to :commentable, polymorphic: true
  belongs_to :user

  after_create_commit -> { broadcast_prepend_to "comments", partial: "room_comments/comments", locals: { room: self.commentable }, target: "comments" }


  after_destroy_commit -> { broadcast_prepend_to "comments", partial: "room_comments/comments", locals: { room: self.commentable }, target: "comments" }
end
