class TeacherQualification < ActiveRecord::Base
  belongs_to :teacher_information 

  validates_presence_of :qualification
end
