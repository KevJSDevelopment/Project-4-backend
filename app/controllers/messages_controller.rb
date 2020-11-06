class MessagesController < ApplicationController

    def create
        # ActionCable.server.broadcast "channel_channel", body: params[:message] 
        message = Message.new(text: params[:message], user_id: 1, channel_id: 1)

        if message.save
            # byebug
            channel = Channel.first()
            ChannelChannel.broadcast_to(channel,  {channel: channel, users: channel.users, message: message})
        else
            # byebug
            message = "sucks to suck"
            render json: message.json()
        end

    end

end
