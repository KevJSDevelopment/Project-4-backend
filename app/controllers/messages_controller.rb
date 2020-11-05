class MessagesController < ApplicationController


    def create
        ActionCable.server.broadcast "channel_channel", body: params[:message] 
    end

end
