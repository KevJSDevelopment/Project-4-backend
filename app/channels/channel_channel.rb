class ChannelChannel < ApplicationCable::Channel
  def subscribed
    # stream_from "some_channel"
    @channel = Channel.find(params[:id]) #probably change to a variable that will be passed in body ... 
    stream_for @channel
  end

  def received(data)

    ChannelChannel.broadcast_to(@channel, {channel: @channel, users: @channel.users, messages: @room.messages})

  end

  def unsubscribed
    # Any cleanup needed when channel is unsubscribed
  end
end
