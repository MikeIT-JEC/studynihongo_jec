class TeacherQualificationsController < ApplicationController

  def create
  	@teachers_qualification = TeacherQualification.new(teacher_qualification_params)
  	if @teachers_qualification.save
  		redirect_to admin_teachers_path
  	else
  		redirect_to admin_teachers_path
  	end
  end 

  def destroy
  	@teachers_qualification = TeacherQualification.find(params[:id])
  	if @teachers_qualification.destroy
  		redirect_to admin_teachers_path
  	else
  		redirect_to admin_teachers_path
  	end
  end


  private
  def teacher_qualification_params
  	params.require(:teacher_qualification).permit(:teacher_information_id, :qualification)
  end

end
