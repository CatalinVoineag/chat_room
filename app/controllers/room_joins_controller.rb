class RoomJoinsController < ApplicationController
  before_action :authenticate_user!

  def create
    if room.join(user: current_user)
      redirect_to room_path(room)
    else
      # show error
      raise "error"
    end
  end

  private

  def room_id
    params.require(:room_id)
  end

  def room
    @room ||= Room.find(room_id)
  end
end
