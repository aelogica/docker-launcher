require 'docker'

class InstancesController < ApplicationController
  def create
    Resque.enqueue(StartsContainerJob, params[:project_id], params[:email])

    respond_to do |format|
      format.html { redirect_to root_url }
    end
  end
end
