Rails.application.routes.draw do
  
# routings for contacts_lead controllers  
  get 'contact_lead_index', to: 'contact_lead#index'
  get 'potential_clients', to: 'contact_lead#potential_clients'
  get 'follow_up_activities', to: 'contact_lead#follow_up_activities'
  get 'convert_contact', to: 'contact_lead#convert_contact'
  get 'activity_cracking', to: 'contact_lead#activity_cracking'
  get 'contact_analytics', to: 'contact_lead#contact_analytics'
  get 'potential_clients', to: 'contact_lead#potential_clients'


 # routings for creativity controllers 
  get 'creativity_index' , to: 'creativity#index'
  get 'creativity_progress' , to: 'creativity#creativity_progress'
  get 'export_publishing' , to: 'creativity#export_publishing'
  get 'design_graphics' , to: 'creativity#design_graphics'
  get 'dept_Collaboration' , to: 'creativity#dept_Collaboration'

# routing for campiagine 
  get 'campaign_index', to: 'campaign#index'
  get 'create_campaigin', to: 'campaign#create_campaigin'
  get 'campaign_Progress', to: 'campaign#campaign_Progress'
  get 'capmaign_analytics', to: 'campaign#capmaign_analytics'
  get 'campaign_test', to: 'campaign#test'
  get 'fetch_records_for_camp/:id', to: 'campaign#fetch_records_for_camp'


#routing for advertisement plan 
  get 'adver_action_index',to: 'adver_action#index'
  get 'adver_action_update_adver',to: 'adver_action#update_adver'
  get 'adver_action_view_adver',to: 'adver_action#view_adver'
  get 'adver_action_delete_adver',to: 'adver_action#delete_adver'
  get 'adv_Plan_for_edit',to: 'adver_action#adv_Plan_for_edit'

#routing for 
  get  'pricing_index', to: 'pricing#index'
  post 'pricing_create', to: 'pricing#create'
  get 'submedia_for_pricing', to: 'pricing#submedia_for_pricing'
  post  'pricing_update', to: 'pricing#update'
  get  'pricing_remove', to: 'pricing#remove'


  get  'user_index', to: 'user#index'
  post 'user_create', to: 'user#create_user'
  get  'user_remove', to: 'user#remove_user'
  post 'user_update', to: 'user#update_user'


  get 'customer_index', to: 'customer#index'
  post 'customeradd_cust', to:'customer#add_customer'
  post 'customer_update', to:'customer#update_customer'
  get 'customer_remove', to:'customer#remove_customer'
  get 'details_for_edit/:id', to:'customer#details_for_edit'
  post 'add_advertisement', to:'customer#add_advertisement' 
  get 'get_scheme_data_plan', to:'customer#get_scheme_data_plan'
  get 'fetch_specific_business_data', to: 'customer#fetch_specific_business_data'
  get 'customer_by_state_dist', to:'customer#customer_by_state_dist'
  
  
  get 'media_asset', to: 'media_asset#index'
  post 'add_asset', to: 'media_asset#add_asset'
  get 'remove_asset', to: 'media_asset#remove_asset'
  post 'update_asset', to: 'media_asset#update_asset'


  get 'channel_index', to: 'adv_channel#index'
  post 'adv_channel', to: 'adv_channel#add_channel'
  post 'update_channel', to: 'adv_channel#update_channel'
  get 'remove_channel', to: 'adv_channel#remove_channel'

  
  get 'pricing', to: 'master_configuration#pricing'
  get 'add_channel', to:'master_configuration#adv_channel'
  get 'roles', to:  'master_configuration#roles'
  # post 'adv_channel', to:'master_configuration#adv_channel'

  #  post 'department', to: 'department#index'
  get 'department_test', to: 'department#some_action'
    get 'department', to: 'department#index'
   post 'add_department', to: 'department#add_dept'
   post 'update_department', to: 'department#update_dept'
   get  'remove_dept', to: 'department#remove_dept'
   
  
  get 'dipak/new'
  
  root 'sessions#new'
  post 'login', to: 'sessions#create'
  get 'dipak', to: 'sessions#destroy'
  # delete '/logout', to: 'sessions#destroy',

  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html




  # get 'index', to: 'sumeradmin_dashboard#index'
  # get 'dashboard', to: 'sumeradmin_dashboard#dashboard'
  # get 'campaign_erformance', to: 'sumeradmin_dashboard#campaign_erformance'
  # get 'contact_interactions', to: 'sumeradmin_dashboard#contact_interactions'
  # get 'sales_unnel', to: 'sumeradmin_dashboard#sales_unnel'
  # get 'alerts_and_notifications', to: 'sumeradmin_dashboard#alerts_and_notifications'
  # get 'campaign_calendar', to: 'sumeradmin_dashboard#campaign_calendar'
  # get 'master_config', to: 'sumeradmin_dashboard#master_config'


  
  get 'index', to: 'superadmin_dashboard#index'
  get 'accounts_payments', to: 'superadmin_dashboard#accounts_payments'
  get 'adv_campaign', to: 'superadmin_dashboard#adv_campaign'
  get 'adv_creativity', to: 'superadmin_dashboard#adv_creativity'
  get 'contact_lead', to: 'superadmin_dashboard#contact_lead'
  get 'contacts_user', to: 'superadmin_dashboard#contacts_user'
  get 'dashboard', to: 'superadmin_dashboard#dashboard'
  get 'master_config', to: 'superadmin_dashboard#master_config'
  get 'index1', to: 'superadmin_dashboard#index1'
  get 'help_support', to: 'superadmin_dashboard#help_support'
  get 'report_analytics', to: 'superadmin_dashboard#report_analytics'


end




