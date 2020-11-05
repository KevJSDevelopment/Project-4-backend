class MessagesController < ApplicationController


    def create
        # ActionCable.server.broadcast "channel_channel", body: params[:message] 

        message = Message.new(text: params[:message], user_id: 1, channel_id: 2)

        if message.save
            channel = Channel.find(2)
            ChannelChannel.broadcast_to(channel, message)
        else
            message = "sucks to suck"
            render json: message.json()
        end

    end

end
