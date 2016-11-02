class TeacherBackgroundsController < ApplicationController
  
  def create
  	@teachers_background = TeacherBackground.new(teacher_background_params)
  	if @teachers_background.save
  		redirect_to admin_teachers_path
  	else
  		redirect_to admin_teachers_path
  	end
  end 
  
  def destroy
  	@teachers_background = TeacherBackground.find(params[:id])
  	if @teachers_background.destroy
  		redirect_to admin_teachers_path
  	else
  		redirect_to admin_teachers_path
  	end
  end


  private
  def teacher_background_params
  	params.require(:teacher_background).permit(:teacher_information_id, :background)
  end

end
