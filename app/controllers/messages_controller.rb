class MessagesController < ApplicationController

    def create
        token = request.headers["Authentication"].split(" ")[1]
        user = User.find(decode(token)["user_id"])
        
        message = Message.new(text: params[:message], user_id: user.id , channel_id: Channel.find(params[:channel_id]).id)

        if message.save
            channel = Channel.find(params[:channel_id])
            ChannelChannel.broadcast_to(channel, {channel: channel, message_info: {data: message, user: message.user}})
        else
            message = "sucks to suck"
            render json: message.json()
        end

    end

end
