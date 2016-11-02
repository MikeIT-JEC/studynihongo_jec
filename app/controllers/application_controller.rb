class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  helper_method :current_user  

	def current_user
     	@current_user ||= Admin.find_by_auth_token(cookies[:auth_token]) if cookies[:auth_token]
	  end
	end 

   	def require_user
   		redirect_to ncrs_login_url, :notice => "Please login first" unless current_user
   	end 

	# def require_admin
 #  		redirect_to '/admin/dashboard', :notice => "Please login first" unless current_user.admin
	# end 

	# def require_contributor
 #  		redirect_to '/admin/dashboard', :notice => "Please login first" unless current_user.contributor
	# end 
 