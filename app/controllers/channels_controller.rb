class ChannelsController < ApplicationController


    def show 
        channel = Channel.find(params[:id])

        render json: channel.to_json()
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
