class UsersController < ApplicationController
    skip_before_action :authorized, only: [:show, :index]

    def index 
        users = User.all 

        render json: users 
    end 

    def show 
        user = User.all.find(params[:id])
        render json: user
    end 

    def profile
        render json: { user: current_user }, status: :accepted
    end

    def update
        user = User.all.find(params[:id])
        user.update(user_params)

        render json: user
    end 

    private 

    def user_params 
        params.require(:user).permit(:site_title, :email, :site_subtitle, :bio, :description, :contact_email, :image, :password_digest)
    end 
end
