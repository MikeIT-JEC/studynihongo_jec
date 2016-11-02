class ManilaSubSched < ActiveRecord::Base
  belongs_to :manila_sched 

  validates_presence_of :manila_sched_id, :admin_id, :ms_day, :ms_session, :ms_time, :ms_jlpt_level, :ms_status, :ms_slots

  extend FriendlyId 
	friendly_id :ms_day, use: :slugged  

   	def should_generate_new_friendly_id?
	    slug.blank? || self.ms_day_changed?
	end 
end
