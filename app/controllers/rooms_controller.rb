class RoomsController < ApplicationController
  before_action :authenticate_user!

  def index
    render locals: { rooms: Room.all }
  end

  def new
    render locals: { room: Room.new }
  end

  def create
    room = Room.new(room_params)

    if room.save
      redirect_to rooms_path
    else
      render :new, locals: { room: room }
    end
  end

  def show
    render locals: {
      room: room,
      room_comment: room.comments.new
    }
  end

  private

  def room
    Room.find(params.require(:id))
  end

  def room_params
    params.require(:room).permit(
      :name
    )
  end
end
