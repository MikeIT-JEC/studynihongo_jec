class InquiriesController < ApplicationController 
  before_action :require_user 
  
  def index
  	@inquiries = Inquiry.all.order(created_at: :desc)
  end

  def new
  end 

  def create
  	@inquiry = Inquiry.new(inquiry_params)
  	if @inquiry.save
  		redirect_to root_path, :notice => "Your inquiry means a lot to us and we will enteratain you right away."
  	else
  		redirect_to root_path, :notice => "Inquiry sending failed."
  	end
  end

  private

  def inquiry_params
  	params.require(:inquiry).permit(:name, :email, :contactnumber, :inquiry)
  end

end