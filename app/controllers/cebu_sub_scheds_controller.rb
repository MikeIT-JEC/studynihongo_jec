class CebuSubSchedsController < ApplicationController 
  before_action :require_user 
 
  def new  
    @cebusched = CebuSched.friendly.find(params[:id])
    @showsubsched = CebuSubSched.where(:cebu_sched_id => @cebusched).order(created_at: :desc)
    @subschedule = CebuSubSched.new 
    @cebustudents = CebuStudent.all.order(created_at: :desc)
  end

  def show
    @cebusched = CebuSched.friendly.all
    @cebusubsched = CebuSubSched.friendly.find(params[:id])
  end
  
  def create
    @subschedule = CebuSubSched.new(subcebusched_params)
    if @subschedule.save
      redirect_to :back, :notice => "New Sub-Schedule added Successfully"
    else
      redirect_to :back, :notice => "Error on Creating New Sub-Schedule"
    end
  end
  
  def edit    
    @getsubsched = CebuSubSched.find(params[:id]) 
    @cebusched = CebuSched.find(@getsubsched.cebu_sched_id) 
  end  

  def update 
    @getsubsched = CebuSubSched.find(params[:id])
      if @getsubsched.update_attributes(subcebusched_params)
        redirect_to :back, :notice => "Updated Sub-Schedule Successfully"
      else
        redirect_to :back, :notice => "Updating Sub-Schedule Failed"
      end
  end 

  def destroy
    @deleteschedule = CebuSubSched.find(params[:id])
    if @deleteschedule.destroy
      redirect_to :back, :notice => "Deleted Sub-Schedule Successfully"
    else
      redirect_to :back, :notice => "Deleting Sub-Schedule Failed"
    end
  end  

  private

  def subcebusched_params 
    params.require(:cebu_sub_sched).permit(:cebu_sched_id, :admin_id, :cs_day, :cs_session, :cs_time, :cs_jlpt_level, :cs_status, :cs_starts, :cs_slots)
  end

end
