class TeacherInformation < ActiveRecord::Base
	has_many :teacher_qualification
	has_many :teacher_background
	before_save :downcase_fields

	has_attached_file :image, styles: {large: "600x600>", medium: "300x300>", thumb: "150x150#"}
	validates_attachment_content_type :image, content_type: /\Aimage\/.*\Z/

	validates_presence_of :name, :age, :address, :emailaddress, :contact_number, :image, :branch

	def downcase_fields
		self.branch.downcase!
	end
end
