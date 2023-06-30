class RoomCommentsController < ApplicationController
  def create
    comment = Comment.new(comment_params)

    if comment.save
      room = Room.find(room_id)

      respond_to do |format|
        format.turbo_stream {
          render locals: { room: room }
        }
        format.html {
          redirect_to room_path(room)
        }
      end
    else
      raise "error"
    end
  end

  private

  def room_id
    params.require(:room_id)
  end

  def comment_params
    params.require(:comment).permit(
      :body
    ).merge(
      commentable_id: room_id,
      commentable_type: "Room",
      user_id: current_user.id
    )
  end
end
