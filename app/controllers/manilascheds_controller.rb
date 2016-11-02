class ManilaschedsController < ApplicationController
  before_action :require_user 

  def index    
    @manilascheds = ManilaSched.where(:admin_id => current_user.id).order(created_at: :desc)
  end

  def show
    @showsched = ManilaSched.friendly.find(params[:id])  
  end

  def new  
    @manilaschedule = ManilaSched.new 
  end

  def create
  	@newschedule = ManilaSched.new(manilasched_params)
  	if @newschedule.save!
  		redirect_to "/manila/dashboard", :notice => "New Schedule Successfully Added"
  	else
  		redirect_to "/manila/new_schedule", :notice => "Error on Adding New Schedule"
  	end
  end

  def edit    
    @updateschedule = ManilaSched.friendly.find(params[:id])
  end  

  def update
    @updateSchedule = ManilaSched.friendly.find(params[:id])
    if @updateSchedule.update_attributes(manilasched_params)
      redirect_to "/manila/dashboard", :notice => "Schedule Updated Successfully"
    else
      redirect_to "/manila/new_schedule/:id", :notice => "Updating Schedule Failed"
    end
  end 

  def destroy
    @deleteschedule = ManilaSched.find(params[:id])
    if @deleteschedule.destroy
      redirect_to "/manila/dashboard", :notice => "Schedule DeletedSuccessfully"
    else
      redirect_to "/manila/dashboard", :notice => "Deleting Schedule Failed"
    end
  end   

  private

  def manilasched_params
    params.require(:manila_sched).permit(:admin_id, :duration, :status, :slug)
  end
 
end
