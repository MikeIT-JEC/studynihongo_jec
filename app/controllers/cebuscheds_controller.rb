class CebuschedsController < ApplicationController
  before_action :require_user 

  def index    
    @cebuscheds = CebuSched.where(:admin_id => current_user.id).order(created_at: :desc)
  end

  def show
    @showsched = CebuSched.friendly.find(params[:id])  
  end

  def new  
    @cebuschedule = CebuSched.new 
  end

  def create
  	@newschedule = CebuSched.new(cebusched_params)
  	if @newschedule.save!
  		redirect_to "/cebu/dashboard", :notice => "New Schedule Successfully Added"
  	else
  		redirect_to "/cebu/new_schedule", :notice => "Error on Adding New Schedule"
  	end
  end

  def edit    
    @updateschedule = CebuSched.friendly.find(params[:id])
  end  

  def update
    @updateSchedule = CebuSched.friendly.find(params[:id])
    if @updateSchedule.update_attributes(cebusched_params)
      redirect_to "/cebu/dashboard", :notice => "Schedule Updated Successfully"
    else
      redirect_to "/cebu/new_schedule/:id", :notice => "Updating Schedule Failed"
    end
  end 

  def destroy
    @deleteschedule = CebuSched.find(params[:id])
    if @deleteschedule.destroy
      redirect_to "/cebu/dashboard", :notice => "Schedule DeletedSuccessfully"
    else
      redirect_to "/cebu/dashboard", :notice => "Deleting Schedule Failed"
    end
  end   

  private

  def cebusched_params
    params.require(:cebu_sched).permit(:admin_id, :duration, :status, :slug)
  end
 
end
