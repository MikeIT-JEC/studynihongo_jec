class AdminsController < ApplicationController  

  def new
  	@admin = Admin.new
  end 

  def create
  	@admin = Admin.new(admin_params)
	  if @admin.save 
	    redirect_to ncrs_login_path, :notice => "Signed up!"
	  else
	    render "new"
	  end
  end

  private

  def admin_params 
  	params.require(:admin).permit(:email, :name, :password, :password_confirmation)
  end

end
