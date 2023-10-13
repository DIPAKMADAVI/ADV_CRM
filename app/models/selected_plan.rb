class SelectedPlan < ApplicationRecord


     belongs_to :advertisement_plans, class_name: 'AdvertisementPlan', foreign_key: 'advertisement_detail_id'

     belongs_to :pricings, class_name: 'Pricing', foreign_key: 'price_plan_id'
     belongs_to :business_details, class_name: 'BusinessDetail', foreign_key: 'business_detail_id'     
end
# price_plan_id  business_detail_id