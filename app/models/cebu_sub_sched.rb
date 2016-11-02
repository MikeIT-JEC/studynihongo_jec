class CebuSubSched < ActiveRecord::Base
  belongs_to :cebu_sched

  validates_presence_of :cebu_sched_id, :admin_id, :cs_day, :cs_session, :cs_time, :cs_jlpt_level, :cs_status, :cs_slots

  extend FriendlyId 
	friendly_id :cs_day, use: :slugged  

   	def should_generate_new_friendly_id?
	    slug.blank? || self.cs_day_changed?
	end 

end
