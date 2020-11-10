class UsersController < ApplicationController

    def login
        user = User.find_by(username: params[:username])
        if user && user.authenticate(params[:password])
            render json: {
                auth: true,
                user: user,
                channels: user.channels
            }
        else
            render json: {
                auth: false,
                info: ["password or username was not valid, please try again"]
            }
        end
    end


    def create
        user = User.new(username: params[:username], password: params[:password])
        if user.save
            render json: {
                auth: true,
                user: user
            }
        else
            render json: {
                auth: false,
                info: user.errors.full_messages
            }
        end

    end

    def update 
        user = User.find(params[:id])
        if user 
            user.update(background: params[:background], icon: params[:icon])
            render json: {
                user: user,
                auth: true
            }
        else
            render json: {
                auth: false,
                info: ["failure"]
            }
        end
    end

end
