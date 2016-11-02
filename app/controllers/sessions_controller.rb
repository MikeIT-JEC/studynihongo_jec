class SessionsController < ApplicationController
  before_action :current_user

  def new
  end

  	def create
	  admin = Admin.authenticate(params[:email], params[:password])
	  if admin
	  	cookies.permanent[:auth_token] = admin.auth_token 
	    redirect_to "/admin/dashboard"
	  else
	    redirect_to ncrs_login_path, :notice => "Invalid email or password"
	  end
	end

	def destroy
	  cookies.delete(:auth_token)
	  redirect_to ncrs_login_path, :notice => "Logged out!"
	end

end
