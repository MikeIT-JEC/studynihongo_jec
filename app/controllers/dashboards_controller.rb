class DashboardsController < ApplicationController  
  before_action :require_user  

  def index
  	@teachers = TeacherInformation.all 
  end

end
