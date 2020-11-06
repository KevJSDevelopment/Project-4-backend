class ChannelChannel < ApplicationCable::Channel
  def subscribed
    # stream_from "some_channel"
    #@channel = Channel.find(2) #probably change to a variable that will be passed in body ... 
    channel = Channel.find(params[:id])
    stream_for channel
  end

  def unsubscribed
    # Any cleanup needed when channel is unsubscribed
  end
#end





  # def received(data)
  #   byebug
  #   ChannelChannel.broadcast_to(@channel, {channel: @channel, users: @channel.users, messages: @channel.messages})
  # end
end
