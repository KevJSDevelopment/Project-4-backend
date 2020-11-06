class MessagesController < ApplicationController

    def create
        # ActionCable.server.broadcast "channel_channel", body: params[:message] 
        message = Message.new(text: params[:message], user_id: User.first().id, channel_id: Channel.first().id)
        # byebug

        if message.save
            # byebug
            channel = Channel.first()
            ChannelChannel.broadcast_to(channel, {channel: channel, users: channel.users, message: message, sent: message.user})
        else
            # byebug
            message = "sucks to suck"
            render json: message.json()
        end

    end

end
