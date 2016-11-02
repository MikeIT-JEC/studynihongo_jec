class PasswordResetsController < ApplicationController 
	skip_before_action :require_user

	def new 
	end

    def create
  	  @admin = Admin.find_by_email(params[:email]) 
  	  	@admin.send_password_reset if @admin
  	  	redirect_to ncrs_login_url, :notice => "Email sent with password reset instructions"  
    end

	def edit
	   @admin = Admin.find_by_password_reset_token!(params[:id])
	end

	def update
	  @admin = Admin.find_by_password_reset_token!(params[:id])
	  if @admin.password_reset_sent_at < 2.hours.ago
	    redirect_to new_password_reset_path, :alert => "Password reset has expired."
	  elsif @admin.update_attributes(user_params)
	    redirect_to ncrs_login_url, :notice => "Password has been reset!"
	  else
	    render :edit
	  end
	end

  	def user_params
    	params.require(:admin).permit(:email, :password, :password_confirmation)
  	end

end
