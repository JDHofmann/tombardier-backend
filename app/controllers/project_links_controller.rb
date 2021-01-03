class ProjectLinksController < ApplicationController
    def create 
        project_link = ProjectLink.create(project_link_params)

        render json: project_link
    end 

    def update 
        project_link = ProjectLink.all.find(params[:id])
        project_link.update(project_link_params)

        render json: project_link 
    end 

    def destroy 
        project_link = ProjectLink.all.find(params[:id])
        project_link.destroy

        render json: project_link 
    end

    private 

    def project_link_params 
        params.require(:project_link).permit!
    end
end
