class Admin < ActiveRecord::Base
	has_many :CebuSched 
	has_many :article

	attr_accessor :password
	before_save :encrypt_password
	after_save :clear_password  
	before_create { generate_token(:auth_token)}

  	validates_presence_of :name
	
	VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  	validates :email, presence: true, :uniqueness => true, format: { with: VALID_EMAIL_REGEX }

	validates :password, :confirmation => true
	validates_presence_of :password, :on => :create
	validates_length_of :password, :in => 6..20, :on => :create

	def self.authenticate(email,password)
		admin = find_by_email(email)
		if admin && admin.password_hash == BCrypt::Engine.hash_secret(password, admin.password_salt)
			admin
		else	
			nil
		end
	end

	def encrypt_password
		if password.present?
			self.password_salt = BCrypt::Engine.generate_salt
			self.password_hash = BCrypt::Engine.hash_secret(password, password_salt)
		end
	end

	def clear_password
		self.password = nil
	end

	def send_password_reset
	  generate_token(:password_reset_token)
	  self.password_reset_sent_at = Time.zone.now
	  save!
	  AdminMailer.password_reset(self).deliver_now
	end 

	def generate_token(column)
	  begin
	    self[column] = SecureRandom.urlsafe_base64
	  end while Admin.exists?(column => self[column])
	end 
	
end
