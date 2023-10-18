class RoomChannel < ApplicationCable::Channel
  def subscribed
    # stream_from 'room'
    stream_from "room_#{params[:room]}"
  end

  def subscribed
    # room = Room.find_by(name: 'someroom')
    # stream_for room

    # room = Room.find(params[:id])
    room = Room.find(params[:room])
    stream_for room
  end

  def unsubscribed
    # Any cleanup needed when channel is unsubscribed
  end
end
