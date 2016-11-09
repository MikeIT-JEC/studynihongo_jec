class ManilaStudentsController < ApplicationController
  
  def new
    @manilasched = ManilaSubSched.friendly.find(params[:id])
    @showmanilasched = ManilaSched.find(@manilasched.manila_sched_id)
    @manilastudent = ManilaStudent.new
    end

    def create
      @manilastudent = ManilaStudent.new(student_params)
      if @manilastudent.save
            if @manilastudent.payment_scheme == "Bank"
                PaymentScheme.bank_payment(@manilastudent).deliver_now
            else
                PaymentScheme.counter_payment(@manilastudent).deliver_now
            end
        redirect_to reservation_success_path 
            
      else
        redirect_to :back, :notice => "Please fill out the field correctly."
      end
    end 
  
    def show_manila_students    
        @getsubsched = ManilaSubSched.friendly.find(params[:id])
        @getmanilasched = ManilaSched.find(@getsubsched.manila_sched_id)  
        @manilastudents = ManilaStudent.where(:manila_sched_id => @getsubsched.id).page(params[:page]).per_page(3)
        @pendings = @manilastudents.where(:status => 0)
        @reserved = @manilastudents.where(:status => 1)
    end

    def edit    
        @getstudent = ManilaStudent.find(params[:id])  
        @getsubsched = ManilaSubSched.find(@getstudent.manila_sched_id) 
        @getmanilasched = ManilaSched.find(@getsubsched.manila_sched_id)  
    end  


    def update 
        @getstudent = ManilaStudent.find(params[:id])
        @manilasubsched = ManilaSubSched.find(@getstudent.manila_sched_id)
        @teacher = TeacherInformation.where(:branch => "manila")

        if @getstudent.status == 1
          if @getstudent.update_columns(:status => 0) && @manilasubsched.update_columns(:ms_slots => @manilasubsched.ms_slots + 1)
            UpdateReservation.manila_student(@getstudent,@manilasubsched,@teacher).deliver_now
            redirect_to :back, :notice => "Updated status successfully"
          else
            redirect_to :back, :notice => "Updating status failed"
          end
        else 
          if @getstudent.update_columns(:status => 1) && @manilasubsched.update_columns(:ms_slots => @manilasubsched.ms_slots - 1)
            redirect_to :back, :notice => "Updated status successfully"
          else
            redirect_to :back, :notice => "Updating status failed"
          end 
        end
    end 

    def destroy
        @deletestudent = ManilaStudent.find(params[:id]) 

        if @deletestudent.destroy 
          redirect_to :back, :notice => "Deleted Student Successfully"
        else
          redirect_to :back, :notice => "Deleting Student Failed"
        end
    end  

    private

    def student_params
      params.require(:manila_student).permit(:firstname, :middlename, :lastname, :age, :contactnumber, :emailaddress, :address, :datereserved, :dateexpired, :manila_sched_id, :status, :payment_scheme, :agreed)
    end
end