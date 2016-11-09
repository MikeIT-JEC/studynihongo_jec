class TeachersController < ApplicationController
  before_action :require_user 

  def index
  	@teachers = TeacherInformation.all  
  	@qualification = TeacherQualification.all
  	@background = TeacherBackground.all

  	@teachers_qualification = TeacherQualification.new
  	@teachers_background = TeacherBackground.new
  end

  def new
  	@teachers = TeacherInformation.new
  end

  def create
  	@teachers = TeacherInformation.new(teacher_information_params)
  	if @teachers.save
  		redirect_to admin_teachers_path, notice: "Successfully added new teacher."
  	else
  		render "new"
  	end
  end

  def create_background
  	@teachers_background = TeacherBackground.new(teacher_background_params)
  	if @teachers_background.save!
  		redirect_to admin_teachers_path
  	else
  		redirect_to admin_teachers_path
  	end
  end

  def edit
  	@edit_teacher = TeacherInformation.find(params[:id])
  end

  def update
  	@update_teacher = TeacherInformation.find(params[:id])
  	if @update_teacher.update_attributes(teacher_information_params)
  		redirect_to admin_teachers_path, notice: "Successfully Edited teacher."
  	else
  		redirect_to admin_teachers_path, notice: "Error updating teacher."
  	end
  end

  def destroy
  	@delete_teacher = TeacherInformation.find(params[:id])
  		if @delete_teacher.destroy
  			redirect_to admin_teachers_path, notice: "Successfully deleted teacher."
  		else
  			redirect_to admin_teachers_path, notice: "Deleting unsuccessful."
  		end
  end

  private
  def teacher_information_params
  	params.require(:teacher_information).permit(:name, :age, :address, :emailaddress, :contact_number, :image, :branch)
  end 
  
end
