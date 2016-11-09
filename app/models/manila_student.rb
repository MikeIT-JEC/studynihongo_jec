class ManilaStudent < ActiveRecord::Base

	VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  	validates :emailaddress, presence: true, format: { with: VALID_EMAIL_REGEX } 
	validates_presence_of :firstname, :lastname, :contactnumber, :address
end
