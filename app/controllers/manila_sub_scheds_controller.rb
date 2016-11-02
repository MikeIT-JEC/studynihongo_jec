class ManilaSubSchedsController < ApplicationController
  before_action :require_user 
 
  def new  
    @manilasched = ManilaSched.friendly.find(params[:id])
    @showsubsched = ManilaSubSched.where(:manila_sched_id => @manilasched).order(created_at: :desc)
    @subschedule = ManilaSubSched.new 
    @manilastudents = ManilaStudent.all.order(created_at: :desc)
  end

  def show
    @manilasched = ManilaSched.friendly.all
    @manilasubsched = ManilaSubSched.friendly.find(params[:id])
  end
  
  def create
    @subschedule = ManilaSubSched.new(submanilasched_params)
    if @subschedule.save
      redirect_to :back, :notice => "New Sub-Schedule added Successfully"
    else
      redirect_to :back, :notice => "Error on Creating New Sub-Schedule"
    end
  end
  
  def edit    
    @getsubsched = ManilaSubSched.find(params[:id]) 
    @manilasched = ManilaSched.find(@getsubsched.manila_sched_id) 
  end  

  def update 
    @getsubsched = ManilaSubSched.find(params[:id])
      if @getsubsched.update_attributes(submanilasched_params)
        redirect_to :back, :notice => "Updated Sub-Schedule Successfully"
      else
        redirect_to :back, :notice => "Updating Sub-Schedule Failed"
      end
  end 

  def destroy
    @deleteschedule = ManilaSubSched.find(params[:id])
    if @deleteschedule.destroy
      redirect_to :back, :notice => "Deleted Sub-Schedule Successfully"
    else
      redirect_to :back, :notice => "Deleting Sub-Schedule Failed"
    end
  end  

  private

  def submanilasched_params 
    params.require(:manila_sub_sched).permit(:manila_sched_id, :admin_id, :ms_day, :ms_session, :ms_time, :ms_jlpt_level, :ms_status, :ms_starts, :ms_slots)
  end

end
