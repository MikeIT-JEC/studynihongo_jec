class CebuStudentsController < ApplicationController 
  
	def new
		@cebusched = CebuSubSched.friendly.find(params[:id])
        @showcebusched = CebuSched.find(@cebusched.cebu_sched_id)
		@cebustudent = CebuStudent.new
    end

    def create
    	@cebustudent = CebuStudent.new(student_params)
    	if @cebustudent.save
            if @cebustudent.payment_scheme == "Bank"
                PaymentScheme.bank_payment(@cebustudent).deliver_now
            else
                PaymentScheme.counter_payment(@cebustudent).deliver_now
            end
    		redirect_to reservation_success_path 
            
    	else
    		redirect_to :back, :notice => "Please fill out the field correctly."
    	end
    end 
  
    def show_cebu_students   
        @getsubsched = CebuSubSched.friendly.find(params[:id])
        @getcebusched = CebuSched.find(@getsubsched.cebu_sched_id)  
        @cebustudents = CebuStudent.where(:cebu_sched_id => @getsubsched.id).page(params[:page]).per_page(3)
        @pendings = @cebustudents.where(:status => 0)
        @reserved = @cebustudents.where(:status => 1)
    end

    def edit    
        @getstudent = CebuStudent.find(params[:id])  
        @getsubsched = CebuSubSched.find(@getstudent.cebu_sched_id) 
        @getcebusched = CebuSched.find(@getsubsched.cebu_sched_id)  
    end  


    def update 
        @getstudent = CebuStudent.find(params[:id])
        @cebusubsched = CebuSubSched.find(@getstudent.cebu_sched_id)
        @teacher = TeacherInformation.where(:branch => "cebu")

        if @getstudent.status == 1 
          if @getstudent.update_columns(:status => 0) && @cebusubsched.update_columns(:cs_slots => @cebusubsched.cs_slots + 1)
            UpdateReservation.cebu_student(@getstudent,@cebusubsched,@teacher).deliver_now
            redirect_to :back, :notice => "Updated status successfully"
          else
            redirect_to :back, :notice => "Updating status failed"
          end
        else 
          if @getstudent.update_columns(:status => 1) && @cebusubsched.update_columns(:cs_slots => @cebusubsched.cs_slots - 1)
            redirect_to :back, :notice => "Updated status successfully"
          else
            redirect_to :back, :notice => "Updating status failed"
          end 
        end
    end 

    def destroy
        @deletestudent = CebuStudent.find(params[:id]) 

        if @deletestudent.destroy 
          redirect_to :back, :notice => "Deleted Student Successfully"
        else
          redirect_to :back, :notice => "Deleting Student Failed"
        end
    end  

    private

    def student_params
    	params.require(:cebu_student).permit(:firstname, :middlename, :lastname, :age, :contactnumber, :emailaddress, :address, :datereserved, :dateexpired, :cebu_sched_id, :status, :payment_scheme, :agreed)
    end
end
