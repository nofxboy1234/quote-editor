class MessagesController < ApplicationController
  def create
    @room = Room.find(params[:id])
    @message = @room.messages.build(message_params)
    @message.save

    RoomChannel.broadcast_to(@room, @message) # if using stream_for in room_channel.rb
    # RoomChannel.broadcast_to(@room, name: 'Kevin', dork_status: 'Ultimate')
    ActionCable.server.broadcast("room_#{params[:room]}", @message) # if using stream_from in room_channel.rb
  end
end
