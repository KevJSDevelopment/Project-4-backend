class ChannelsController < ApplicationController


    def show 
        channel = Channel.find(params[:id])
        #change this and any other .first methods to make them dynamic???????
        render json: {channel: channel, message_info: channel.messages.map {|message| {data: message, user: message.user}}}.to_json()
    end

    def index
        channels = Channel.all
        render json: channels.to_json()
    end

    def create 
        channel = Channel.new(name: params[:name])

        if channel.save  
            render json: channel.to_json()
        else 
            message = "failed"
            render json: message.to_json()
        end
    end
end

