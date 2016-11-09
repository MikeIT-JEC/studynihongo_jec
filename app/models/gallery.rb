class Gallery < ActiveRecord::Base
	
	attr_accessor :image
	
	has_attached_file :image, styles: {large: "600x600>", medium: "300x300>", thumb: "150x150#", average: "100x100#", below_average: "70x70#", small: "30x30#"}
	validates_attachment_content_type :image, content_type: /\Aimage\/.*\Z/
end
