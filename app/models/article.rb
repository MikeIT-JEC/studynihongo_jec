class Article < ActiveRecord::Base 
	belongs_to :admin
	
	validates_presence_of :title, :body
	validates_uniqueness_of :title, :body

  extend FriendlyId 
	friendly_id :title, use: :slugged  

   	def should_generate_new_friendly_id?
	    slug.blank? || self.title_changed?
	end 
end
