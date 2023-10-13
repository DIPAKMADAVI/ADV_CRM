
class BusinessDetail < ApplicationRecord

     def self.ransackable_attributes(auth_object = nil)
         []
       end
       
       def self.ransackable_associations(auth_object = nil)
        []
      end
      
      belongs_to :customer_info, foreign_key: :customer_id
      has_many :selected_plans, class_name: 'SelectedPlan'
      # has_many :advertisement_plans, class_name:'AdvertisementPlan', foreign_keys:'business_detail_id'
      has_many :advertisement_plans, class_name: 'AdvertisementPlan', foreign_key: 'business_detail_id'

    
end
