class ProjectsController < ApplicationController
  def show
    @project = Project.find(params[:slug]) rescue nil
    render(:action => 'project_not_found', :status => :not_found) and return unless @project
  end

  def edit
    @project = current_user.projects.find(params[:id])
  rescue
    redirect_back_or_default('/')
  end

  def update
    @project = current_user.projects.find(params[:id])
    name = params[:project][:name] and @project.update_attributes(:name => name)
    redirect_to(user_project_path(current_user.handle, @project.to_param))
  rescue
    redirect_back_or_default('/')
  end

  def destroy
    @project = current_user.projects.find(params[:id])
    @project.destroy
  ensure
    redirect_to('/')
  end
end