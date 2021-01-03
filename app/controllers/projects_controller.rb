class ProjectsController < ApplicationController

    def index 
        projects = Project.all
        render json: projects

    end 

    def create 
        project = Project.create(p_params)
        render json: project
    end 

    def update 
        project = Project.all.find(params[:id])
        project.update(p_params)
        render json: project
    end 

    def destroy 
        project = Project.all.find(params[:id])
        project_images = ProjectImage.all.filter{|pi| pi.project_id == project.id}
        project_images.each do |pi|
            pi.destroy
        end 
        project_links = ProjectLink.all.filter{|pl| pl.project_id == project.id}
        project_links.each do |pl|
            pl.destroy
        end
        project.destroy
        render json: project
    end 

    private 

    def p_params
        params.require(:project).permit!
    end

end
