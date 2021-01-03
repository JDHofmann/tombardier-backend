class UserLinksController < ApplicationController

    def index 
        user_links = UserLink.all 

        render json: user_links
    end 

    def create 
        user_link = UserLink.create(user_link_params)

        render json: user_link
    end 

    def update 
        user_link = UserLink.all.find(params[:id])
        user_link.update(user_link_params)

        render json: user_link 
    end 

    def destroy 
        user_link = UserLink.all.find(params[:id])
        user_link.destroy

        render json: user_link 
    end

    private 

    def user_link_params 
        params.require(:user_link).permit!
    end 
end
