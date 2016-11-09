class Article < ActiveRecord::Base 
	belongs_to :admin
	attr_accessor :image
	
	validates_presence_of :title, :body
	validates_uniqueness_of :title, :body 

	has_attached_file :image, styles: {large: "800x400>", medium: "300x300>", thumb: "150x150#", average: "100x100#", below_average: "70x70#", small: "30x30#"}
	validates_attachment_content_type :image, content_type: /\Aimage\/.*\Z/

  extend FriendlyId 
	friendly_id :title, use: :slugged  

   	def should_generate_new_friendly_id?
	    slug.blank? || self.title_changed?
	end 
end
