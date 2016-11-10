class Gallery < ActiveRecord::Base

	has_attached_file :image, styles: {large: "800x400>", medium: "300x300>", thumb: "150x150#"}
	validates_attachment_content_type :image, content_type: /\Aimage\/.*\Z/
	validates_presence_of :caption

end
