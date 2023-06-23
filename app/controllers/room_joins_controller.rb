class RoomJoinsController < ApplicationController
  before_action :authenticate_user!

  def create
    # this adds another user along side the one that exists
    if room.users << current_user
      redirect_to root_path
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
