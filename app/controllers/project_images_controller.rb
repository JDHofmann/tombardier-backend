class ProjectImagesController < ApplicationController

    def index 
        project_images = ProjectImage.all 

        render json: project_images
    end 

    def create 
        project_image = ProjectImage.create(pi_params) 

        render json: project_image
    end 

    def update 
        project_image = ProjectImage.all.find(params[:id])
        project_image.update(pi_params)
        render json: project_image
    end 

    def destroy 
        project_image = ProjectImage.all.find(params[:id])
        project_image.destroy
        render json: project_image
    end 

    private 

    def pi_params
        params.require(:project_image).permit!
    end 
end
