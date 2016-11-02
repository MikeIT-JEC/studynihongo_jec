class CebuSched < ActiveRecord::Base
	belongs_to :admin
	has_many :cebu_sub_sched   

  extend FriendlyId 
	friendly_id :duration, use: :slugged  

   	def should_generate_new_friendly_id?
	    slug.blank? || self.duration_changed?
	end 
end
