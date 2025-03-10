class UsersController < ApplicationController
    skip_before_action :authorize, only: :create

    def create
        user = User.create!(user_params)
        session[:user_id] = user.id
        render json: user, status: :created
    end

    def show
        # user = User.find_by(id: session[:user_id])
        # if user
            render json: @current_user, status: 201
        # else
        #     render json: {error: "not authorized"}, status: 401
        # end
    end

    private

    def user_params
        params.permit(:username, :password, :password_confirmation, :image_url, :bio)
    end
end
