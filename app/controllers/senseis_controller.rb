class SenseisController < ApplicationController
  def index
  	@cebu_sensei_personal_information = TeacherInformation.where(:branch => 'cebu') 
  	@manila_sensei_personal_information = TeacherInformation.where(:branch => 'manila') 

  	@qualifications = TeacherQualification.all
  	@backgrounds = TeacherBackground.all
  end
end
