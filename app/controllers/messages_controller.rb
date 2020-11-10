class MessagesController < ApplicationController

    def create
        # ActionCable.server.broadcast "channel_channel", body: params[:message] 
        message = Message.new(text: params[:message], user_id: User.first().id, channel_id: Channel.find(params[:channel_id]).id)
        # byebug

        if message.save
            # byebug
            channel = Channel.find(params[:channel_id])
            ChannelChannel.broadcast_to(channel, {channel: channel, message_info: {data: message, user: message.user}})
        else
            # byebug
            message = "sucks to suck"
            render json: message.json()
        end

    end

end
