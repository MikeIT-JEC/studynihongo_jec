Rails.application.routes.draw do     

  root 'mains#index'

  # teacher
  get                'admin/teachers'  => 'teachers#index'
  get            'admin/teachers/new'  => 'teachers#new'
  get        'admin/edit-teacher/:id'  => 'teachers#edit'
  get             'admin/teachers/:id' => 'teachers#destroy'

  get     'teachers/qualification/:id' => 'teacher_qualifications#destroy'
  get        'teachers/background/:id' => 'teacher_backgrounds#destroy'
  
  # inquiry
  get                'admin/inquiries' => 'inquiries#index'

  # manila
  get               'manila/dashboard' => 'manilascheds#index'  
  get            'manila/new_schedule' => 'manilascheds#new'   
  get       'manila/edit-schedule/:id' => 'manilascheds#edit'
  patch   'manila/update-schedule/:id' => 'manilascheds#update'
  get     'manila/delete-schedule/:id' => 'manilascheds#destroy'

  # submanilasched
  get            'manila/schedule/:id' => 'manila_sub_scheds#new'  
  get       'manila/schedule/edit/:id' => 'manila_sub_scheds#edit'
  get     'manila/schedule/delete/:id' => 'manila_sub_scheds#destroy' 
  patch   'manila/schedule/update/:id' => 'manila_sub_scheds#update'

  # manila students
  get 'manila-schedule/edit-student/:id' => 'manila_students#edit'    
  get         'manila-schedules/:id/:id' => 'manila_students#new'      
  get              'manila-students/:id' => 'manila_students#show_manila_students'
  get        'delete-manila-student/:id' => 'manila_students#destroy' 

  # cebu
  get                 'cebu/dashboard' => 'cebuscheds#index'  
  get              'cebu/new_schedule' => 'cebuscheds#new'   
  get         'cebu/edit-schedule/:id' => 'cebuscheds#edit'
  patch     'cebu/update-schedule/:id' => 'cebuscheds#update'
  get       'cebu/delete-schedule/:id' => 'cebuscheds#destroy' 

  # subcebusched
  get              'cebu/schedule/:id' => 'cebu_sub_scheds#new'  
  get         'cebu/schedule/edit/:id' => 'cebu_sub_scheds#edit'
  get       'cebu/schedule/delete/:id' => 'cebu_sub_scheds#destroy' 
  patch     'cebu/schedule/update/:id' => 'cebu_sub_scheds#update'

  # cebu students
  get 'cebu-schedule/edit-student/:id' => 'cebu_students#edit'    
  get         'cebu-schedules/:id/:id' => 'cebu_students#new'     
  get            'cebu-students/:id' => 'cebu_students#show_cebu_students'
  get        'delete-cebu-student/:id' => 'cebu_students#destroy' 

  # articles admin
  get                'admin/articles/' => 'articles#index'
  get             'admin/articles/new' => 'articles#new'
  get             'admin/articles/:id' => 'articles#show'
  get        'admin/articles/:id/edit' => 'articles#edit'
  delete   'admin/articles/:id/delete' => 'articles#delete'
  mount               Ckeditor::Engine => '/ckeditor'

  # articles main
  get                      '/articles' => 'main_articles#index'
  get                   'articles/:id' => 'main_articles#show'

  # main dashboards
  get                'admin/dashboard' => 'dashboards#index'

  # main
  get                  'payment-terms' => 'mains#payment_terms'
  get                 'cebu-schedules' => 'mains#cebuschedule'
  get             'cebu-schedules/:id' => 'mains#show_cebu'
  get               'manila-schedules' => 'mains#manilaschedule'
  get           'manila-schedules/:id' => 'mains#show_manila'
  get            'reservation-success' => 'mains#success'
 
  # sessions
  get                         "logout" => "sessions#destroy"
  get                     'ncrs/login' => 'sessions#new'
  get                   'ncrs/sign_up' => 'admins#new'

  resources :sessions
  resources :admins 
  resources :password_resets 

  # teachers information
  resources :teachers
  resources :teacher_qualifications
  resources :teacher_backgrounds

  # articles
  resources :articles

  # cebu
  resources :cebuscheds 
  resources :cebu_sub_scheds 

  # manila
  resources :manilascheds 
  resources :manila_sub_scheds 

  # inquiry
  resources :inquiries

  # cebu students
  resources :cebu_students

  # manila students
  resources :manila_students

  # main
  resources :mains
 
end
