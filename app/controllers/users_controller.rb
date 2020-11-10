class UsersController < ApplicationController

    def login
        user = User.find_by(username: params[:username])
        if user && user.authenticate(params[:password])
            render json: {
                auth: true,
                user: user,
                channels: user.channels,
                token: encode({user_id: user.id})
            }
        else
            render json: {
                auth: false,
                info: ["password or username was not valid, please try again"]
            }
        end
    end

    def show
        token = request.headers["Authentication"].split(" ")[1]
        user = User.find(decode(token)["user_id"])

        if user 
            render json: {
                auth: true,
                user: user,
                channels: user.channels,
                token: encode({user_id: user.id})
            }
        else
            render json: {
                auth: false,
                info: ["Not a valid user"]
            }
        end
    end

    def create
        user = User.new(username: params[:username], password: params[:password])
        if user.save
            render json: {
                auth: true,
                user: user,
                channels: [],
                token: encode({user_id: user.id})
            }
        else
            render json: {
                auth: false,
                info: user.errors.full_messages
            }
        end

    end

    def update 
        token = request.headers["Authentication"].split(" ")[1]
        user = User.find(decode(token)["user_id"])
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
