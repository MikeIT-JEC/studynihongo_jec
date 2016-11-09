class MainsController < ApplicationController
    def index
        @galleries             = Gallery.all.order(created_at: :desc).limit(8)
    	@articles 			   = Article.all.order(created_at: :desc).limit(3)
    	@inquiry 			   = Inquiry.new
        
        @cebuschedule          = CebuSched.where(:status => 1)  
        @ceb_availableslots    = CebuSubSched.where(:cebu_sched_id => @cebuschedule.ids)
        @cebusub_slots         = @ceb_availableslots.where(:cs_status => 1).sum(:cs_slots)

        @manilaschedule        = ManilaSched.where(:status => 1)  
        @mnl_availableslots    = ManilaSubSched.where(:manila_sched_id => @manilaschedule.ids)
        @manilasub_slots       = @mnl_availableslots.where(:ms_status => 1).sum(:ms_slots)
    end 
    
    def payment_terms
    end

    def gallery
        @galleries              = Gallery.all.order(created_at: :desc)
    end

    def cebuschedule
        @cebuschedule_active    = CebuSched.where(:status => 1)
        @cebuschedules          = CebuSubSched.where(:cebu_sched_id => @cebuschedule_active.ids) 
        @activesubsched         = @cebuschedules.where(:cs_status => 1)
    end

    def show_cebu
        @showcebusched          = CebuSched.friendly.find(params[:id])
        @showcebusubsched       = CebuSubSched.where(:cebu_sched_id => @showcebusched.id)
        @activecebusubsched     = @showcebusubsched.where(:cs_status => 1) 
    end

    def manilaschedule
        @manilaschedule_active  = ManilaSched.where(:status => 1)
        @manilaschedules        = ManilaSubSched.where(:manila_sched_id => @manilaschedule_active.ids) 
        @activesubsched         = @manilaschedules.where(:ms_status => 1)
    end

    def show_manila
        @showmanilasched        = ManilaSched.friendly.find(params[:id])
        @showmanilasubsched     = ManilaSubSched.where(:manila_sched_id => @showmanilasched.id)
        @activemanilasubsched   = @showmanilasubsched.where(:ms_status => 1) 
    end

end
