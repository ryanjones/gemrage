class ProjectsController < ApplicationController
  def show
    @project = Project.find(params[:slug]) rescue nil
    render(:action => 'project_not_found', :status => :not_found) and return unless @project
  end
end